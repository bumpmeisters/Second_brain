---
type: source
source_type: youtube-transcript
title: "OSPF From Zero: Let's Build the Internet (Well...Almost) | Summer of CCNA"
source: "https://www.youtube.com/watch?v=HUXUnMbeOyo"
video_id: "HUXUnMbeOyo"
channel_id: "UC9x0AN7BWHpCDHSm9NiJFJQ"
channel: "NetworkChuck"
published_at: "2026-08-06T20:50:06Z"
acquired_at: "2026-08-18T21:34:55.010057Z"
language: "en"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 6381
last_transcript_second: 6372.623
transcript_coverage: 0.998687
transcript_words: 17895
payload_sha256: "f9006771f2a487b574e152bf1ada039206937a2ccbba0642395891289ffb9f49"
---
# OSPF From Zero: Let's Build the Internet (Well...Almost) | Summer of CCNA

## Creator description

Join us for our 90 minute Sumer of CCNA session, today at 5PM ET!

If you haven't signed up for the Summer of CCNA, please visit this page here and let's get started! https://academy.networkchuck.com/course/premium-summer-of-ccna

## Transcript

[00:00:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1s) [music]

[00:00:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=26s) Heat.

[00:00:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=50s) I want

[00:00:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=52s) to

[00:00:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=57s) [music]

[00:01:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=61s) be

[00:01:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=62s) down.

[00:01:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=81s) Hello. Good afternoon, good evening,

[00:01:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=84s) good morning. I think we got all of the

[00:01:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=86s) different time area locations. Welcome

[00:01:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=89s) to another daily check-in for the summer

[00:01:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=91s) of CCNA. My name is Zach. I'm not

[00:01:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=94s) Network Chuck. I'm not Jeremy either,

[00:01:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=96s) but I will be your host today guiding

[00:01:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=98s) you through uh this lesson. We're gonna

[00:01:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=100s) be talking about OPF with Jeremy. If

[00:01:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=102s) you've never been to one of these

[00:01:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=104s) before, welcome and please consider

[00:01:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=108s) joining us on Discord where all of the

[00:01:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=111s) fun communication and uh excitement

[00:01:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=114s) happens and where we hold our giveaways.

[00:01:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=117s) So, if you want to be part of giveaways

[00:02:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=120s) that we'll be doing today, you'll want

[00:02:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=121s) to scan this QR code so that you can

[00:02:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=124s) join us on Discord and be a part of

[00:02:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=126s) those. If you uh are not familiar with

[00:02:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=129s) what we do here, we are doing the summer

[00:02:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=131s) of CCNA and twice a month we do these

[00:02:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=133s) live streams that are open to the

[00:02:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=135s) public. They are open to the entire

[00:02:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=136s) world so you all can kind of get an idea

[00:02:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=139s) of what we're doing, what we're up to

[00:02:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=142s) and all those fun things. Uh we get

[00:02:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=144s) these streams started about 10 minutes

[00:02:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=146s) early just so that everybody can get

[00:02:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=148s) situated, get logged in. Grab your

[00:02:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=151s) notes, your pen, paper if you have them.

[00:02:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=153s) you grab your notion document or

[00:02:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=155s) obsidian or oneote or even notepad if

[00:02:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=160s) that if that's your jam. Uh but anyway,

[00:02:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=164s) welcome everybody. Hope you're having a

[00:02:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=166s) fantastic day.

[00:02:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=168s) Of course, if you don't know what the

[00:02:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=170s) summer of CCNA is, check this out right

[00:02:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=173s) there. There's the summer of CCNA link

[00:02:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=175s) right there. What are these things

[00:02:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=178s) called? Notes. Hello, truck gun. How are

[00:02:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=179s) you doing today? And hello to all of you

[00:03:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=182s) in the chat. Thank you all for being

[00:03:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=184s) here with us. Since we do get these

[00:03:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=187s) started early, if you all have questions

[00:03:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=190s) about anything that we're doing here at

[00:03:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=192s) Network Chuck Academy, throw them into

[00:03:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=194s) the chat. Or if you just have general

[00:03:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=197s) questions about it, like IT career

[00:03:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=202s) questions, I might be able to answer

[00:03:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=204s) those. I might be able to help you out.

[00:03:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=206s) But anyway, we'll be getting started in

[00:03:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=209s) about seven more minutes. Jeremy will be

[00:03:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=211s) joining us so we can walk uh walk

[00:03:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=213s) through some OPF from from start to

[00:03:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=215s) finish.

[00:03:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=218s) Buddy 2 point, this is your question.

[00:03:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=220s) Why don't I win any of the giveaways?

[00:03:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=222s) Because you have terrible luck, my

[00:03:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=224s) friend. I'm sorry. I'm sorry. Can't help

[00:03:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=227s) you there. Maybe next time.

[00:03:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=231s) How can you get a run cmd shirt? You can

[00:03:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=235s) go to the runcmd.store

[00:03:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=238s) and that'll get you a you can get a run

[00:04:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=240s) cmd hat or a shirt or whatever you would

[00:04:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=243s) like at the run command store.

[00:04:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=247s) Mark, your first time here? Welcome.

[00:04:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=250s) Thank you for being here with us. Hello

[00:04:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=252s) from Indonesia. That's fantastic.

[00:04:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=255s) Welcome. Thank you for being here.

[00:04:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=258s) Minions, how do I find my first job or

[00:04:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=259s) internship? Internships. That's a good

[00:04:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=262s) one. If you're in college, it's going to

[00:04:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=263s) be a lot easier for you. But best pro

[00:04:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=266s) advice tip that I have for anybody

[00:04:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=268s) looking for an internship is to start

[00:04:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=269s) looking around uh like April, May, March

[00:04:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=274s) even for school districts in your area.

[00:04:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=277s) So, if you go to k12jobspot.com,

[00:04:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=280s) I'll put the link in the uh in the chat.

[00:04:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=283s) that's going to show you like job

[00:04:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=285s) postings for school districts

[00:04:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=287s) specifically, but often they're going to

[00:04:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=290s) post um internships as well because in

[00:04:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=292s) the summertime schools are the most

[00:04:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=295s) busy. If you don't know that, especially

[00:04:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=296s) in the United States of America, schools

[00:04:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=299s) uh oftentimes during the summer there's

[00:05:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=301s) no kids there and that's when IT

[00:05:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=303s) departments get get most of their work

[00:05:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=305s) done. So, they often hire interns during

[00:05:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=308s) that time.

[00:05:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=311s) Uh, global spectre, you're 14. Is CCNA

[00:05:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=316s) good for you? Yeah, if you want to go

[00:05:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=318s) ahead and tackle that at 14, you

[00:05:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=320s) absolutely can do that. Let me add Micah

[00:05:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=324s) to the chat. Hello, Micah. You need to

[00:05:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=325s) change your microphone already. I can I

[00:05:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=327s) hear so much background noise.

[00:05:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=329s) >> Oh, okay. I'll see if I can kill that

[00:05:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=331s) here. Hang on a second. The uh probably

[00:05:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=333s) the air conditioner.

[00:05:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=335s) >> Ah, that's probably what it is.

[00:05:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=336s) >> You need the air conditioner.

[00:05:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=339s) I will sweat this one out for you guys

[00:05:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=340s) because I love you that much.

[00:05:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=344s) >> Uh, simple outdoor, you're struggling to

[00:05:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=347s) retain all of the CCNA commands due to

[00:05:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=349s) working in an enterprise environment

[00:05:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=350s) where you manage everything using DNA

[00:05:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=352s) for the SDA and ACI fabrics. Should you

[00:05:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=355s) skip CCNA and go to encore?

[00:05:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=358s) >> No. [sighs] Yeah. I along that same

[00:06:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=362s) lines there, I don't know that I would

[00:06:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=363s) skip the CCNA still because you're going

[00:06:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=365s) to learn and a lot of these commands

[00:06:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=367s) that you'll need and utilize all the

[00:06:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=368s) time.

[00:06:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=368s) >> Yeah. Yep. Yep. So, what I was going to

[00:06:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=370s) say about that is um weirdly enough with

[00:06:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=373s) Encore because I'm I'm going through it

[00:06:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=375s) is um it's not really commandheavy. It's

[00:06:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=379s) it's more so like

[00:06:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=381s) concept heavy and you have to really

[00:06:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=383s) understand products and you have to know

[00:06:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=385s) like SDWAN solutions, SD access

[00:06:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=387s) solutions, all these different things

[00:06:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=388s) like that. VTEPS, VNI's, and this net

[00:06:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=390s) that and all the other stuff like it's

[00:06:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=392s) really cool, but the vast majority of

[00:06:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=394s) Encore does not touch commands. I mean,

[00:06:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=397s) you you do need to know them, but it's

[00:06:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=399s) um no, if you're going to learn the

[00:06:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=401s) commands, you CCNA is kind of the way to

[00:06:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=403s) get that muscle memory for sure.

[00:06:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=405s) >> Absolutely. And welcome to the stream.

[00:06:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=408s) So, welcome to everybody else. Again, as

[00:06:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=410s) you know, as I stated a couple minutes

[00:06:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=412s) ago, we get these started a few minutes

[00:06:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=413s) early just everybody can get logged in,

[00:06:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=415s) get ready, get situated. We're joined by

[00:06:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=417s) Micah today. Micah is part of uh the

[00:06:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=419s) Network Chuck Academy team. We're both

[00:07:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=420s) part of the Network Chuck Academy team.

[00:07:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=422s) So, um if y'all don't know, that's kind

[00:07:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=424s) of like separate from Network Chuck

[00:07:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=426s) itself. So, we're on like an entirely

[00:07:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=428s) different team than him, but we're all

[00:07:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=429s) part of the same organization at the end

[00:07:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=431s) of the day, but we help support the

[00:07:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=433s) academy side of things. So, the summer

[00:07:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=436s) of CCNA that we're doing right now,

[00:07:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=438s) that's one of those things that we both

[00:07:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=439s) help support and that's that's what

[00:07:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=442s) we're doing today is summer of CCNA

[00:07:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=444s) material where we're talking about OSPF.

[00:07:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=446s) So that's the topic today that Jeremy,

[00:07:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=448s) our dear friend and instructor, our

[00:07:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=451s) fearless leader will be going over,

[00:07:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=453s) teaching us OPF uh from the ground up.

[00:07:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=455s) That was one of the topics uh as we were

[00:07:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=457s) going through our summer of CCNA journey

[00:07:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=460s) that a lot of students said, "Hey, we'd

[00:07:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=462s) really like some more information about

[00:07:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=464s) this. We really would like to dive a

[00:07:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=465s) little bit deeper into this or just kind

[00:07:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=467s) of like let's just go back and make sure

[00:07:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=469s) that we we understand this information."

[00:07:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=471s) So Jeremy put together a whole whole lab

[00:07:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=474s) today to go over this. So you everybody

[00:07:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=476s) is more than welcome to follow along. If

[00:07:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=477s) you haven't signed up for the summer of

[00:07:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=478s) CCNA yet, you absolutely can. Uh it's

[00:08:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=481s) still available uh to to register for.

[00:08:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=483s) You can sign up for free. You can sign

[00:08:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=485s) up as a member premium. But I should

[00:08:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=488s) note I'll tell you a little secret

[00:08:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=492s) little little tiny secret here. Let me

[00:08:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=493s) get rid of this one. Let me throw up an

[00:08:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=497s) the image on the screen.

[00:08:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=500s) This will be easier. It's going to take

[00:08:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=503s) a second to upload.

[00:08:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=506s) I I love using these this. There we go.

[00:08:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=509s) There you go. There's our There's our

[00:08:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=511s) little secret for y'all. So,

[00:08:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=514s) >> I love it.

[00:08:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=515s) >> Stay tuned to social medias near you

[00:08:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=519s) because we will be making a more

[00:08:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=521s) official announcement so you all can

[00:08:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=522s) sign up. But we are going to be doing

[00:08:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=523s) fall in the CCNA. So, much like the the

[00:08:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=526s) summer CCNA, we're going to run at it

[00:08:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=528s) again and uh help you get CCNA

[00:08:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=530s) certified. That's the whole goal of this

[00:08:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=532s) program.

[00:08:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=534s) Yeah. Yeah. It's a uh a great foot in

[00:08:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=537s) the door. Get your uh conversation

[00:08:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=539s) started in your job interviews if

[00:09:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=541s) nothing else. Um you know,

[00:09:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=544s) >> get you some practice.

[00:09:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=546s) >> Blows the doors open. I honestly like is

[00:09:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=548s) that I mean, you haven't yet taken your

[00:09:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=550s) CCNA and I keep on pushing you. What are

[00:09:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=553s) you going to do after you get yours?

[00:09:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=556s) [laughter]

[00:09:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=556s) >> Uh same thing I'm doing now.

[00:09:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=559s) >> Okay. So, there it is. See, that's one

[00:09:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=561s) of the coolest things about the CCNA, at

[00:09:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=562s) least for me anyway, is that you don't

[00:09:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=564s) have to use it just as a network

[00:09:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=566s) engineer. Um, and kind of like my dream

[00:09:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=569s) within dreams would always have been to

[00:09:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=571s) be the guy sitting at the keyboard

[00:09:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=572s) typing away with a CLI and, you know, do

[00:09:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=574s) the do the whole thing with network

[00:09:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=576s) engineering. But it's really it's opened

[00:09:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=578s) the door for me to to to be here with

[00:09:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=580s) you guys today to show you how to do

[00:09:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=582s) CCNA, but there's so much more out there

[00:09:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=584s) to learn and it's just a starting point.

[00:09:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=586s) I mean, that's really what it is. Um,

[00:09:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=588s) get the or don't. I mean, learn the

[00:09:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=590s) stuff because it's it's so valuable. So

[00:09:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=592s) valuable.

[00:09:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=593s) >> So, we don't have the material yet for

[00:09:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=596s) the new CCNA. I don't know why my camera

[00:09:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=597s) went super blurry. Uh but no, we're not

[00:10:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=600s) going to be covering the new one. It's

[00:10:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=601s) going to be a lot of the same material

[00:10:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=603s) as the old one. We're actually

[00:10:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=605s) condensing some of uh the summer of CCNA

[00:10:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=607s) a little bit. Uh but it's still you're

[00:10:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=609s) still going to have kind of that a very

[00:10:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=611s) similar experience. So, if you know

[00:10:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=613s) somebody who missed out, definitely let

[00:10:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=616s) them know that

[00:10:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=618s) because

[00:10:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=619s) >> Yeah, absolutely. Who who in the chat

[00:10:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=621s) knows somebody who's like, "Dang, I

[00:10:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=623s) should have started back in May when

[00:10:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=624s) they started and I just didn't and now I

[00:10:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=626s) feel too far behind."

[00:10:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=628s) >> So, this person as as my I can't say

[00:10:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=632s) your name, but said, "Wait, there's

[00:10:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=633s) going to be another one. They have

[00:10:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=635s) several people that missed the summer

[00:10:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=636s) one. This is fantastic."

[00:10:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=638s) >> Yeah,

[00:10:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=640s) >> it is. I'm I'm very much excited for it.

[00:10:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=643s) So, if you guys are interested in that,

[00:10:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=645s) stay tuned because again, we'll we'll

[00:10:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=647s) announce um more information on that. Of

[00:10:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=650s) course, if you haven't joined us in

[00:10:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=652s) Discord yet, please do that as well. And

[00:10:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=656s) before we begin, before Jeremy gets

[00:10:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=657s) here, I'm sure he's getting all set up.

[00:10:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=659s) I want to give a special shout out to

[00:11:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=664s) our partners and friends over at

[00:11:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=666s) Skillbit. So, if you're not familiar

[00:11:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=669s) with SkillBit, they uh they host online

[00:11:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=672s) virtual labs and uh and practice exams

[00:11:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=675s) or not practice exams, but cra practice

[00:11:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=678s) labs is what I should say. Uh but we

[00:11:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=681s) partnered with Skillbit so that they can

[00:11:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=683s) offer us their virtual environment. So,

[00:11:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=686s) we utilize Skillbit for all of our

[00:11:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=688s) virtual labs throughout your summer of

[00:11:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=689s) CCNA journey and for our new journey

[00:11:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=692s) that's going to be coming up. We'll be

[00:11:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=694s) utilizing Skillbit as well, I believe.

[00:11:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=696s) um they've been very reliable for us as

[00:11:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=698s) far as connectivity and um everything

[00:11:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=701s) functioning. If I think if something

[00:11:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=703s) wasn't working properly, it was

[00:11:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=705s) something that maybe we may have done or

[00:11:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=707s) something. But it Skillbit has just been

[00:11:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=709s) I think excellent with uh supporting us

[00:11:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=712s) and supporting you guys throughout that

[00:11:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=714s) journey. So if you haven't yet, please

[00:11:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=717s) please uh go visit Skillbit, tell them

[00:11:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=719s) we sent you, say hello to them, go

[00:12:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=721s) follow them on the social media. And

[00:12:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=724s) Jeremy, are are you with us?

[00:12:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=726s) >> I think he's trying to be. He's He's

[00:12:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=728s) with us in spirit.

[00:12:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=730s) >> He He done broke it.

[00:12:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=732s) >> Yeah, I Well, maybe. I The thing is

[00:12:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=734s) though, uh Jeremy's video is not

[00:12:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=737s) supported by Skill Bit and you can tell

[00:12:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=738s) immediately.

[00:12:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=740s) >> Yeah. Yeah. So, well, [laughter]

[00:12:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=743s) it was the funny thing is So, it's it's

[00:12:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=745s) funny. Not funny. Yesterday, I

[00:12:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=747s) completely blew up. Let's see if this

[00:12:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=748s) works. No. Uh, I blew up my camera and

[00:12:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=753s) and everything was working after that.

[00:12:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=755s) So, I never even gave a second thought

[00:12:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=757s) about it. And now it decided not to work

[00:12:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=759s) again. So, please hold.

[00:12:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=762s) >> We're uh doing some slight

[00:12:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=764s) troubleshooting.

[00:12:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=765s) >> You got to unplug it, plug it back in

[00:12:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=766s) about seven times, and then you have to

[00:12:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=768s) turn over the USB cable like four

[00:12:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=770s) different times to make sure it's the

[00:12:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=771s) right one.

[00:12:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=772s) >> That's Yeah, binary choice you have to

[00:12:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=774s) get right three times.

[00:12:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=776s) >> Yeah. Especially the USBC cables, you

[00:12:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=778s) know, like those ones. You have to turn

[00:13:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=780s) those like seven times just to get it

[00:13:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=781s) right.

[00:13:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=782s) >> I know you're going to say you're going

[00:13:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=783s) to say hateful things when I say this,

[00:13:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=785s) but I mean Apple was on to something

[00:13:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=786s) with that lightning cable.

[00:13:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=788s) >> No. [laughter]

[00:13:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=790s) >> USBC.

[00:13:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=792s) >> Well, okay. Now, if only they would have

[00:13:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=793s) just upped the speeds on that thing to

[00:13:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=795s) more than USB 2.0. I mean, that

[00:13:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=798s) >> come on.

[00:13:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=799s) >> Yeah.

[00:13:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=800s) >> So,

[00:13:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=801s) >> yeah, we're Hang on. I'm I I think I'm

[00:13:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=804s) gonna have to exit uh exit our stream

[00:13:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=806s) real quick and come back in. Just give

[00:13:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=808s) me give me two seconds. Uh and and uh

[00:13:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=811s) Zach can be wildly entertaining.

[00:13:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=814s) >> Oh, I'm always wildly entertaining. You

[00:13:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=816s) can count on me for

[00:13:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=817s) >> Germany. Got

[00:13:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=820s) >> If y'all haven't joined us in Discord,

[00:13:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=822s) we like to play a fun game uh from time

[00:13:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=824s) to time where I ask you all to post a

[00:13:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=827s) GIF in the Discord chat that uh gives us

[00:13:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=831s) an idea of where you're dialing in from.

[00:13:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=833s) So, I will be the first to go in

[00:13:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=835s) Discord. So, this is just like a fun

[00:13:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=838s) game that we play. You throw a GIF in

[00:14:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=840s) there. We guess where you're from. So, I

[00:14:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=842s) threw a GIF in there. Guess where I'm

[00:14:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=844s) from based on that that GIF that's in

[00:14:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=846s) there or GIF depending on what if you

[00:14:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=848s) really want to get, you know, whatever

[00:14:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=850s) with it. It's always going to be GIF to

[00:14:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=851s) me.

[00:14:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=852s) >> It's a Isn't it a graphics something

[00:14:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=854s) file? So, it would be a

[00:14:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=856s) >> Yes.

[00:14:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=857s) >> Graphic GIF. I don't know. I mean, like

[00:14:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=859s) I could never get down with calling it

[00:14:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=861s) GIF.

[00:14:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=862s) >> Sorry.

[00:14:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=863s) >> It's not peanut butter.

[00:14:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=864s) >> No, it's not. And it's certainly not

[00:14:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=866s) Jify peanut butter because that's not a

[00:14:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=868s) thing.

[00:14:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=869s) >> It's a moving.

[00:14:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=871s) [laughter]

[00:14:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=873s) >> Oh, we got people from all over the

[00:14:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=875s) world.

[00:14:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=876s) >> We got somebody from Middle Earth here,

[00:14:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=878s) it looks like. That's awesome.

[00:14:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=879s) >> No. Yeah, I'm so jealous. I would love

[00:14:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=882s) to go to the Netherlands and visit

[00:14:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=883s) there. They still have like a bunch of

[00:14:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=885s) the Hobbit stuff set up, don't they?

[00:14:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=887s) >> Oh,

[00:14:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=888s) >> I'm sure somebody in the chat could

[00:14:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=889s) answer that.

[00:14:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=890s) >> Hey, hey, look who's here.

[00:14:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=891s) >> Look at that.

[00:14:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=892s) >> Global Jeremy mode. Wait, wait, wait.

[00:14:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=896s) This was Jeremy just a second ago.

[00:14:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=897s) >> Yeah, [laughter]

[00:14:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=899s) >> there we go. Now we've got it. No, the

[00:15:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=901s) funny thing is I have so many video

[00:15:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=903s) devices attached to this computer. I hit

[00:15:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=905s) the uh camera select and it literally

[00:15:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=908s) shot off the whole window with all the

[00:15:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=909s) cameras that I have and I I so it was

[00:15:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=912s) there. It just I couldn't see it to

[00:15:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=914s) select it because whatever. Whatever.

[00:15:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=917s) >> We got it now. We're ready to rock and

[00:15:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=919s) roll.

[00:15:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=920s) >> This will be a fun day. This is gonna be

[00:15:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=923s) This is gonna be a crazy fun day.

[00:15:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=925s) >> I'm excited for it. So, I'll get you

[00:15:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=926s) kicked off. Welcome everybody to another

[00:15:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=929s) daily uh check-in for the summer of

[00:15:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=931s) CCNA. If this is your first time joining

[00:15:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=934s) us, we do these twice a month with

[00:15:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=936s) everybody. We open up our our live

[00:15:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=938s) streams to the public so everybody can

[00:15:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=940s) join us. But throughout the summer of

[00:15:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=941s) CCNA, we check in every single day with

[00:15:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=944s) Jeremy, Chuck, myself, Micah, uh, with

[00:15:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=946s) all of our students just to have the,

[00:15:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=948s) you know, uh, accountability, you know,

[00:15:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=950s) and to help clear up questions that

[00:15:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=953s) students might have to cover topics more

[00:15:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=955s) in depth. And that's what today's topic

[00:15:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=957s) is actually stemming from is that uh,

[00:15:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=959s) our summer CCNA students said, "Hey, we

[00:16:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=962s) really want to learn more about OPF.

[00:16:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=963s) We're we we think we we need more

[00:16:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=966s) material for that." And Jeremy was like,

[00:16:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=967s) "I got you. I got this covered. we're

[00:16:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=970s) gonna take care of you. So, this whole

[00:16:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=972s) session today is about OPF and it's a

[00:16:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=974s) topic that I think is that again a lot

[00:16:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=976s) of our students are excited about. If

[00:16:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=978s) you want to be part of the program, make

[00:16:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=980s) sure you all click on that uh QR code.

[00:16:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=982s) I'll grab a link and throw it in the

[00:16:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=983s) chat as well. U but I did throw out uh

[00:16:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=986s) this image earlier, Jeremy, and I don't

[00:16:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=990s) know if you want to say something about

[00:16:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=991s) this. I'm gonna put it on the screen.

[00:16:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=992s) You ready for it?

[00:16:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=993s) >> I'm I'm ready.

[00:16:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=996s) Oh, yes. Yes. Yes. is uh this is

[00:16:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=999s) happening. So we actually met with uh a

[00:16:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1002s) number of uh students in our summer of

[00:16:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1005s) CCNA program yesterday. Went through

[00:16:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1008s) like okay this was this was honestly the

[00:16:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1011s) coolest thing we've ever done for CCNA.

[00:16:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1013s) Um and I'm not even going to go into all

[00:16:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1015s) the the uh conversation we had. We

[00:16:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1018s) talked for an hour and we said what can

[00:17:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1020s) we do better? and we came away with six

[00:17:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1024s) things uh from that and I said we're

[00:17:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1027s) doing it. So so the we're we're we're

[00:17:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1030s) springing into fall. Uh we're we're

[00:17:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1033s) jumping into fall fall of CCNA. Um it

[00:17:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1036s) starts September 14th and what we're

[00:17:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1038s) doing is in a nutshell a condensed

[00:17:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1041s) version of what we're doing here because

[00:17:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1043s) this will be the last um the last run

[00:17:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1047s) that we have before the CCNA gets a

[00:17:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1049s) complete reface from Cisco. Some of you

[00:17:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1051s) know CCA CCNA is on the slate for a redo

[00:17:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1055s) with AI uh now integrated into into that

[00:17:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1058s) sort of thing. Um so I would highly

[00:17:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1061s) encourage you to go after your CCNA and

[00:17:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1063s) get it before that redo happens. Um, and

[00:17:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1067s) then you've you've got it for and to

[00:17:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1069s) answer all the question, no, nobody is

[00:17:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1071s) like, "Oh, you went after it's just you

[00:17:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1073s) have a CCNA." Like that's you you get

[00:17:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1076s) that uh that credential. And so

[00:17:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1078s) >> don't wait is the thing. Like you don't

[00:18:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1080s) have to wait. And I think that like

[00:18:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1082s) that's something that a lot of people

[00:18:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1083s) struggle with, especially when they see

[00:18:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1085s) like, "Oh, there's a new CCNA coming

[00:18:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1086s) out. I should just wait for the new

[00:18:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1088s) one." No.

[00:18:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1089s) >> Why would you wait? You have up until

[00:18:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1090s) the the very day before the new CCNA

[00:18:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1093s) comes out to still obtain a CCNA. And

[00:18:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1096s) even though that's technically the older

[00:18:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1098s) one, it's still valid for three years

[00:18:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1100s) from the day that you take it. So it's

[00:18:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1103s) still relevant. And nobody, no employer

[00:18:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1105s) out there is looking at your CCNA and

[00:18:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1107s) saying, "Well, this is, you know, six

[00:18:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1109s) versions ago. This this doesn't matter

[00:18:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1110s) to us now." No, they're looking at it

[00:18:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1112s) and saying, "Oh, you have the CCNA.

[00:18:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1114s) That's it. You check the box." Does not

[00:18:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1116s) matter. Which

[00:18:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1117s) >> yes, the fall of CCNA. Oh, no.

[00:18:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1121s) Not that way. But uh you get so we are

[00:18:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1125s) going after it and and yeah, we're we're

[00:18:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1129s) literally still building the program

[00:18:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1130s) again this time. Uh because I I put six

[00:18:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1134s) prerogatives from our feedback call that

[00:18:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1136s) I said we'll do this better this next

[00:18:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1138s) time because you can always get better.

[00:19:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1140s) Uh and it will be it will be awesome. So

[00:19:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1143s) more on that later because Okay. So I

[00:19:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1145s) got I gotta go. I gotta go. U we're

[00:19:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1148s) gonna run out of time here.

[00:19:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1149s) >> Yeah.

[00:19:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1149s) >> Yeah. So, so, um, this is going to be an

[00:19:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1152s) adventure. One of the things that we

[00:19:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1154s) were talking about in, um, our

[00:19:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1158s) conversation, I'm going to share my

[00:19:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1159s) screen real quick. Um, and I'm going to

[00:19:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1160s) share my main monitor now. So, if I'm

[00:19:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1162s) looking over here, guys, I'm looking at

[00:19:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1164s) you looking here. I'm actually looking

[00:19:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1166s) at what you are going to see exactly

[00:19:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1168s) right now. Um so so one of the feedback

[00:19:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1172s) pieces that we got from uh students

[00:19:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1175s) yesterday they they said the the live

[00:19:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1178s) streams have been incredible um but we

[00:19:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1181s) actually like it when things break

[00:19:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1182s) [laughter]

[00:19:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1183s) when things don't go right you know and

[00:19:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1185s) I was like okay interesting but but

[00:19:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1187s) that's the thing is I mean there's been

[00:19:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1189s) [laughter] I'm not going to say it

[00:19:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1190s) intentionally but there's been so much

[00:19:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1192s) that has gone wrong in the live streams

[00:19:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1194s) because they're live literally uh

[00:19:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1196s) sometimes the you know the lab isn't set

[00:19:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1198s) up Right. And so we go into

[00:20:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1200s) troubleshooting mode. Um which as an

[00:20:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1202s) instructor, you know, presenting is it's

[00:20:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1205s) one of those like okay um but but it

[00:20:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1208s) it's a learning adventure for all of us.

[00:20:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1210s) And so what I decided to do for this OPF

[00:20:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1212s) and I literally did this one hour ago

[00:20:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1215s) because I was like I'm doing it. So we

[00:20:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1217s) live in the land of AI. So I drew I I

[00:20:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1220s) built this topology. This is in Cisco

[00:20:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1222s) Modeling Labs which by the way you can

[00:20:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1224s) get and you can deploy for free. You

[00:20:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1226s) grab VMware Workstation all that kind of

[00:20:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1227s) stuff. you get up to five nodes in the

[00:20:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1229s) the free version. Um, so I built this

[00:20:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1232s) topology in here. Um, put all of the the

[00:20:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1236s) IP addressing, everything like that,

[00:20:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1238s) snapshot it, threw it into Claude. Um,

[00:20:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1241s) and then fed it in what what I'm going

[00:20:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1243s) to call the uh, Academy Lab mindset,

[00:20:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1247s) which means this isn't step by step.

[00:20:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1250s) You're not you're not going to get the

[00:20:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1251s) commands in bold like type this, do

[00:20:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1252s) this. I want this to be just like it is

[00:20:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1255s) in the real world when you are doing

[00:20:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1257s) that. And Claude was like, I got you.

[00:21:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1260s) And it generated what I'm about to show

[00:21:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1262s) you right here. Uh the hard hat lab uh

[00:21:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1266s) the Zion uplink. And in in in short um I

[00:21:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1269s) have not even I I so I scrolled down

[00:21:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1272s) just to make sure it wasn't crazy and I

[00:21:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1274s) was like this is actually pretty good.

[00:21:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1277s) Um, so this is going to be a complete

[00:21:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1279s) end toend configuration of OPF in a I

[00:21:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1283s) would say midsize to large network

[00:21:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1285s) environment. Um, and we're going to do

[00:21:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1289s) it in terms of a scenario-based thing to

[00:21:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1292s) where it's it's exactly like you like

[00:21:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1294s) you don't get to a job and somebody's

[00:21:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1296s) like, "Okay, I would like you to

[00:21:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1298s) configure OPF. Please use process ID

[00:21:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1301s) number one and ensure that like like

[00:21:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1303s) that's not real that you [laughter] you

[00:21:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1305s) get you get like okay we're in I mean I

[00:21:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1309s) of course I used the Matrix characters

[00:21:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1311s) and Claude picked up on that. I'm like

[00:21:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1313s) good job Claude to where I was like all

[00:21:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1314s) right we're building Zion the last human

[00:21:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1318s) city if you uh have seen the Matrix.

[00:22:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1320s) >> Are you are we going to share that

[00:22:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1321s) document that you have there Jeremy?

[00:22:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1322s) >> Yeah. Oh yeah.

[00:22:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1323s) >> If you share it with me I'll get it

[00:22:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1326s) uploaded right now. Actually, let me um

[00:22:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1328s) let me [clears throat] that right now

[00:22:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1330s) because I know some uh some some people

[00:22:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1332s) will want that and uh so let me

[00:22:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1334s) >> let me just do this.

[00:22:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1337s) >> Uh that'll make it really easy.

[00:22:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1340s) >> Uh good. And I will send that to you

[00:22:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1345s) as I as I splash our entire company into

[00:22:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1348s) the uh into the internet space. Uh

[00:22:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1354s) Zack right here. So there you go. So

[00:22:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1356s) yeah, I didn't even again this all came

[00:22:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1358s) together just now. Um, so here's what

[00:22:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1361s) we're gonna do now. Now Claude also said

[00:22:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1363s) if you're trying to do this in one

[00:22:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1365s) 90minute live stream, you're insane. It

[00:22:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1367s) literally said that [laughter]

[00:22:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1368s) and it said uh you will need to have at

[00:22:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1371s) least three 90 minute. I was like here.

[00:22:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1372s) No, Claude, you're insane. That's what

[00:22:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1374s) I'm saying. So here's here's what here's

[00:22:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1377s) what we got. So let me first off outside

[00:22:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1379s) of the lab, I want to introduce you to

[00:23:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1380s) the topology.

[00:23:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1382s) So, first off, this is a a uh a typical

[00:23:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1387s) network diagram that you would see. Now,

[00:23:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1390s) uh in the the land of OPF, area zero is

[00:23:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1393s) always the first area that you're going

[00:23:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1394s) to create. It's known as your backbone

[00:23:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1396s) area, but we'll get to that. That's the

[00:23:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1398s) lab. Um I just want to show you like

[00:23:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1400s) we've got these routers. Now, I gave

[00:23:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1402s) them numbers as well because sometimes

[00:23:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1403s) it's easier to refer to uh by number.

[00:23:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1406s) So, we've got Trinity, Neo, Router 2,

[00:23:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1409s) Router 3, etc., etc., etc. But these are

[00:23:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1411s) actually offices. So this this could be

[00:23:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1413s) a router that that powers a data center.

[00:23:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1415s) And then back here are the VLANs of the

[00:23:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1418s) data center that has all of the servers

[00:23:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1420s) that Morpheus has. Or over here I have

[00:23:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1423s) fresh cookies because if you've seen the

[00:23:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1425s) matrix, you know that the Oracle is huge

[00:23:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1427s) on fresh cookies. Bring brings the fresh

[00:23:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1429s) cookies out. So she's running a cookie

[00:23:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1430s) shop and she's got all of these little

[00:23:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1432s) uh you know VLANs over here that that um

[00:23:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1435s) the Oracle, right? These are offices.

[00:23:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1437s) This could be uh an uplink to this could

[00:24:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1440s) be the headquarters where all of the uh

[00:24:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1442s) Zion off you know this could be office

[00:24:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1444s) one this could be office two everybody's

[00:24:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1446s) connecting back to the backbone which is

[00:24:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1449s) Zion I'm just I'm giving you kind of a a

[00:24:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1453s) uh from the dust to lay of the land of

[00:24:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1455s) what we have here and so with that

[00:24:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1457s) context let's look at the lab so uh

[00:24:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1461s) first off phase one getting online

[00:24:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1463s) Morpheus to the new operator none of

[00:24:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1466s) this is running a routing protocol yet.

[00:24:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1468s) We've been getting by on static routes

[00:24:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1470s) and it's a mess. I want every device on

[00:24:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1472s) this diagram, including everyone's loop

[00:24:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1474s) backs, to be able to reach every other

[00:24:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1476s) device. Don't worry about splitting

[00:24:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1478s) things into areas yet. We're not ready

[00:24:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1479s) for that conversation. That's cool. Uh,

[00:24:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1482s) just get it all talking and we'll make

[00:24:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1484s) sure I can tell my devices apart from

[00:24:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1486s) everyone else's by more than just luck.

[00:24:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1488s) So, here we go. Requirement one, add the

[00:24:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1491s) loop back IP addresses based on router

[00:24:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1493s) numbers. uh like router one is 1111 and

[00:24:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1496s) so on. Um every router in the topology

[00:24:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1499s) must be able to reach every other

[00:25:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1500s) router's interface including loopax

[00:25:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1503s) using a single dynamic routing protocol.

[00:25:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1506s) And requirement two every router's

[00:25:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1509s) identity on the network should be

[00:25:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1511s) something that you chose on purpose not

[00:25:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1514s) whatever happen whatever the router

[00:25:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1515s) happened to pick.

[00:25:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1517s) >> Okay,

[00:25:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1519s) good so far. I'm seeing Micah nod over

[00:25:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1520s) there. Yeah.

[00:25:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1521s) >> So so uh so let's do it. So,

[00:25:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1524s) >> I was just checking a part in my head

[00:25:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1525s) here. I'm like, okay, so we're we're

[00:25:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1526s) defining router ID. Like, okay, cool.

[00:25:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1530s) Let's do it.

[00:25:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1531s) >> Yes, I now I am I did see a question.

[00:25:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1534s) Someone said, "Where's Chuck?" Chuck is

[00:25:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1535s) at Defcon. Um, so he's out. And

[00:25:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1537s) [laughter] most important thing, uh,

[00:25:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1540s) Pink Calico's also saying there is no

[00:25:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1542s) spoon.

[00:25:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1542s) >> There is no spoon.

[00:25:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1544s) >> Absolutely not. So, that said, we're

[00:25:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1546s) going to set this all up. Now, I know

[00:25:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1548s) I've got the multi area going here,

[00:25:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1549s) which by the way, that's a tiptoe into

[00:25:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1552s) CCNP. In CCNA, you only need single area

[00:25:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1555s) OPF, but we'll we'll we'll tiptoe a

[00:25:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1557s) little bit, right? So, uh we're first

[00:26:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1560s) going to configure single area OPF.

[00:26:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1562s) Morpheus said do it on everything. So,

[00:26:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1564s) let's go. I'm going into uh Morpheus.

[00:26:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1567s) First off, font size. Is that okay to

[00:26:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1569s) see uh for you guys, Zach?

[00:26:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1572s) >> I can see it just fine.

[00:26:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1573s) >> Yeah, should be all right. could be a

[00:26:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1576s) little bit bigger, but it's fine.

[00:26:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1578s) >> All right,

[00:26:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1578s) >> there you go.

[00:26:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1579s) >> There we go. All right, so I'm gonna do

[00:26:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1581s) a show ip interface brief. My favorite

[00:26:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1583s) command in all Cisco. There is Morpheus.

[00:26:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1586s) Uh, now again, I'm going to go back to

[00:26:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1587s) the diagram. I'm I'm always going to

[00:26:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1589s) flash back and forth. Morpheus is

[00:26:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1591s) sitting over here. One connection up to

[00:26:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1593s) the 192168 one WAN link, one connection

[00:26:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1596s) down here to 168.2, right? Um, and we've

[00:26:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1600s) got a whole bunch of loop backs that we

[00:26:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1601s) see on there as well. Okay, so let's

[00:26:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1603s) let's get uh first off the loop back IP

[00:26:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1606s) address configured. Uh so we'll do

[00:26:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1608s) interface loop back uh and you can make

[00:26:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1611s) up 2 bill147,483,647

[00:26:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1616s) loop backs. Um we'll choose zero. We'll

[00:26:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1618s) go [laughter] basic IP address uh

[00:27:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1621s) 1.1.1.1 because that's and and we'll use

[00:27:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1625s) uh some people call this a host mask 255

[00:27:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1627s) 255 255 255. Um, the reason that you do

[00:27:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1631s) that in OPF is because when you go into

[00:27:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1635s) router OPF1, which is the process ID,

[00:27:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1638s) right? Um, it's going to just pick an IP

[00:27:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1641s) address at random uh for its router ID.

[00:27:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1644s) It's kind of like its name to OPF. So,

[00:27:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1647s) I'm I'm going to do exactly what

[00:27:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1649s) Morpheus told us to. It said each

[00:27:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1650s) router's ID identity, excuse me, on the

[00:27:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1654s) network should be something you chose on

[00:27:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1655s) purpose, not whatever the router

[00:27:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1657s) happened to pick. So in OPF we'll type

[00:27:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1660s) in router- ID and you type in 1.1.1.1.1.

[00:27:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1665s) Now if you don't do that, it will

[00:27:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1668s) actually go and pick the highest IP

[00:27:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1671s) address on your router as the router ID.

[00:27:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1674s) Now I I will I will preface that by

[00:27:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1676s) saying the highest loop back IP address,

[00:27:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1679s) meaning loop backs are like your your uh

[00:28:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1682s) jack in in spades, right? It it always

[00:28:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1684s) trumps. It's it's the wild card. So the

[00:28:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1687s) loop it'll be the high. So this would be

[00:28:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1689s) the router ID um if I wouldn't have

[00:28:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1692s) typed in that command. Right? So got the

[00:28:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1694s) new router ID. It says it will take

[00:28:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1695s) effect immediately. That's great. By the

[00:28:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1698s) way, that will reset all your OPF

[00:28:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1700s) relationships if you have OPF running.

[00:28:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1702s) So you don't want to do that. Okay. So

[00:28:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1703s) we're getting uh router OPF running. I'm

[00:28:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1706s) going to do a show ip interface brief.

[00:28:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1709s) Let's do this efficiently. I'm going to

[00:28:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1711s) do uh network 172.16.0.0

[00:28:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1714s) Z with a wildcard mask of 00255255

[00:28:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1719s) which says anything starting with 172.16

[00:28:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1723s) is going to run OPF and then we have to

[00:28:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1726s) type in what area we're putting it in.

[00:28:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1728s) Area zero. Enter. Boom. It's now running

[00:28:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1731s) for the loopax. Okay. Uh actually we

[00:28:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1733s) need to do uh network

[00:28:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1735s) 172 or no uh 1.1.1.1

[00:28:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1739s) 0000 area zero. And by the way, this is

[00:29:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1743s) one way of turning on OPF. Um, I know

[00:29:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1746s) people were requesting when I said I was

[00:29:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1748s) going to build this lab, they said, "Can

[00:29:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1749s) you show the two ways of turning on

[00:29:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1751s) OPF?" Um, so, so as of right now, no OPF

[00:29:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1755s) relationships will form because all I've

[00:29:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1758s) done is turn it on for the loops. Make

[00:29:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1760s) sense, right? So, looking back at this

[00:29:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1763s) diagram, I'm going to say I want to

[00:29:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1765s) start forming relationships here and

[00:29:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1767s) here. Now, I'm gonna turn it on there,

[00:29:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1769s) but relationships won't form because Neo

[00:29:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1772s) nor Oh, I made it a little bigger. Hang

[00:29:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1774s) on. Nor

[00:29:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1777s) uh I'm gonna have to shrink it. There we

[00:29:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1780s) go. Nor Trinity are going to be able to

[00:29:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1784s) uh they're they're not running OPF yet,

[00:29:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1786s) right? So, let me show you the other

[00:29:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1789s) way. So, this is one way of turning on

[00:29:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1791s) OPF on the router, right? It's running

[00:29:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1793s) for those those interfaces. I'll exit

[00:29:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1795s) back out into Ethernet0.

[00:29:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1798s) And this is the other way. I can type in

[00:30:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1800s) ipospf.

[00:30:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1802s) Um, and then we type in the process ID.

[00:30:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1804s) Um, you can type in a lot of things, but

[00:30:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1806s) I'll say process ID 1 area zero. Right.

[00:30:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1810s) Exit back out. So that turned on OPF for

[00:30:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1814s) Ethernet 0. Now I'll type in interface

[00:30:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1817s) Ethernet 01. Hit the up arrow and hit

[00:30:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1821s) enter. There. Those are now running OPF.

[00:30:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1823s) And remember, it's the same function as

[00:30:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1825s) the network command that we used. Uh

[00:30:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1827s) it's just in my opinion a little easier

[00:30:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1830s) to go interface by interface. All right,

[00:30:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1833s) Morpheus is running OPF. I'm going to do

[00:30:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1836s) a show ipospf

[00:30:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1838s) and I can see a whole bunch of

[00:30:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1840s) information. It says uh I am OPF1 with

[00:30:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1844s) router ID 1111. That's its name, right?

[00:30:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1847s) Uh start time, time elapse, blah blah

[00:30:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1849s) blah. A whole bunch of information about

[00:30:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1851s) OPF. We can simply say it's running, but

[00:30:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1854s) right now it's inactive because it has

[00:30:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1857s) no neighbors. It needs some friends. So,

[00:31:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1861s) let's go over to let's go with the Neo

[00:31:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1863s) router. Neo first. Uh, so we've got

[00:31:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1865s) Ethernet 01 and Ethernet 0.

[00:31:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1869s) Uh, let's do it. So, Neo, hop on over

[00:31:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1872s) there. We'll follow exactly what

[00:31:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1874s) Morpheus showed us to do. Uh, it said we

[00:31:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1877s) need a loop back interface. So interface

[00:31:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1879s) loop back zero IP address 2.2.2.2

[00:31:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1883s) 2555255255255

[00:31:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1885s) again that's the host route. Now let me

[00:31:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1887s) let me also I want to make sure I

[00:31:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1889s) mention this. You don't have to have

[00:31:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1891s) that loop back IP address to use it as

[00:31:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1893s) the router ID. I could just come back

[00:31:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1896s) here and type in router OPF1 and type in

[00:31:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1899s) router ID

[00:31:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1901s) uh 2.2.2.2

[00:31:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1904s) and even without the loop back that

[00:31:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1906s) would still work. that would still be

[00:31:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1908s) the name. The benefit of having a loop

[00:31:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1910s) back, the reason we do that is so you

[00:31:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1912s) can actually ping it. I can ping the

[00:31:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1915s) router by router ID if I have an actual

[00:31:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1917s) IP address assigned to it. Cool. So, let

[00:32:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1921s) me do this. I'm going to I'm going to uh

[00:32:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1923s) configure.

[00:32:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1925s) Wait a sec. I said Neo. How am I on

[00:32:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1928s) Trinity?

[00:32:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1930s) Am I going off the rails? Did Neo

[00:32:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1932s) disappear?

[00:32:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1934s) I think I I must have clicked the wrong

[00:32:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1936s) thing. Hang on. Let's bring I think I've

[00:32:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1938s) got I've got the wrong loop back on

[00:32:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1940s) here. People said they want to

[00:32:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1942s) troubleshoot.

[00:32:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1943s) >> There we go.

[00:32:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1945s) >> Uh all right. So, uh so we've got uh

[00:32:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1948s) we've got Trinity that's now acting as

[00:32:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1950s) router 2. That's not good. So, uh let's

[00:32:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1952s) hit the up arrow and do router ID

[00:32:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1955s) 3.33.3.

[00:32:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1957s) Exit back out. Interface loop back zero.

[00:32:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1960s) Uh no IP address and IP address 3333.

[00:32:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1967s) 255 255255.0.

[00:32:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1970s) Okay. So, we'll configure Trinity first

[00:32:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1972s) is is what it looks like. So, I want to

[00:32:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1973s) configure Trinity and and Zach, Micah,

[00:32:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1975s) this is back to you. Um once I'm done

[00:32:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1977s) here, I'm going to take a breath. I

[00:32:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1979s) should have gotten water. Um that's

[00:33:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1981s) okay. Uh and take any questions that you

[00:33:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1984s) guys have. So, please, if you're if

[00:33:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1985s) you're watching, you're like, "Okay,

[00:33:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1987s) like this is this is I would say basic

[00:33:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1989s) basic OPF gets." Um so please ask

[00:33:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1992s) questions at the basics because if you

[00:33:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1994s) don't catch these uh when we get more

[00:33:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1996s) advanced it gets more difficult. All

[00:33:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=1997s) right so Ethernet 01. So so let's do a

[00:33:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2000s) uh a click in here for trinity do show

[00:33:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2003s) ip interface brief. Um and we've got

[00:33:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2006s) those two. So we'll do uh let's exit out

[00:33:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2009s) of the loop back mode. I'll do interface

[00:33:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2011s) Ethernet zero zero and we'll use the

[00:33:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2012s) easy way uh IPOPF process ID 1 area

[00:33:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2017s) zero. Um, and then we'll go to

[00:33:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2021s) Ethernet01 and do the same thing. And

[00:33:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2024s) again, that replaces

[00:33:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2026s) the network command. I don't have to use

[00:33:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2028s) the network command if I do this. And

[00:33:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2030s) boom, Trinity has formed a neighbor.

[00:33:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2033s) Hello, Morpheus. I'm going to go back

[00:33:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2035s) and type in show ipospf neighbor. Boom.

[00:33:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2039s) We see Trinity. Neighbor ID is 111.

[00:34:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2043s) That's the name of the router to OPF.

[00:34:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2045s) And you can see right here, if I scroll

[00:34:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2047s) this down, that's Trinity talking to

[00:34:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2049s) Morpheus. And you can see Morpheus

[00:34:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2052s) actual IP address is 192.1682.2

[00:34:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2055s) right there. Right. So I'll come back up

[00:34:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2057s) here and verify. Yep, that's the IP

[00:34:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2060s) address of Morpheus. And the last but

[00:34:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2063s) not least, I'm going to do a show ip

[00:34:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2064s) route

[00:34:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2067s) and scroll down a little bit. And I can

[00:34:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2070s) see uh right there. I just s I just see

[00:34:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2074s) the O uh it stands out to me right

[00:34:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2075s) there. Those are all the loop backs

[00:34:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2077s) coming from Morpheus. I also see the WAN

[00:34:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2080s) link again. The WAN link that is uh

[00:34:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2083s) right here the 192168.1

[00:34:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2086s) pointing at it. Um that is also being

[00:34:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2088s) learned because Trinity is not connected

[00:34:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2090s) to that. So it learned that from

[00:34:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2092s) Morpheus telling it about it. So we've

[00:34:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2094s) got now two routers configured for OPF.

[00:34:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2098s) I'm going to take a breath. Micah, what

[00:35:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2100s) questions do we have?

[00:35:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2102s) Well, uh, we just got one right here

[00:35:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2104s) from, uh, boy, where did it go? Hey, I'm

[00:35:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2108s) I'm late for class. What did I miss?

[00:35:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2110s) Well, I can answer that one very

[00:35:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2111s) quickly. [laughter] We are we're doing a

[00:35:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2113s) a deep dive here for for OPF, so buckle

[00:35:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2116s) up. Um, let's see here. What else do we

[00:35:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2118s) have cued?

[00:35:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2120s) >> Okay. Um, here's a comment right here. I

[00:35:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2122s) like I like this comment here to start.

[00:35:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2124s) Breaking stuff accidentally is where you

[00:35:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2125s) learn, and we were just learning right

[00:35:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2127s) here. So, let's uh let's go on from

[00:35:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2128s) there. Zack, you had one?

[00:35:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2130s) >> Yes. from our good friend Marlene.

[00:35:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2132s) >> All right.

[00:35:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2133s) >> Is having a loop back always keeping OPF

[00:35:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2136s) process on the inter uh in does that go

[00:35:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2139s) down?

[00:35:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2140s) >> Yes. So, so the um so first off, great

[00:35:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2143s) question. Um loop back interfaces do not

[00:35:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2146s) go down. Um so, so that's that's the

[00:35:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2149s) good news. As long as the router is

[00:35:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2150s) running, you will have that IP address

[00:35:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2152s) and it will be reachable as long as that

[00:35:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2154s) router has connectivity. Um, that said,

[00:35:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2157s) the loop back interface that I added

[00:36:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2160s) isn't necessary for OPF to work. Like,

[00:36:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2163s) we could delete the whole interface.

[00:36:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2165s) Matter of fact,

[00:36:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2166s) >> let's let's let's do it. I'm going to go

[00:36:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2168s) >> see if we can accidentally break it. I

[00:36:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2170s) don't think we will.

[00:36:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2171s) >> IPOPF

[00:36:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2172s) and Trinity, you can see, is uh 3333.

[00:36:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2176s) I'll go over to Morpheus. I'll do a show

[00:36:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2179s) ipospf

[00:36:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2180s) uh neighbor. And it's like, oh, I see tr

[00:36:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2183s) I see Trinity over there. And I can go

[00:36:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2185s) into Trinity and I can go uh

[00:36:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2190s) no interface loop back zero.

[00:36:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2194s) Boom. It's gone. Um show ip interface

[00:36:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2197s) brief. Um there is no 3333. And sure

[00:36:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2201s) enough, that's probably how I killed Neo

[00:36:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2203s) is I click the X. I go back over here to

[00:36:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2206s) uh Morpheus. Hit the up arrow. Still got

[00:36:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2209s) a neighbor. Still still can ping

[00:36:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2211s) 1921682.1.

[00:36:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2213s) I just can't ping by neighbor ID because

[00:36:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2216s) that neighbor ID doesn't exist, right?

[00:36:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2219s) So, if I were to ping 3333,

[00:37:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2222s) I'm I'm getting nowhere. So, when I go

[00:37:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2224s) into uh Trinity here, global config

[00:37:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2227s) mode, uh I'll just put that guy back and

[00:37:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2230s) hit the up arrow a few times. Right

[00:37:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2233s) about there. And we've got that. Uh

[00:37:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2236s) let's do a [snorts] showrun

[00:37:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2239s) section OPF. And I think I still have

[00:37:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2245s) up I I didn't include that in the uh in

[00:37:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2248s) the OPF routing process. So I want to

[00:37:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2250s) add so watch this. I'm going to go I'll

[00:37:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2252s) just finish my statement as I do it.

[00:37:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2254s) Interface loop back zero and I'll do

[00:37:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2256s) IPOPF area or process ID area zero. Hit

[00:37:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2261s) enter. Now this IP address will be

[00:37:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2265s) advertised to Morpheus. And now I should

[00:37:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2268s) be able to do a show ip route. Uh, and

[00:37:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2272s) I'll add OPF after that. And right there

[00:37:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2275s) it sees 3.33.3. So where it couldn't

[00:37:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2278s) ping 3333 before, hopefully you're

[00:38:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2280s) keeping up with me. I'm moving fast. Uh,

[00:38:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2282s) because I got to prove Claude wrong. We

[00:38:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2284s) will make it. Uh, now I can't. Success

[00:38:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2288s) uh, pinging ping Trinity. So So

[00:38:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2291s) hopefully that helps clarify a little

[00:38:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2293s) bit on those loop backs. Other

[00:38:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2295s) questions? Well, here's a tie-in for

[00:38:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2297s) that. And then it is to say for what

[00:38:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2300s) exactly is the loop back address? I

[00:38:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2302s) mean, if we do need them or we don't

[00:38:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2304s) need them, we don't need them, but we

[00:38:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2306s) can use them. What do we use them for

[00:38:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2307s) anyway?

[00:38:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2309s) >> Um, in this case, we're just we're using

[00:38:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2311s) it to just be able to ping the device.

[00:38:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2314s) So, I if I'm like, okay, can I reach

[00:38:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2316s) Trinity? It's also it's handy because

[00:38:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2318s) for example um if I if I'm let's say I'm

[00:38:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2322s) at the Oracle and I want to be able to

[00:38:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2324s) TN net to Trinity well which IP address

[00:38:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2327s) of Trinity is it? Is it is it uh

[00:38:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2330s) 20.20.20.2

[00:38:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2331s) is it 192.1682 like which one do I tell

[00:38:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2335s) net to or SSH2? Right? By giving it a

[00:38:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2337s) single IP address like this loop back,

[00:38:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2339s) you kind of create a universal IP

[00:39:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2341s) address that's like I can reach I know I

[00:39:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2343s) can always reach Trinity at 3333. Right?

[00:39:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2347s) This I'm giving you just one example.

[00:39:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2348s) There are literally hundreds of examples

[00:39:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2351s) of why you would use a loop back. Um but

[00:39:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2354s) that's for this context one of them.

[00:39:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2357s) >> No.

[00:39:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2358s) >> Yeah. That that's you this time, Jeremy.

[00:39:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2360s) I thought that was me.

[00:39:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2362s) >> Oh my god. [laughter]

[00:39:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2363s) It's usually Chuck.

[00:39:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2365s) >> I know. I know. Well, it's you know how

[00:39:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2368s) your your laptop takes over your phone?

[00:39:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2370s) That's my laptop is ringing.

[00:39:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2372s) >> Thanks, Apple.

[00:39:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2374s) >> Yep. [laughter]

[00:39:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2374s) >> Here's one from uh Streeten. So, they

[00:39:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2376s) say so I understand that areas have to

[00:39:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2378s) be connected to area zero, but in the

[00:39:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2380s) network diagram he shows it shows

[00:39:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2382s) Morpheus and Area 51. So, shouldn't

[00:39:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2385s) Trinity and Neo be ABRs to the actual

[00:39:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2389s) area zero?

[00:39:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2391s) They're a little lost on what's going

[00:39:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2392s) on.

[00:39:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2393s) And and you are 100% right. Um straight.

[00:39:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2398s) Yes.

[00:39:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2399s) >> Um the reason that uh I'm putting

[00:40:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2401s) Morpheus in area zero right now and by

[00:40:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2403s) and because first off area zero the

[00:40:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2406s) backbone area that's CCNA scope. But

[00:40:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2408s) Morpheus explicitly told us that we

[00:40:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2410s) cannot disobey orders. Uh he said don't

[00:40:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2413s) worry about splitting things into areas

[00:40:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2414s) yet. We're not ready for that

[00:40:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2416s) conversation. That comes later according

[00:40:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2418s) to Morpheus. And so, so what you're what

[00:40:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2421s) you're seeing on here is multi area, but

[00:40:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2424s) I'm doing everything in area zero just

[00:40:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2426s) to get things started. Good. I'm gonna

[00:40:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2429s) I'm gonna stop questions there for a

[00:40:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2430s) second because I now I'm going to go

[00:40:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2432s) fast. I'm just going to get the rest of

[00:40:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2433s) this set up for area zero. Watch me go.

[00:40:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2437s) So, I'm going to Neo.

[00:40:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2440s) Let's get in. One of my kids' name is

[00:40:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2442s) actually Neo. It's Nehemiah. Uh, so I do

[00:40:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2445s) have I do have Matrix characters in my

[00:40:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2448s) house. Uh, global config mode interface

[00:40:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2451s) loop back zero. IP address 222255

[00:40:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2454s) 255.

[00:40:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2458s) Uhhuh. Good. Exit. And we will do uh

[00:41:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2462s) router OPF1

[00:41:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2464s) router ID 222. Right. We're getting Neo

[00:41:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2467s) up there. And we'll do um let's do

[00:41:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2469s) network. Well, I'll do it by interface

[00:41:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2472s) um a little faster. IPOPF

[00:41:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2475s) 1 area zero. I'll hit the up arrow. Go

[00:41:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2479s) here. Interface loop back zero and go

[00:41:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2483s) there. Boom. Now we've got three

[00:41:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2485s) interfaces all configured for OPF area

[00:41:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2488s) zero. And we should be able to see show

[00:41:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2491s) ip OPF neighbor. And now we've got two

[00:41:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2496s) neighbors. Woohoo. We've got Morpheus

[00:41:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2499s) router one right here. Uh and he is

[00:41:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2502s) currently a designated router. We'll

[00:41:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2504s) talk about that in just a little bit.

[00:41:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2505s) And then I see the neighbor Trinity

[00:41:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2507s) right there, 3333. Let's drop back down.

[00:41:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2510s) Why? Because Neo's going through this

[00:41:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2512s) switch and forming a neighbor

[00:41:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2514s) relationship with Trinity. This is all

[00:41:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2516s) one backbone flat network uh going

[00:41:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2519s) between the two. So let's go to agent

[00:42:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2523s) Smith.

[00:42:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2526s) Let's do show IP interface brief.

[00:42:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2530s) Uh, wow. I forgot that I added loop

[00:42:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2533s) backs to Agent Smith that I don't think

[00:42:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2535s) I used in this lab. Well, so he'll have

[00:42:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2538s) loop backs that'll just sit there. We

[00:42:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2539s) won't use them. Uh, but we'll go into uh

[00:42:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2542s) interface loop back zero if I can spell

[00:42:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2544s) it right. And we'll do IP address 4444

[00:42:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2551s) because agent Smith I believe I gave the

[00:42:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2554s) router yes number four to. So that'll be

[00:42:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2558s) it. And then we'll get OPF going. We'll

[00:42:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2560s) go router OPF1.

[00:42:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2563s) Router ID 444.

[00:42:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2566s) Uh network. We'll use the network

[00:42:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2568s) command this time. Again, I just want to

[00:42:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2569s) make sure you know guys know you can go

[00:42:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2570s) either way with this. 20.20.20.

[00:42:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2573s) Oh, it's three. Um and we'll 00 as the

[00:42:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2576s) wild card mask areas.

[00:42:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2578s) >> Look at you targeting very specifically.

[00:43:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2582s) [laughter] I saw that.

[00:43:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2583s) >> Yep. That's one of the things I love

[00:43:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2585s) about the OPF uh process is when you

[00:43:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2588s) really start to unpack the the wild

[00:43:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2589s) cards like I you could do some really

[00:43:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2594s) unconventional kind of things with it.

[00:43:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2595s) Um I don't know if Jeremy, have you ever

[00:43:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2598s) done it where you do wild card of

[00:43:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2599s) 0.0.255.0

[00:43:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2602s) where you're like that third octet just

[00:43:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2603s) let it be you want it to be.

[00:43:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2605s) >> Yep. And we'll do that on the Oracle. So

[00:43:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2606s) let's okay got agent Smith running

[00:43:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2609s) >> and we'll hop over here to the Oracle

[00:43:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2611s) the little stub router at the at the end

[00:43:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2613s) there 1921683 is it and we've got some

[00:43:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2616s) loop backs I'll move this right there uh

[00:43:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2619s) on the Oracle. So let's head on over to

[00:43:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2622s) yeah the shop

[00:43:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2626s) >> um show ip interface brief and the

[00:43:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2629s) Oracle is router five. So, we'll do uh

[00:43:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2631s) interface loop back zero IP address

[00:43:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2634s) 5555.

[00:43:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2637s) There we go. Oops.

[00:44:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2642s) Enter. We'll do router OPF1

[00:44:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2645s) uh router- ID 5555.

[00:44:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2649s) And we'll do uh we'll do exactly what

[00:44:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2651s) you said, uh Micah. I'm going to do

[00:44:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2653s) network 1921683.0.

[00:44:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2656s) And that's where we'll do a wild card

[00:44:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2658s) mask of that area zero, which will be

[00:44:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2661s) this guy. And and let's let's do this

[00:44:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2664s) one. I'll use one network command and

[00:44:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2666s) get all three loop backs in here because

[00:44:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2668s) I'll type in network 172.16.0.0

[00:44:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2674s) uh with a

[00:44:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2676s) wild card mask of 00255255.

[00:44:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2679s) Now, I want I want to just pause for a

[00:44:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2681s) minute because I know a ton of people

[00:44:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2682s) will have questions on this. If you

[00:44:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2684s) haven't gotten comfortable with this,

[00:44:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2686s) remember this wild card mask is

[00:44:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2689s) identifying significance.

[00:44:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2691s) This is significant. I will run and now

[00:44:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2694s) and let me [laughter] let me also do so

[00:44:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2697s) much on the network command. Remember

[00:44:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2698s) the network command is one of those

[00:45:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2700s) combo commands. It does two things at

[00:45:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2701s) once. One, it sends hello messages and

[00:45:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2705s) tries to form neighbor relationships on

[00:45:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2708s) any interface that is starting with

[00:45:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2711s) 172.16. So first thing second thing is

[00:45:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2714s) it actually advertises

[00:45:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2717s) those networks. So it says okay I'm

[00:45:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2720s) going to advertise any interface that

[00:45:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2722s) starts with 17216.

[00:45:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2724s) This is not the advertisement it's

[00:45:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2727s) sending out. This is the biggest thing

[00:45:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2729s) and and the exam will nail you on this.

[00:45:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2731s) Everybody will try and it's so

[00:45:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2732s) misleading. You're like, "Oh, okay." So,

[00:45:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2734s) so the Oracle uh right there connected

[00:45:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2737s) to Agent Smith, which if you've seen

[00:45:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2740s) part two and part three, you find out

[00:45:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2741s) they are connected. Um the Oracle is

[00:45:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2745s) actually advertising

[00:45:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2748s) uh 172.16

[00:45:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2751s) 22 23 24. It's not advertising 1721600.

[00:45:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2758s) That's just the command we're using to

[00:46:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2760s) identify which interfaces it should

[00:46:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2764s) advertise and which interfaces it should

[00:46:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2767s) send hello messages out.

[00:46:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2769s) >> Right.

[00:46:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2770s) >> Yep.

[00:46:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2771s) >> That's that's why I always smile about

[00:46:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2773s) OPF because that that right there that

[00:46:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2775s) was the tipping point for me. I was like

[00:46:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2777s) yes I finally understood it because

[00:46:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2779s) you're you're I mean it's like just

[00:46:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2781s) unlocking that little tidbit right there

[00:46:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2782s) was like this just became my favorite

[00:46:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2785s) dynamic protocol period. I love it.

[00:46:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2787s) Awesomeness. All right. Now the now we

[00:46:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2790s) should have finished uh Claude, you are

[00:46:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2793s) not right. I will finish this. Uh we

[00:46:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2795s) [laughter] have we have we have gotten

[00:46:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2798s) uh Zion online. It says every router has

[00:46:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2801s) a full picture of the network with

[00:46:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2803s) nothing left unreachable and you can

[00:46:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2805s) explain why each router identifies

[00:46:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2808s) itself the way it does. My router

[00:46:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2810s) identifies as 5555.

[00:46:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2814s) So do a show IP route. [snorts] Uh and

[00:46:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2817s) sure enough, we've got Okay, look at

[00:46:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2819s) this. Look at this. Oh, so this is the

[00:47:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2822s) Oracle. Um it is seeing the one network,

[00:47:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2826s) the two network, the three network, the

[00:47:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2828s) five network. Uh

[00:47:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2831s) [groaning]

[00:47:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2832s) where's four?

[00:47:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2834s) >> We forget agent Smith.

[00:47:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2836s) >> Um

[00:47:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2838s) >> hang on.

[00:47:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2839s) >> Good question.

[00:47:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2839s) >> Show IP interface brief. We've got the

[00:47:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2842s) loop back. Hang on. Show run section

[00:47:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2845s) OPF.

[00:47:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2848s) Holy smokes. I'm glad we checked it. Uh,

[00:47:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2851s) we did not have this loop back included.

[00:47:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2855s) Thus, we could not see it when we went

[00:47:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2856s) to the Oracle. Notice it is missing from

[00:47:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2859s) the routing table. Troubleshooting right

[00:47:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2861s) there. So, let's let's go into the

[00:47:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2864s) interface. I'll go interface loop back

[00:47:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2866s) zero.

[00:47:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2866s) >> What did you have to do before you went

[00:47:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2868s) into the interface mode, Jeremy?

[00:47:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2870s) >> [laughter]

[00:47:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2870s) >> I had to go in global configuration

[00:47:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2873s) mode. Thank [snorts] you. Uh and uh and

[00:47:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2877s) if you if you're new joining us, thank

[00:48:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2880s) you. Uh we'll explain that later. IPOPF

[00:48:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2884s) uh process ID 1 area zero. Good. Okay.

[00:48:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2887s) Good. Uh so now that should be included.

[00:48:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2890s) And now if I go back to the Oracle uh

[00:48:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2893s) let's let's do again

[00:48:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2896s) uh show ip route. Hit the enter key.

[00:48:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2899s) There we go. Yeah, baby. Four network is

[00:48:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2903s) showing up. We've got 1 2 3 4 5. That

[00:48:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2905s) tells me the loop backs are all there.

[00:48:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2907s) Hit the space bar and I can see all

[00:48:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2909s) these OPF networks. Are you Are you

[00:48:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2911s) feeling it right now? Like right now I

[00:48:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2914s) can actually see all the entire network.

[00:48:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2917s) OPF has built this network. We have

[00:48:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2920s) single area OPF. Um I can go on the

[00:48:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2924s) Oracle. I can do show ip opp neighbor

[00:48:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2926s) because it's its neighbor is agent

[00:48:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2928s) Smith. That's it. We can see it's a

[00:48:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2931s) designated router. We can see the IP

[00:48:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2933s) address of agent Smith right there. And

[00:48:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2936s) I should be able to ping all the way

[00:48:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2938s) through to Morpheus. Hit the enter key.

[00:49:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2940s) Boom. Look at this. Actually, let me do

[00:49:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2942s) this. I'm going to do a no IP domain uh

[00:49:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2945s) lookup just to make sure we don't do any

[00:49:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2947s) DNS lookups. And I'm going to do a trace

[00:49:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2949s) route uh to Morpheus. Um, by the way,

[00:49:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2952s) the domain lookups just slows this whole

[00:49:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2954s) thing down because it's trying to

[00:49:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2954s) resolve DNS. So, I'll do a trace route.

[00:49:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2957s) And look at that. I'm going through

[00:49:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2959s) Agent Smith through 202022.

[00:49:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2964s) Let's see. That is that's Trinity. So,

[00:49:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2967s) so the Oracle when it pings Morpheus,

[00:49:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2970s) he's going through Agent Smith through

[00:49:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2973s) the switch down to Trinity. That's

[00:49:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2975s) 202022.

[00:49:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2976s) And then I'm sure as we move this back

[00:49:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2979s) up

[00:49:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2982s) By the way, those aren't my kids.

[00:49:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2985s) >> I think those are Zach's kids. Or those

[00:49:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2987s) are those are Micah's kids. One of those

[00:49:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2989s) kids.

[00:49:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2989s) >> They might just be my kiddo. You

[00:49:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2991s) [laughter] can hear

[00:49:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2993s) 1921682.2.

[00:49:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2995s) We can land over here. It's totally

[00:49:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2996s) fine, my kid. Um I am I am totally loud

[00:49:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=2999s) enough and I have kids around me all the

[00:50:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3001s) time. So I just Everybody's like, "Is

[00:50:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3003s) that kid good?" Um all right. So we've

[00:50:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3006s) got uh connectivity.

[00:50:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3008s) We have completed phase one getting Zion

[00:50:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3012s) online single area OPF done everywhere.

[00:50:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3016s) Good. Let me pause there for a second

[00:50:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3020s) and grab any questions that you guys

[00:50:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3022s) have. Um Micah, Zach, hit me.

[00:50:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3026s) >> Hit you.

[00:50:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3026s) >> Yeah, we got one here earlier. Uh it was

[00:50:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3029s) about how many nodes in uh CML. So yes,

[00:50:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3032s) the answer to that is how many nodes can

[00:50:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3034s) you have for free is five. Just a

[00:50:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3035s) handful. If you want to have anything

[00:50:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3037s) more than it, you got to shut down the

[00:50:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3038s) other ones and then you can you can have

[00:50:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3041s) all of them in the topology you want,

[00:50:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3042s) but only five active at a time.

[00:50:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3045s) >> By the way, you can work strange magic

[00:50:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3049s) around those five. And what I mean is

[00:50:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3051s) they allow you to have unmanaged

[00:50:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3052s) switches like I have in that picture for

[00:50:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3055s) free. So those don't those don't go

[00:50:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3056s) against your account. And what I've done

[00:50:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3059s) sometimes is I'm like, I need hosts.

[00:51:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3060s) Well, every Ubuntu host that you drag on

[00:51:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3063s) there goes against your five limits. So

[00:51:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3065s) what I've done actually a trick I

[00:51:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3067s) learned from Wendell Odum is uh you grab

[00:51:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3069s) one router and a attach interfaces all

[00:51:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3073s) throughout the topology. So you take one

[00:51:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3075s) router and and spaghetti it through your

[00:51:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3078s) whole network and that

[00:51:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3080s) >> use that one router as your host for

[00:51:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3082s) every one of uh

[00:51:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3084s) >> that's brilliant. That's brilliant.

[00:51:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3086s) >> It's cheap. That's what it is. It's much

[00:51:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3088s) cheaper [laughter] than uh than paying

[00:51:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3090s) for a license. That's that's what you

[00:51:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3092s) get. What else? What if

[00:51:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3094s) >> Yeah. What if a rogue router joins the

[00:51:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3096s) OPF domain?

[00:51:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3098s) >> Good question. And right now, uh, they

[00:51:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3101s) would be able to take over Zion. They

[00:51:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3103s) would be able to just join Zion, poison

[00:51:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3106s) the routing table, everything else

[00:51:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3108s) because OPF authentication is a good

[00:51:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3111s) practice. We haven't deployed that yet,

[00:51:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3113s) but you can add a pre-shared key um,

[00:51:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3116s) essentially to every connection in

[00:51:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3118s) there. So that you have to have the

[00:51:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3119s) right key in order to form neighbor

[00:52:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3121s) relationships. Okay, down to best

[00:52:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3123s) practices here. Is it best practice to

[00:52:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3126s) configure the RID the router ID and and

[00:52:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3129s) and the loop back with the same number?

[00:52:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3132s) Um,

[00:52:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3134s) or do you want to mix and match?

[00:52:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3137s) >> Best practice configure. Yeah. Oh, yeah.

[00:52:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3139s) I mean, if you want job security or like

[00:52:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3142s) documentation mayhem, use a different

[00:52:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3144s) router ID than your loop back.

[00:52:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3146s) [laughter] But if you want sanity, make

[00:52:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3149s) those things. I was going to say I mean

[00:52:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3150s) like job security almost sounds like if

[00:52:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3152s) you were to choose a different loop back

[00:52:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3153s) and a different router ID you would not

[00:52:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3156s) have a job very quickly because somebody

[00:52:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3157s) who was working side byside in next cube

[00:52:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3160s) uh would probably be like I don't

[00:52:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3161s) understand what's going on here this

[00:52:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3162s) slow me down and

[00:52:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3164s) >> Yep.

[00:52:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3164s) >> Sorry Jack but hit the road you know.

[00:52:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3166s) Exactly.

[00:52:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3167s) >> No, if they were good they would fix it.

[00:52:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3169s) [laughter]

[00:52:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3170s) >> Go around.

[00:52:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3172s) >> All right let's let's get back to the

[00:52:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3174s) lab. Uh because I'm I'm just uh I'm

[00:52:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3176s) trying to jam it all in and prove Claude

[00:52:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3178s) wrong. Phase two, the network grows up.

[00:53:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3181s) Uh, Morpheus, a few weeks later, command

[00:53:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3184s) signed off on the area design. Green is

[00:53:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3186s) us. Zion runs on its own now. Blue is

[00:53:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3189s) the backbone, red is Oracle's people.

[00:53:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3191s) Match the diagram. I don't want to hear

[00:53:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3193s) Zion's local traffic patterns are

[00:53:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3195s) showing up in the backbone tables

[00:53:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3196s) anymore. And that the Oracles outpost

[00:53:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3198s) needs the same treatment on her end. So,

[00:53:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3201s) now we're going to break into multi area

[00:53:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3203s) OPF. What what we did, by the way, right

[00:53:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3205s) there is about what you would need for

[00:53:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3208s) CCNA.

[00:53:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3210s) I'm I'm serious. That's it. Like basic

[00:53:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3213s) connectivity with OPF. But if you get

[00:53:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3215s) into the real world, you're going to

[00:53:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3217s) need it a little bit more and you're

[00:53:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3218s) going to learn a lot more as we go

[00:53:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3220s) through this. Uh so so what what

[00:53:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3222s) Morpheus is telling us now is uh go

[00:53:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3225s) through and set up the multi- area

[00:53:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3227s) design. It actually won't take much. Um,

[00:53:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3229s) so we'll break it into the areas with

[00:53:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3231s) the correct routers bridging between

[00:53:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3232s) them. And it says, "Reachability that

[00:53:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3234s) existed at the end of phase one must

[00:53:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3236s) still exist. Growing up doesn't mean

[00:53:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3238s) what losing what losing what already

[00:54:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3241s) worked." Thank you. All right. So,

[00:54:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3245s) let me show you how to break things. I'm

[00:54:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3246s) going to go let's start off with

[00:54:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3248s) Morpheus, who is entirely in Area 51,

[00:54:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3251s) right? Um, I'm going to go over here to

[00:54:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3254s) Morpheus. Get into privilege mode. We'll

[00:54:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3257s) do a show run. Let's do section OPF just

[00:54:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3260s) so I can look at that. Good. And let's

[00:54:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3262s) also do show run interface Ethernet 0

[00:54:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3269s) and 01. Good. I just I'm just looking to

[00:54:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3272s) see where I'm going to have to fix this

[00:54:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3273s) thing. Uh so we will go into uh let's

[00:54:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3276s) let's fix the interfaces first. And this

[00:54:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3278s) is where the network goes down. I'm

[00:54:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3279s) going to go into global configuration

[00:54:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3281s) mode. Global config. Ethernet zero. I'll

[00:54:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3285s) do no IPOPF1.

[00:54:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3287s) Thank you. Area zero. Uh, hit the up

[00:54:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3290s) arrow and change it to Oh, not that. Uh,

[00:54:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3294s) IPOPF area 55. By the way, control A

[00:54:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3298s) moves your cursor to the front of the

[00:55:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3300s) line. Control E to the end of the line.

[00:55:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3302s) A lot faster. Interface Ethernet 01.

[00:55:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3306s) Um, notice we're getting errors. That's

[00:55:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3308s) good. Uh, I'll do no area zero and we'll

[00:55:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3313s) do area 55. Notice neighbors are going

[00:55:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3316s) down because in order to form a

[00:55:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3318s) neighbor, you have to be in the same

[00:55:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3320s) area. And now we're getting uh invalid

[00:55:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3322s) packets. By the way, this is your

[00:55:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3324s) troubleshooting right here. Neighbor

[00:55:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3325s) relationship not forming. It's because

[00:55:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3327s) you're having an area ID mismatch. Um we

[00:55:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3330s) also

[00:55:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3331s) >> Jeremy, you're having an area ID

[00:55:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3333s) mismatch here. We got the

[00:55:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3335s) >> Everyone's pointed out in the chat.

[00:55:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3336s) They're like, "Oh, it's got to be 51,

[00:55:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3337s) not 55."

[00:55:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3339s) >> Oh, did I

[00:55:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3342s) actually like

[00:55:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3343s) >> that? that you just get you just saved

[00:55:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3345s) me so much time. So, I'm [laughter]

[00:55:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3347s) gonna go hang Let me let me do a router

[00:55:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3349s) OPF1. We'll fix it the right way under

[00:55:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3352s) here. Uh so many and this by the way,

[00:55:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3355s) you would never configure a network this

[00:55:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3357s) fast in the real world. Just just so you

[00:55:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3359s) know. Uh we'll do a copy do a no. We'll

[00:56:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3363s) do a uh paste control. For whatever

[00:56:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3366s) reason, it just doesn't work to do C

[00:56:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3368s) controlV in the emulator. So, let me

[00:56:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3370s) just go no network 1721600 0. Probably

[00:56:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3374s) just uh 00255 255 area zero. All right,

[00:56:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3379s) removed all those. Now, I'll hit the up

[00:56:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3381s) arrow a couple times and we'll do it

[00:56:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3382s) right. We'll do network 51. Area 51.

[00:56:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3387s) >> Dave gets a t-shirt for that. Right.

[00:56:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3390s) >> What?

[00:56:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3391s) >> Right.

[00:56:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3392s) >> Are we still doing that? Yes, that's

[00:56:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3394s) fine.

[00:56:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3395s) >> That is that is the rule. If uh someone

[00:56:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3397s) catches an error from me, uh they get a

[00:56:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3400s) free t-shirt. So Dave, congratulations.

[00:56:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3402s) Summer of CCNAA t-shirt coming your way.

[00:56:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3405s) Zach will get all the details for me on

[00:56:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3406s) that. And now I got to go fix the

[00:56:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3408s) interfaces. Man, now I'm nervous. I'm

[00:56:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3410s) like, this is going to cost me. Uh

[00:56:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3413s) >> this is See, this makes it fun for

[00:56:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3414s) everybody.

[00:56:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3415s) >> I was gonna say like in the real world

[00:56:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3416s) when you're doing network configuration

[00:56:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3418s) and you're working for a company, if you

[00:56:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3419s) have a misconfiguration, it's going to

[00:57:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3421s) cost you.

[00:57:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3421s) >> Okay. Okay. So So now [laughter] I'm You

[00:57:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3424s) can see I'm typing the wrong thing. The

[00:57:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3426s) so so rule is like I have to completely

[00:57:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3430s) like I miss a mistype doesn't get like I

[00:57:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3432s) I Yes. You right.

[00:57:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3434s) >> You can't change the rules as we're

[00:57:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3436s) going. You sound like my kids now.

[00:57:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3438s) >> It sounds like my older brother when I'm

[00:57:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3440s) playing Monopoly with him when I was a

[00:57:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3441s) kid. [laughter]

[00:57:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3442s) Come around. Go.

[00:57:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3444s) >> Nope. Nope. Show ipossp.

[00:57:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3450s) I've got no neighbors because we've got

[00:57:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3452s) this mismatch area. We're We're going

[00:57:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3454s) nowhere. Okay. So now let's go over to

[00:57:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3455s) Neo and let's bring up our first ABR.

[00:57:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3459s) Oo, by the way, we are calling this an

[00:57:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3464s) area border router. Actually, I think

[00:57:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3467s) that's the first time we've used that

[00:57:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3469s) statement in the CCNA course. That is a

[00:57:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3472s) router with more than one interface.

[00:57:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3474s) >> Um, what with interfaces in more than

[00:57:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3478s) one area is an area border router. Why

[00:58:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3481s) is it special? because this is one of

[00:58:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3483s) two routers that can do summarization

[00:58:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3488s) which will be part of this lab. Yes, it

[00:58:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3490s) will. I will be bringing that in there.

[00:58:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3492s) So, we're we're not doing it yet. Right

[00:58:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3494s) now, we're just uh setting this up as an

[00:58:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3496s) ABR. So, we'll go in. Let's do a uh uh

[00:58:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3499s) we should have probably uh lost a

[00:58:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3501s) neighbor at this point. So, yep.

[00:58:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3503s) Morpheus is gone. Notice. And it's got

[00:58:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3505s) two other neighbors instead. So I'm

[00:58:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3506s) going to go to um do oh let's not show

[00:58:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3510s) run

[00:58:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3511s) uh section OPF

[00:58:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3515s) just see that. Okay so this is I've got

[00:58:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3517s) everything under the interfaces here. So

[00:58:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3518s) we will go into interface Ethernet 01.

[00:58:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3522s) Let's fix that. Uh and we'll do ipospf

[00:58:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3527s) one area 51. Enter. So this is now you

[00:58:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3531s) see Neo right here. I'll move this down

[00:58:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3533s) a little bit more. Uh, Neo is now

[00:58:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3536s) reconfiguring that interface to be in

[00:58:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3538s) Area 51. We'll do a show run interface

[00:59:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3543s) E01.

[00:59:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3545s) And I know some of you are like, "Wait a

[00:59:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3547s) sec. [laughter] Everybody's going for

[00:59:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3549s) the free t-shirt now. I'm guessing you

[00:59:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3551s) didn't remove the old one first." Well,

[00:59:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3553s) this is one of those commands where you

[00:59:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3554s) can actually type over the old one. And

[00:59:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3556s) so, Area 51 replaces uh Area Zero. So,

[00:59:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3560s) let's do a show ipospf neighbor. Now on

[00:59:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3565s) uh woohoo, we've got our neighbor back.

[00:59:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3568s) There's Morpheus. Uh that's now in Area

[00:59:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3570s) 51. And if I were to go uh show ipospf

[00:59:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3576s) interface, let's go Ethernet 01. Um you

[00:59:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3580s) can see

[00:59:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3583s) right there, uh it is now running in

[00:59:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3586s) area 51. Good. Now, uh, we still have to

[00:59:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3590s) fix, uh, Trinity down there, uh, because

[00:59:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3593s) Trinity has Ethernet01. So, let's go

[00:59:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3595s) take a look at that. Uh, and we'll go

[00:59:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3598s) into show run interface E01.

[01:00:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3602s) Good. That should be an easy fix. Do I

[01:00:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3605s) ipospf?

[01:00:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3606s) Nope. Uh, interface 01. IPOPF1 area 51.

[01:00:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3612s) So, again, just overwriting that config.

[01:00:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3615s) Notice we've now brought the Morpheus

[01:00:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3618s) connection back up. He's gone from

[01:00:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3619s) loading to full. And now we have inter

[01:00:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3622s) area OPF. How do we know? Watch this.

[01:00:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3626s) I'm going to go over to agent Smith.

[01:00:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3630s) Hit the enter key a couple times and do

[01:00:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3633s) a show ip route. Watch. Watch what

[01:00:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3635s) happens.

[01:00:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3637s) Notice right here.

[01:00:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3639s) >> Yeah, I now have inter area routes. So

[01:00:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3644s) this, let me grab my pen. Uh, this

[01:00:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3648s) is Morpheus's loop back IP address,

[01:00:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3651s) which is seen as an outof area route.

[01:00:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3655s) Now this, you're like, so what happened?

[01:00:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3659s) Nothing. We have more areas. We have the

[01:01:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3662s) ability to summarize now, but we're not

[01:01:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3665s) summarizing. Um, that that, like I said,

[01:01:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3668s) will come later. That's uh that's part

[01:01:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3670s) but but now all of these routes that

[01:01:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3673s) came from Area 51 are seen as inter area

[01:01:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3677s) and we can do different things to them

[01:01:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3679s) but they still work the same right

[01:01:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3681s) >> so what does that do for our metric our

[01:01:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3683s) cost everything like that because I mean

[01:01:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3684s) that's going to play a little bit of a

[01:01:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3685s) role there isn't it

[01:01:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3686s) >> it

[01:01:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3688s) will not actually until we until we uh

[01:01:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3692s) get to summarization and that'll we

[01:01:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3694s) we'll get to some of that a little bit

[01:01:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3695s) later because so right now everything is

[01:01:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3698s) going to be as as it is. Now, I know

[01:01:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3700s) some people might be looking and going,

[01:01:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3702s) why do you why do you have two IP

[01:01:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3705s) addresses there? Remember, we're looking

[01:01:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3707s) from the perspective of Agent Smith.

[01:01:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3711s) How does Agent Smith get

[01:01:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3716s) Morpheus

[01:01:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3718s) one?

[01:02:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3723s) This is load.

[01:02:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3726s) So one packet there, one packet there

[01:02:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3729s) because it's got two equal cost paths

[01:02:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3731s) over here to the Morpheus networks 1111.

[01:02:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3734s) Right? So that's what we see when we see

[01:02:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3737s) the um uh the routing table and we see

[01:02:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3741s) two different paths right there. That's

[01:02:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3744s) path one. That's path two. Cool.

[01:02:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3749s) Let's get uh let's get that last area.

[01:02:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3751s) Let's get the cookie shop configured.

[01:02:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3753s) Fresh cookies over at the Oracle. So,

[01:02:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3755s) Agent Smith and Oracle need to go into

[01:02:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3758s) area 22. So, we're on agent Smith right

[01:02:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3762s) now. Let's do a show run interface

[01:02:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3764s) infinite01.

[01:02:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3765s) Nope, that's not where I have it. Show

[01:02:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3767s) run section OPF. That's where it is. I'm

[01:02:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3770s) going to go to global configuration mode

[01:02:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3773s) router OPF1.

[01:02:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3776s) And we'll do I'll just do a no uh

[01:02:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3778s) network 1921683.1

[01:03:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3781s) 000000

[01:03:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3783s) area zero and then hit the up arrow and

[01:03:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3787s) change that to area 22. Good.

[01:03:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3793s) Now I'll go to the Oracle which is going

[01:03:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3794s) to have a complete uh configuration

[01:03:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3797s) enema. I'll do a show run section OPF

[01:03:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3800s) because all the interfaces are in area

[01:03:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3802s) zero right now and all those interfaces

[01:03:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3805s) need to go over to area 22. This is

[01:03:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3807s) where Jeremy's like, man, I should have

[01:03:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3809s) used the interface command on [laughter]

[01:03:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3810s) this one. So, uh no uh uh no network

[01:03:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3816s) 555500

[01:03:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3818s) Z. I know copy and paste, but but uh

[01:03:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3821s) right clicking it's going to be just as

[01:03:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3822s) fast for me to do it this way. Uh

[01:03:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3824s) network and we'll do area 22 there.

[01:03:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3827s) There we go. We've lost our neighbor

[01:03:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3828s) because we've got an area mismatch.

[01:03:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3830s) We'll do let's let's get the neighbor

[01:03:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3831s) going again. We'll do network 182168

[01:03:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3834s) 3.0000

[01:03:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3836s) 255

[01:03:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3838s) area zero. And I'll hit control A and

[01:04:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3840s) put the no that I forgot. And then I'll

[01:04:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3842s) hit the up arrow. A remove the no. Add

[01:04:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3845s) the 22 into the end. The other way, by

[01:04:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3848s) the way, people do this is they'll copy

[01:04:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3849s) all of this to notepad, make all their

[01:04:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3851s) changes, and then paste it back in. Um,

[01:04:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3853s) if I had a lot more than this, I would

[01:04:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3856s) probably do that. Um, no network 17216 0

[01:04:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3862s) 205 area zero and then control A and put

[01:04:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3867s) that in area 22.

[01:04:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3870s) Good. We now have multi- area OPF

[01:04:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3874s) completely configured. And how do we

[01:04:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3876s) know? You know when every interface on

[01:04:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3880s) every router sits in the area shown on

[01:04:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3881s) the diagram and nothing that could reach

[01:04:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3883s) in phase one has lost that ability. So

[01:04:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3886s) let's go to the other side of the world

[01:04:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3888s) back at Morpheus and we should see the

[01:04:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3890s) Oracles routes now is interer routes.

[01:04:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3893s) Show ip route. I'll type in OPF to just

[01:04:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3897s) filter down the routing table to the OPF

[01:04:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3899s) routes. And sure enough, look at look at

[01:05:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3902s) all that inter area goodness. So you've

[01:05:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3904s) got the loop backs of the area zero. Uh

[01:05:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3907s) I mean every I mean if you if you now

[01:05:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3910s) that I'm thinking of it everything from

[01:05:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3912s) Morpheus perspective is outside of its

[01:05:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3914s) area because it knows about these those

[01:05:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3916s) aren't OPF routes. All of this is

[01:05:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3919s) interer routing. Um so so we now

[01:05:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3924s) >> interesting question for you. What if I

[01:05:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3926s) had let's say Morpheus was configuring a

[01:05:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3929s) router. He's configuring one of those

[01:05:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3931s) area border routers and so the traffic

[01:05:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3934s) that he's sending from his keyboard, it

[01:05:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3936s) is destined to that area border router.

[01:05:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3938s) Would the the loop back address would

[01:05:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3940s) that I mean would that necessarily be an

[01:05:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3942s) area is that out of area at that point?

[01:05:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3946s) >> Yeah.

[01:05:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3947s) >> Okay.

[01:05:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3948s) >> Yeah. So you're you're saying when so

[01:05:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3952s) let me let me make sure I'm hearing you.

[01:05:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3954s) These loop back IP addresses you're

[01:05:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3955s) saying are these out of Morpheus's area?

[01:05:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3958s) >> Right. Right. Because I mean like if the

[01:06:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3960s) traffic is destined for that area border

[01:06:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3962s) router itself, it does have an interface

[01:06:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3964s) in Morpheus's area.

[01:06:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3966s) >> Yep.

[01:06:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3969s) >> So

[01:06:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3971s) >> is it all out of area?

[01:06:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3973s) >> Remember inter. So you're bringing up a

[01:06:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3975s) I think a good point. Let me make sure

[01:06:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3977s) I'm I'm hearing you correctly when

[01:06:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3979s) you're talking about this. So are these

[01:06:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3983s) out of Morpheus's area? No. These are

[01:06:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3987s) all Area 51. But remember,

[01:06:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3989s) >> right,

[01:06:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3989s) >> these are not OPF routes from Morpheus

[01:06:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3994s) perspective. They are connected routes.

[01:06:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=3996s) Connected connected. So this is all in

[01:06:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4000s) his area, but it doesn't even see that

[01:06:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4001s) as an OPF route because it's got a

[01:06:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4002s) connected interface to it. As soon as

[01:06:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4005s) you go here, um, so routers aren't in in

[01:06:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4008s) areas. Interfaces are Neo is not in an

[01:06:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4013s) area. Neo's interfaces are in areas,

[01:06:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4016s) right? Neo is kind of split. He's got a

[01:06:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4019s) line drawn right down the middle of him

[01:07:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4021s) and he's got half of them in Area 51 and

[01:07:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4023s) half over here. So when we added this

[01:07:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4026s) interface to area zero from Morpheus's

[01:07:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4029s) perspective, if you've got little

[01:07:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4030s) eyeballs here, he now sees that as an

[01:07:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4034s) inter area route because it's outside of

[01:07:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4036s) his area. Is it does that does that

[01:07:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4039s) help? Is that what you were asking,

[01:07:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4040s) Micah?

[01:07:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4040s) >> That's exactly what I was after right

[01:07:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4042s) there. Yeah.

[01:07:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4043s) >> Got it. And that's that. I'm glad you

[01:07:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4045s) asked that because a lot of people get

[01:07:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4046s) confused on that. So, let me do I'm just

[01:07:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4049s) going to do uh I'm going to make sure I

[01:07:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4051s) have no IP domain lookup because uh DNS

[01:07:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4054s) lookups are are terrible. And I'll do a

[01:07:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4056s) trace route. Let's trace route all the

[01:07:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4058s) way to Oracle. Uh hey, that's awesome.

[01:07:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4062s) We can even see load balancing happening

[01:07:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4065s) because remember every every packet gets

[01:07:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4067s) sent three times. So, it's like it sent

[01:07:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4068s) one there, one there, and one there. So,

[01:07:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4071s) it's load balancing uh for the three

[01:07:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4073s) packets it sent between the two. Uh then

[01:07:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4076s) it hits uh whoever that is. I think

[01:07:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4078s) that's agent Smith. Then it hit uh the

[01:08:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4080s) oracle right there on the other side.

[01:08:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4082s) So, we have full connectivity.

[01:08:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4084s) Boom.

[01:08:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4086s) Phase two done. Before we go to phase

[01:08:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4090s) three,

[01:08:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4091s) um let's um which I haven't even read

[01:08:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4095s) this part yet. So, let's uh let's take

[01:08:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4098s) any questions that you guys have. uh so

[01:08:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4101s) far. So, so

[01:08:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4102s) >> before we before we get into the

[01:08:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4104s) questions really quick, just want to do

[01:08:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4105s) a mid break if you guys haven't signed

[01:08:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4107s) up for the summer of CCNA yet. Here's a

[01:08:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4109s) Q QR code on the screen. Uh but also, we

[01:08:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4112s) have the fall of CCNA coming. So, stay

[01:08:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4114s) tuned for that. We'll be announcing that

[01:08:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4116s) on socials. And if you haven't joined us

[01:08:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4117s) on Discord, please join us on Discord

[01:08:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4120s) because that's where all the fun

[01:08:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4121s) happens. We just did a giveaway earlier

[01:08:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4123s) where we're giving we gave away a

[01:08:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4124s) voucher for the fall in the CCNA. And I

[01:08:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4126s) know been asked already for another one.

[01:08:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4128s) So, in a few more minutes, we're going

[01:08:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4130s) to be doing another way giveaway on

[01:08:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4132s) Discord. So, please consider joining us

[01:08:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4133s) over there. And then just one more

[01:08:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4135s) special shout out for our partners at

[01:08:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4138s) Skillbit who help us host all of our

[01:09:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4141s) virtual labs that we offer through

[01:09:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4142s) summer CCNA and they've been fantastic

[01:09:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4145s) to partner with because they've been

[01:09:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4146s) reliable. They've been accessible pretty

[01:09:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4149s) much always and uh they've been really

[01:09:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4151s) good for the students. I think they've

[01:09:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4152s) enjoyed them a lot. So, definitely give

[01:09:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4154s) uh Skillbit a shout out as well.

[01:09:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4157s) >> Yes. Thank you.

[01:09:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4158s) >> I I like Putty's comment. Claude has no

[01:09:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4160s) chance. That's right. Phase by phase.

[01:09:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4163s) I'm proving Claude wrong. Although

[01:09:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4164s) Although I've only got half an hour

[01:09:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4166s) left. I've got three more objectives.

[01:09:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4167s) So, but they're but they're they're not

[01:09:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4168s) as not as big, I don't think. So,

[01:09:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4170s) >> oh, and also, uh, Chuck is at Defcon

[01:09:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4173s) while he's there. We hacked his YouTube

[01:09:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4174s) channel. So, that's why he's not here

[01:09:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4176s) with us today. Just

[01:09:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4178s) >> there was a comment about that as

[01:09:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4179s) somebody was saying his his password

[01:09:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4181s) must been really stupid easy to guess.

[01:09:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4183s) Something like one, two, three, four,

[01:09:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4184s) five, six. And I was like, "Yeah,

[01:09:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4185s) classic chalk."

[01:09:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4187s) >> Yeah, we did it.

[01:09:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4188s) >> But, uh,

[01:09:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4188s) >> hey, what what question do you have,

[01:09:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4190s) Micah?

[01:09:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4190s) >> Uh, okay. Well, uh, I liked this one

[01:09:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4192s) immediately. Um, does OPF have to be

[01:09:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4195s) configured for HSRP?

[01:09:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4197s) >> No. Uh, two completely different

[01:10:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4200s) concepts. OPF routing protocol for the

[01:10:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4203s) network? HSRP, you can think of that as

[01:10:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4205s) like the uh redundant default gateway.

[01:10:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4208s) Um, so, so if you're running HSRP and

[01:10:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4211s) you're wanting to layer OPF on top of

[01:10:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4214s) that, um, no, uh, you don't need to

[01:10:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4217s) worry worry about that interaction

[01:10:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4219s) because OPF will inform all the routers

[01:10:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4221s) of all the interfaces it needs if

[01:10:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4224s) something goes down. Um, so there

[01:10:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4226s) there's I know it's a very single line

[01:10:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4228s) question right there, but there's a lot

[01:10:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4230s) of depth we could go into that, but the

[01:10:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4232s) short answer is no.

[01:10:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4234s) >> All right. Uh, one not so serious and

[01:10:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4237s) then others that are serious. Was that

[01:10:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4239s) Jeremy Ross?

[01:10:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4241s) [laughter]

[01:10:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4242s) >> We just had to had to do it. Okay. And

[01:10:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4245s) then this one, this one keeps on coming

[01:10:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4246s) up uh over and over and over here. Is

[01:10:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4249s) CML better than Packet Tracer for CCNA?

[01:10:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4252s) Now, I threw out a comment in there and

[01:10:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4254s) I said it's very it's heavy compared to

[01:10:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4256s) Packet Tracer, but

[01:10:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4257s) >> it is so much better than Packet Tracer.

[01:11:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4260s) I'm just going to throw I'll give you

[01:11:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4261s) the definit Yes. Okay. Let me say if all

[01:11:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4264s) you've got is a small little laptop and

[01:11:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4266s) it can barely boot, use Packet Tracer.

[01:11:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4268s) Um because you can run that everywhere.

[01:11:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4271s) But Cisco Modeling Labs is the real IOS.

[01:11:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4275s) It's running images of the IOS. So you

[01:11:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4278s) won't the I I'm going to go in I'm not

[01:11:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4282s) going to start a rant or a soapbox, but

[01:11:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4284s) I think the most frustrating thing when

[01:11:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4286s) you're studying is when you're building

[01:11:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4289s) a lab in PacketRacer. And again,

[01:11:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4290s) PacketRacer is great. you can do labbing

[01:11:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4292s) but when you run into a software bug um

[01:11:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4295s) and then you don't know am I doing and

[01:11:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4298s) you spend hours and then you do

[01:11:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4300s) something like let me just restart

[01:11:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4301s) packet tracer and everything starts

[01:11:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4303s) working you're like

[01:11:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4304s) >> I'm so done with this I'm so done I'm

[01:11:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4306s) done with Cisco I'm done with technology

[01:11:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4307s) I'm going to be a painter you know or

[01:11:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4310s) like it becomes

[01:11:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4312s) >> so been there been there and before we

[01:11:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4315s) had CML I mean it was um sh don't tell

[01:11:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4317s) anybody about bootlegging uh iOS images

[01:12:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4320s) from really dodg websites and loading

[01:12:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4323s) them up into virtual

[01:12:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4326s) machines in Google Cloud and all this.

[01:12:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4328s) Yeah, it's it's it's a really great

[01:12:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4330s) package CML. So, um okay, we were

[01:12:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4332s) talking about this one right here. So, I

[01:12:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4334s) feel like to reiterate, um

[01:12:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4336s) >> All right, last question and we'll we'll

[01:12:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4337s) jump back in.

[01:12:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4338s) >> The CCNA, are we going to be required to

[01:12:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4340s) configure ABRs?

[01:12:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4342s) >> I don't think so. Um I've I've I've

[01:12:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4345s) spoken with uh Eric Pope. Uh he took the

[01:12:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4348s) exam up at Cisco uh Cisco Live. Uh he

[01:12:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4351s) said they did not have multi area OSBF.

[01:12:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4353s) So um so I think you're safe. Um but now

[01:12:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4358s) you know how to if you ever do encounter

[01:12:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4360s) that. You probably will need to know

[01:12:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4362s) what an ABR is. Maybe just not configure

[01:12:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4364s) it.

[01:12:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4366s) >> Okay. Thanks Russ. Thanks Russ. Let's do

[01:12:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4368s) it. Um all right. Prove it. Agent Smith

[01:12:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4371s) requesting a signoff meeting. Before I

[01:12:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4373s) tell command this migration is solid. I

[01:12:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4375s) need answers. Three of us, me, Neo, and

[01:12:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4377s) Trinity, all sit on the same segment

[01:12:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4379s) through switch one. Uh, yes, Agent

[01:13:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4382s) Smith, you are correct. So, this it's

[01:13:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4384s) talking about the backbone right here.

[01:13:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4385s) They're all right there. Uh, it says

[01:13:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4388s) somebody's in charge of that segment,

[01:13:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4390s) whether we voted on it or not. I want to

[01:13:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4392s) know who and why. I also want proof, not

[01:13:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4394s) a guess, that something in Zion can

[01:13:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4397s) still reach something in my outpost

[01:13:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4398s) area. I want to understand why my route

[01:13:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4401s) why a route inside my area looks

[01:13:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4403s) different in the table than a route in

[01:13:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4405s) Zion does. Okay.

[01:13:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4408s) So the short so the requirements outside

[01:13:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4410s) of the agent smith drama is identify

[01:13:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4413s) which router is acting as the designated

[01:13:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4415s) device on switch one segment and be able

[01:13:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4418s) to justify why that router is not one of

[01:13:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4422s) the other two. Okay. So what it's

[01:13:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4424s) talking about in this is the concept of

[01:13:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4428s) the OPF DR and BDR. So anytime you have

[01:13:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4433s) a shared segment essentially every

[01:13:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4435s) Ethernet segment um you will have

[01:13:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4437s) neighbor relationships form. Well this

[01:14:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4440s) could be I mean I've got three but you

[01:14:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4441s) could have hundreds of routers on a

[01:14:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4443s) backbone that are all plugged into that

[01:14:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4445s) switch right. Um, and the problem is

[01:14:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4447s) when you have neighbor relationships

[01:14:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4449s) forming between all of these different

[01:14:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4452s) routers and something happens, let's say

[01:14:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4454s) that network goes down, you start a

[01:14:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4456s) fireworks storm. It's like, oh, it's

[01:14:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4457s) down, it's down, it's down. They all

[01:14:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4458s) start like telling each other and it's

[01:14:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4460s) like, ah, this is crazy. So, instead

[01:14:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4463s) they came up with this concept of the DR

[01:14:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4465s) and BDR. Um, that is essentially the

[01:14:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4468s) king and the queen of the network. uh

[01:14:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4472s) this is the one who maintains all the

[01:14:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4474s) neighbor relationships and the routing

[01:14:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4476s) table it's going to be the biggest

[01:14:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4478s) baddest most connected router that we

[01:14:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4481s) have and so in this diagram so first

[01:14:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4484s) thing it says uh which one is it and so

[01:14:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4487s) let's let's go to agent Smith and let's

[01:14:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4489s) do the quickest way you can do that is

[01:14:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4492s) actually a couple ways um you can do a

[01:14:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4495s) show ipospf interface and

[01:14:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4499s) let's see agent Smith has Ethernet zero

[01:15:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4502s) zero connected to the backbone. So I'll

[01:15:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4504s) type that in. E0.

[01:15:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4506s) Um oh right there I can see network type

[01:15:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4510s) broadcast and I I saw it right at the

[01:15:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4512s) top. State drug.

[01:15:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4515s) Um that stands for DR other. You're

[01:15:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4517s) either a DR a BDR or you're a DR other

[01:15:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4521s) meaning you're neither. Um which is what

[01:15:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4523s) Agent Smith is right now. So Agent Smith

[01:15:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4525s) is like hey who's the DR and BDR?

[01:15:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4528s) Fastest way you can tell is do a show

[01:15:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4530s) ipospf

[01:15:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4532s) uh neighbor.

[01:15:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4534s) [laughter]

[01:15:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4535s) That's [snorts] pretty funny. Zach, I

[01:15:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4537s) just have to show that one. That's

[01:15:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4540s) >> Oh, brother.

[01:15:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4542s) >> I'd rather be a BDR.

[01:15:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4544s) >> Oh, a couple couple things that I want

[01:15:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4546s) you to catch here. Um, notice that we've

[01:15:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4548s) got Okay, neighbor 2222 and 333.

[01:15:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4552s) Um, now remember we numbered these. So

[01:15:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4555s) Neo is 2222, Trinity is 3333. And you

[01:16:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4560s) can see

[01:16:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4562s) that

[01:16:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4564s) NEO is the BDR, right? Trinity is the DR

[01:16:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4569s) of the network.

[01:16:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4571s) Now, where a lot of confusion comes in

[01:16:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4573s) when people are first learning this

[01:16:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4574s) concept is they're like, uh, what the

[01:16:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4577s) what like how what h how do you have a

[01:16:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4582s) BDR? I thought remember every network

[01:16:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4586s) segment gets its own DR and BDR. So

[01:16:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4589s) coming back to this diagram um right

[01:16:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4593s) here

[01:16:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4594s) this is a segment right bunch of devices

[01:16:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4599s) connected to that switch this is a

[01:16:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4603s) segment

[01:16:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4605s) segment segment right so there will be a

[01:16:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4608s) DR and BDR here I'm just pulling I don't

[01:16:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4611s) know which one is which there will be a

[01:16:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4612s) DR and BDR here there will be a DR and

[01:16:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4615s) BDR here there every segment gets its

[01:16:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4618s) own DR R and BDR. Um, so and that is

[01:17:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4622s) that is the king and the queen of that

[01:17:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4626s) specific segment. So in this case, they

[01:17:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4628s) don't really need to have one, but but

[01:17:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4630s) that's that's the concept of that. So uh

[01:17:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4634s) the now I'm going to grab Trickle's

[01:17:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4636s) question right there. Can you throw that

[01:17:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4637s) up on the on the screen? Um, Trickle

[01:17:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4640s) said, "So is the segments the same thing

[01:17:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4641s) as areas?" Great question. And no,

[01:17:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4644s) they're not. segment is an Ethernet

[01:17:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4647s) network like um and I this is a small

[01:17:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4650s) diagram because I'm I'm using the free

[01:17:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4652s) version but I could have another router

[01:17:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4654s) here and another router here another

[01:17:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4656s) router here uh that's connected so this

[01:17:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4658s) this is a segment this is a segment this

[01:17:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4660s) is a segment essentially any LAN network

[01:17:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4664s) connecting um between two OPF routers is

[01:17:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4667s) considered a segment and area can

[01:17:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4669s) contain a whole bunch of segments right

[01:17:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4673s) now Um, I'm going to I'm going to add

[01:17:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4676s) one one thing here

[01:17:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4678s) >> really quick. Jeremy, is it possible to

[01:18:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4680s) provide the the YAML file for this lab

[01:18:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4683s) for everybody?

[01:18:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4683s) >> Oh, sure, totally. Totally. Um,

[01:18:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4685s) >> we'll get that. We'll put it in the chat

[01:18:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4687s) probably after the stream. So, thank

[01:18:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4688s) you. I'm sorry to interrupt.

[01:18:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4690s) >> No problem. Yeah, it'll save you a lot

[01:18:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4691s) of time building this thing. Um, so, uh,

[01:18:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4694s) normally in the real world, uh,

[01:18:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4697s) pointto-point connections, you don't

[01:18:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4699s) usually have them connecting over

[01:18:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4700s) Ethernet. you do sometimes, but but

[01:18:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4702s) it'll be like a serial link or a dialup

[01:18:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4705s) connection if you're really old, frame

[01:18:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4707s) relay connection, all that kind of

[01:18:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4708s) stuff. And so when you have a

[01:18:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4709s) point-to-point network um that's not

[01:18:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4712s) Ethernet, it won't do a DR and BDR

[01:18:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4715s) election. It'll just say, "Oh, we'll

[01:18:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4716s) just send packets back and forth between

[01:18:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4718s) them." That I'm getting into CCNP stuff.

[01:18:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4720s) So So for now, segments that that's So

[01:18:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4724s) in this case, the area does match the

[01:18:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4727s) segment, but that's just because I have

[01:18:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4728s) a a small network.

[01:18:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4731s) Um, so, uh, it doesn't tell us in the

[01:18:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4734s) lab which one we should make the the

[01:18:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4737s) DRBDR. We just want to make sure we know

[01:18:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4739s) who it is and make sure it doesn't

[01:19:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4741s) change. By default, the router with the

[01:19:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4745s) highest IP address or router ID is going

[01:19:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4748s) to become DR or BDR. Um, so I'm going to

[01:19:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4752s) instead overrule that and I'm going to

[01:19:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4753s) make agent Smith the DR. Um, watch this.

[01:19:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4757s) So, I'm going to go into show ipospf

[01:19:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4760s) interface Ethernet0.

[01:19:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4763s) And you can see right now it is the Dr.

[01:19:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4766s) Um, and what I'm going to do is I'm

[01:19:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4768s) going to go in uh and change its

[01:19:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4771s) priority. The highest IP address is only

[01:19:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4774s) used to elect a DR and BDR if the

[01:19:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4776s) priorities are tied. And everybody's

[01:19:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4779s) priority is one of the box. So, I'm

[01:19:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4781s) going to go into interface Ethernet 0.

[01:19:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4784s) It's an interface command. IPOPF

[01:19:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4788s) uh process ID one. Nope, actually no

[01:19:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4790s) process ID. Uh priority

[01:19:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4794s) and I'll put 100. I could put two as

[01:19:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4797s) long as it's one bigger than one. Uh

[01:19:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4799s) it'll win. So priority 100. I'll come

[01:20:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4802s) back here and do a show ipospf

[01:20:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4805s) um interface Ethernet 0/z. And you'll

[01:20:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4808s) see what's what it's broken. Is this

[01:20:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4813s) troubleshooting? Do we get a free

[01:20:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4815s) t-shirt? No. you don't uh even though it

[01:20:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4817s) says priority 100 uh the only time it

[01:20:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4821s) does another DR and BDR election is if

[01:20:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4824s) you reset the OPF process. That's a big

[01:20:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4827s) command for you to know. I'm going to

[01:20:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4829s) type in clear ipf [clears throat]

[01:20:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4831s) process or you could reboot the routers.

[01:20:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4833s) It's just less less time. Um clear it

[01:20:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4837s) resets all the neighbor relationships.

[01:20:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4839s) And now when I do a show ipospf

[01:20:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4843s) interface. Oh no.

[01:20:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4846s) Hang on. I think I need to clear the

[01:20:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4847s) other guys. There's no t-shirts. Hang

[01:20:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4850s) on. [laughter]

[01:20:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4851s) Neo Neo and Trinity. Hang on. Let's go

[01:20:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4854s) to uh Neo Trinity. Clear IP OSBF process

[01:20:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4858s) because I don't think it's preemptive.

[01:20:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4859s) They will not give it up unless some

[01:21:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4862s) they like nobody will take it from me

[01:21:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4864s) out of my dead cold hand. Show clear.

[01:21:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4868s) What am I talking about? Clear IPOPF

[01:21:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4871s) process on Trinity. Yes. Okay. Now,

[01:21:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4875s) let's take a look at agent Smith. Uh

[01:21:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4877s) neighbors are reforming. Show ipospf.

[01:21:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4883s) Neighbor.

[01:21:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4890s) Uh there we go. We're we're building the

[01:21:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4893s) neighbor relationships. And now you can

[01:21:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4894s) see at least from this perspective uh

[01:21:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4897s) Neo is the brother. You're the brother.

[01:21:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4900s) It sounds like an insult. Uh interface

[01:21:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4902s) and I'm going to do a show ip OPF

[01:21:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4906s) interface Ethernet zero. And now now now

[01:21:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4911s) we see this guy has become

[01:21:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4915s) and I hit the enter key. This agent

[01:21:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4917s) Smith has become the DR priority 100. If

[01:22:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4921s) I go over to Neo and do a show ipospf

[01:22:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4925s) interface

[01:22:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4927s) Ethernet0.

[01:22:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4929s) Um, now this guy, you're the brother. So

[01:22:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4933s) funny.

[01:22:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4934s) >> That's it, Zach. We got to get some

[01:22:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4935s) stickers. Like, you're the brother.

[01:22:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4937s) >> There. There are so many t-shirts

[01:22:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4939s) [laughter] out of this. Um, good.

[01:22:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4941s) [clears throat]

[01:22:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4941s) >> Brother.

[01:22:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4942s) >> So, now we know that uh that prove it,

[01:22:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4946s) Agent Smith. You are the DR and you will

[01:22:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4949s) never not be the DR because your

[01:22:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4951s) priority is set high enough. Okay, now

[01:22:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4956s) let's let's uh I I don't want Claude to

[01:22:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4958s) win here. Phase four, shrinking the

[01:22:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4960s) table. This is where it gets cold.

[01:22:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4962s) Morpheus mildly annoyed. I stood up

[01:22:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4965s) three more systems in Zion. Okay, hang

[01:22:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4967s) on. Let's make sure we're we're seeing

[01:22:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4968s) the uh the picture here.

[01:22:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4971s) Morpheus is over here in Zion. There's

[01:22:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4973s) his three systems. I set up three more

[01:22:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4976s) systems. Zion power grid water reclaim

[01:22:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4978s) uh reclamation re reclaim reclaimed

[01:23:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4981s) aerrow lock control. All three of them

[01:23:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4983s) are on my end all out of the same block.

[01:23:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4986s) Command tells me every other router on

[01:23:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4987s) the network is now carrying all three as

[01:23:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4990s) separate entities entries and they want

[01:23:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4993s) that gone. They should see Zion as one

[01:23:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4995s) line in the table, the routing table,

[01:23:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=4998s) not three. But I still need every one of

[01:23:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5001s) those systems reachable individually

[01:23:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5003s) from inside Zion. So requirement, we're

[01:23:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5007s) going to reduce Zion's footprint outside

[01:23:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5009s) of Area 51 to a single summarized entry

[01:23:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5013s) representing the full block of those

[01:23:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5015s) three systems. A SL16. Okay. So let me

[01:23:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5019s) let me translate that into plain English

[01:23:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5021s) and out of Morpheus speak. Uh so in

[01:23:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5024s) short, we've got let me grab my pen

[01:23:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5027s) here. We've got three, we'll call them

[01:23:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5029s) VLANs. I've got loop back interfaces

[01:23:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5031s) here that are connected to three

[01:23:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5033s) different networks. Uh the power grid,

[01:23:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5036s) Aerlock, control, and water reclamation

[01:23:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5039s) reclaim. Yes. Um and so, so

[01:24:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5043s) that now is going to be three entries in

[01:24:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5045s) everybody's routing table. The bigger

[01:24:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5047s) your routing table, the slower your

[01:24:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5049s) router. So, what we're going to do is

[01:24:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5051s) summarize that. And the only place you

[01:24:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5054s) can do that in OPF is the area border

[01:24:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5058s) router. I just thought of something

[01:24:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5060s) that's going to be really cool. So,

[01:24:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5062s) here's how you do it. So, we've got

[01:24:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5065s) 1727. So, let me let me um let me

[01:24:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5067s) actually show you a couple things. Um

[01:24:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5069s) first off, I want to show you at the

[01:24:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5071s) Oracle. Uh let's do Oh, I have to make

[01:24:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5074s) this bigger. I'm going to do a uh

[01:24:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5078s) uh show ip

[01:24:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5081s) route and we'll do include 172.17.

[01:24:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5087s) Um

[01:24:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5088s) that did not work like I thought it was.

[01:24:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5090s) Show ip route. Uh let's do OPF. Uh oh

[01:24:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5095s) 17216.

[01:24:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5097s) Is that what it is?

[01:24:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5099s) Oh man,

[01:25:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5102s) my diagram's wrong.

[01:25:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5105s) Nobody caught that. I caught that. That

[01:25:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5107s) was me. I caught that. See,

[01:25:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5108s) >> Jeremy gets a shirt. Yeah,

[01:25:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5111s) >> Jeremy gets a shirt.

[01:25:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5112s) >> I finally get a shirt. I get a summer of

[01:25:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5114s) CCNA shirt. Okay, so wait a sec. Uh,

[01:25:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5116s) what's Oracle then? Uh,

[01:25:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5119s) hang on. Let's do a show ip interface

[01:25:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5122s) brief.

[01:25:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5124s) Ah, no.

[01:25:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5127s) >> Do I I think I duplicated. Oh, wait a

[01:25:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5130s) sec.

[01:25:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5132s) I think that's what I did. I did this in

[01:25:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5135s) the diagram and I forgot to actually

[01:25:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5137s) change it on the router. Um because it

[01:25:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5140s) was the last thought I had. So hang on,

[01:25:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5142s) let's fix this. We can fix it.

[01:25:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5146s) >> Show IP interface brief.

[01:25:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5149s) >> Yeah, that's what I did

[01:25:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5151s) back 10. IP address 172710.1.

[01:25:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5157s) Uhhuh. Uhhuh. Uhhuh.

[01:26:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5160s) Uh, and now we'll just hit the up arrow.

[01:26:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5165s) 11

[01:26:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5168s) and 12.

[01:26:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5171s) There we go. And now let's do a show.

[01:26:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5175s) Hopefully I didn't show run section OPF.

[01:26:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5179s) I may have an OPF command to fix too.

[01:26:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5182s) Router OPF1.

[01:26:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5184s) Man, no one caught that. I was I was I

[01:26:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5187s) was moving too fast. Uh, no. I know. Say

[01:26:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5190s) right now there are probably like five

[01:26:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5191s) people that are like, I knew that was

[01:26:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5193s) wrong. And and so uh yes, 172600

[01:26:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5199s) 255 255 area 51. And we'll hit the up

[01:26:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5203s) arrow and put 17 in there instead. There

[01:26:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5207s) we go.

[01:26:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5209s) Save config. All right. So now we should

[01:26:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5212s) go over the Oracle. That's that's why

[01:26:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5214s) that command didn't work. I'll do the uh

[01:26:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5216s) show ip route and uh include There we

[01:26:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5218s) go. 17217

[01:27:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5220s) just I by the way this is include it's

[01:27:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5222s) just like the GP command in Linux just

[01:27:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5224s) filters it down to exactly that so I

[01:27:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5227s) don't scroll the whole page. Um so I see

[01:27:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5229s) the the three individual networks. Now

[01:27:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5232s) what I'm going to do is I'm going to go

[01:27:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5234s) to Neo and we're going to do some route

[01:27:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5236s) summarization. Uh Neo is the ABR. Oh

[01:27:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5240s) that's not how I go to Neo. I go to Neo

[01:27:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5242s) like this. Neo is the ABR

[01:27:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5246s) and uh

[01:27:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5251s) what have I done?

[01:27:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5254s) What does Q do?

[01:27:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5257s) Micah, if I type Q on Neo. Oh, that's

[01:27:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5259s) what it does.

[01:27:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5262s) It has no See, this is this is why I

[01:27:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5264s) type no IP domain lookup is it's trying

[01:27:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5267s) There we go. It's trying to resolve Q

[01:27:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5268s) via DNS server. So, I didn't type that

[01:27:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5271s) on Y. Okay, there we go. It's back in

[01:27:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5273s) the real world. That's where you have

[01:27:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5274s) pretty much uh heart failure um and and

[01:27:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5277s) perish. Um so I'm going to go into

[01:28:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5280s) global configuration mode router OPF1

[01:28:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5285s) and we're going to do area. So here's

[01:28:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5289s) this is going to boggle your mind for a

[01:28:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5291s) quick second and then it'll make sense.

[01:28:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5293s) We'll do area 51,

[01:28:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5296s) right? Because that's where those routes

[01:28:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5298s) are at. And I'm going to define a range.

[01:28:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5302s) So I'll type in range

[01:28:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5306s) 172.17.0.0

[01:28:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5309s) with a subnet mask of 255.255.0.0.

[01:28:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5313s) What I'm saying is I want to replace

[01:28:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5315s) those three routes that are coming out

[01:28:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5317s) of Area 51 with just this one summary.

[01:28:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5320s) Now, if you're thinking, you might be

[01:28:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5322s) like, well, you're going to take the

[01:28:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5323s) whole block of 17217. You can't use that

[01:28:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5326s) anywhere else in the network, right?

[01:28:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5327s) That's right. Uh, it's lazy

[01:28:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5329s) summarization. When you get more

[01:28:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5331s) sophisticated subnetting, you can get

[01:28:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5333s) more specific. But for now, that's

[01:28:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5335s) that's what Morphe has told. Morpheus

[01:28:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5336s) has told me to do it. And then I'll hit

[01:28:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5338s) the question mark. And you can see uh by

[01:29:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5340s) default it says advertise this range or

[01:29:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5343s) not advertise this range. You actually

[01:29:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5344s) can do that. And you can even set

[01:29:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5346s) special costs on this. But I'll hit the

[01:29:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5348s) enter key. Now, here's here's what I

[01:29:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5350s) wanted to show you that I just thought

[01:29:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5351s) of when I was doing this.

[01:29:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5354s) Neo is now summarizing

[01:29:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5357s) those networks as it comes over here to

[01:29:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5360s) Agent Smith and the Oracle. Right?

[01:29:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5363s) But watch this. I'm going to go over to

[01:29:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5365s) the Oracle. Not there. I'll go right

[01:29:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5368s) here.

[01:29:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5370s) Bring her up and hit the up arrow. And

[01:29:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5372s) I'll do that same show ip route command.

[01:29:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5374s) Look at this. We've got now 17216 or

[01:29:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5379s) 172170.0.016.

[01:29:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5382s) There's the summary route, but we still

[01:29:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5385s) see the more specific routes.

[01:29:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5388s) Why? Like, what was the point of that?

[01:29:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5391s) Why Why do we still Why do we still see

[01:29:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5394s) those?

[01:29:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5395s) Let me show you the picture of the

[01:29:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5396s) diagram.

[01:29:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5398s) Any guesses?

[01:30:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5405s) Neo is summarizing 172.17.0.016.

[01:30:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5409s) zero16.

[01:30:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5414s) Trinity is not.

[01:30:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5417s) So, Trinity is taking those specific

[01:30:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5419s) routes and sending them this way. Now,

[01:30:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5420s) you might be like, "Oh, well, that's not

[01:30:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5422s) a big deal." Well, here's what here's

[01:30:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5425s) what's going to happen is Agent Smith is

[01:30:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5427s) going to get those. And the number one

[01:30:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5430s) rule of routing is specificity wins.

[01:30:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5434s) That is a fun word to say, specificity.

[01:30:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5436s) meaning these are going to be the more

[01:30:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5438s) specific routes. This one is more broad.

[01:30:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5441s) So if I were to look at agent Smith's

[01:30:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5443s) routing table right now, um it would be

[01:30:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5446s) using only these. It would completely

[01:30:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5449s) ignore. So this this path through NEO to

[01:30:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5452s) get to those networks is now going to

[01:30:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5454s) never it will never be used because this

[01:30:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5457s) is a broader network than the

[01:30:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5459s) specificity wins. So it will always be

[01:31:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5462s) going that direction, right?

[01:31:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5465s) So, uh, now let's fix Trinity and get

[01:31:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5469s) her summarizing, too. Oh, man. Nine

[01:31:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5471s) minutes. We can do it. I'll go into

[01:31:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5474s) global configuration mode. Router OPF1

[01:31:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5478s) area 51 range 17217.0.0

[01:31:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5483s) with a uh subnet mask 2552500

[01:31:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5488s) 0. Boom. Just like that. Uh, we have now

[01:31:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5491s) implemented two ABRs with route

[01:31:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5494s) summarization. And now I can go over

[01:31:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5496s) here to the Oracle do a show ip route.

[01:31:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5503s) Uh, we have shrunk the routing table

[01:31:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5505s) just like agent Smith was uh uh uh

[01:31:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5509s) yelling at. We now have one route

[01:31:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5512s) instead of all the more specific ones.

[01:31:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5515s) That I know it seems simple but that's

[01:31:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5517s) the benefit that you get when you do

[01:31:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5519s) multi- area OPF. Um and that is

[01:32:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5523s) shrinking the table. Uh so now

[01:32:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5528s) um the man I can't believe I did this.

[01:32:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5532s) Um the out what what have I done? The

[01:32:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5536s) outpost doesn't need to know everything.

[01:32:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5538s) So the oracle watching agent Smith's

[01:32:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5540s) status board fill up with routes. She

[01:32:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5542s) says, "My equipment is older than

[01:32:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5544s) everyone else's on the network. It only

[01:32:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5546s) has one way out anyway through Agent

[01:32:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5548s) Smith." Right? So, this is the Oracle

[01:32:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5550s) speaking now. She's like, "Look, I've

[01:32:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5553s) only got one path out. Why do I need all

[01:32:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5557s) of these routes in my routing table,

[01:32:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5559s) right?

[01:32:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5560s) >> Stubby to me.

[01:32:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5563s) >> You're thinking it. I don't need to see

[01:32:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5565s) the shape of Zion's network or the

[01:32:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5566s) backbone and I just I have one decision

[01:32:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5568s) to make. Send it to Smith." Uh, so every

[01:32:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5571s) route you're flooding here that isn't

[01:32:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5572s) mine is just something for my hardware

[01:32:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5574s) to store and never use. So

[01:32:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5577s) >> reduce the routing information in area

[01:32:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5579s) 22 [clears throat] to receive and store

[01:33:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5581s) the absolute minimum uh using the fact

[01:33:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5584s) that area 22 only has one way in or out.

[01:33:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5588s) Okay. Um the we're we're uh the we'll go

[01:33:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5593s) to phase five so that I can [laughter]

[01:33:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5596s) Claude curse you. It was not okay.

[01:33:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5599s) Claude said this would be three

[01:33:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5600s) sessions. I if I were to take an extra

[01:33:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5602s) 15 minutes, I could do it. But but we'll

[01:33:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5604s) we'll we'll just go up to five because

[01:33:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5605s) we're already beyond CCNA anyway. But

[01:33:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5607s) what this is talking about is we've got

[01:33:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5610s) uh uh everybody's like AI is so much

[01:33:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5614s) smarter than you, Jeremy. We got fresh

[01:33:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5616s) cookies. [laughter]

[01:33:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5618s) Only has one route out, right? So why do

[01:33:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5621s) you need a routing table full of all the

[01:33:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5622s) routes of all the OPF areas when you

[01:33:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5625s) just have one? So when you get into CCNP

[01:33:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5629s) topics, you'll see that these are all I

[01:33:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5633s) know you've got three areas here, but

[01:33:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5635s) they're all considered standard areas.

[01:33:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5639s) Now, this is a backbone area, so it's a

[01:34:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5640s) little spec special, but you can also

[01:34:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5642s) have there are two different types of

[01:34:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5644s) areas, and I I kid you not. Uh you have

[01:34:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5647s) stub areas,

[01:34:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5649s) and you have totally stub.

[01:34:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5654s) Coolest concept ever. Uh so stub areas

[01:34:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5658s) automatically filter anything that is

[01:34:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5660s) outside the OPF system. So um one of the

[01:34:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5664s) things you can do is you can actually

[01:34:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5665s) take routes from outside. Let's say

[01:34:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5667s) you've got BGP routes or a default route

[01:34:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5670s) or EIGP, you know, something up here. Um

[01:34:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5672s) and you can send those routes into the

[01:34:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5674s) system. Those are known as external

[01:34:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5677s) routes. And by the way, that causes this

[01:34:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5679s) router to be called an ASBR,

[01:34:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5682s) autonomous system boundary router, but

[01:34:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5684s) you don't need to know that. Uh, but

[01:34:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5685s) that's a stub a totally stubby area,

[01:34:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5688s) which you know, somebody from California

[01:34:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5690s) is like, "Okay, it was a stub." And if

[01:34:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5694s) we filter more,

[01:34:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5696s) >> it'd be totally stubby. Yeah.

[01:34:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5699s) >> Stubby, dude. [snorts] Uh and so totally

[01:35:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5701s) stubbed area says I will filter any

[01:35:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5705s) route from outside of the area and

[01:35:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5707s) replace it with the default with

[01:35:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5710s) default. Yeah.

[01:35:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5711s) >> So here's what we do. Um

[01:35:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5716s) and we will go to agent Smith because

[01:35:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5718s) all areas have to agree that this is a a

[01:35:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5721s) a totally sub area. So I'm going to go

[01:35:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5724s) into agent smith which which timed out.

[01:35:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5726s) Um, I'll do a show run section OPF

[01:35:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5731s) global configuration mode router OPF1.

[01:35:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5735s) And I'm gonna I'm gonna take um take

[01:35:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5738s) this guy and type in area 22. And you

[01:35:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5740s) can see all the different things that we

[01:35:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5742s) can uh type in. You can see one of them

[01:35:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5745s) is stub

[01:35:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5747s) stub. And then you can add one more uh

[01:35:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5750s) command onto that. No summary, which is

[01:35:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5752s) a totally stub area. Uh it's because

[01:35:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5756s) ABRs are sending summary routes. We're

[01:35:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5758s) saying I don't even want summary routes.

[01:36:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5760s) So this will be a totally stubby area.

[01:36:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5762s) Now that will tear down the the neighbor

[01:36:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5764s) relationship to the Oracle because they

[01:36:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5766s) have to agree that they're in a stub

[01:36:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5767s) area. So I'm going to go over to the

[01:36:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5769s) Oracle and I'm I'm going to go to uh

[01:36:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5772s) global configuration mode router OPF1

[01:36:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5775s) area 22 stub. No summary.

[01:36:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5782s) The neighbor relationship should Yep,

[01:36:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5784s) there we go. Should reform.

[01:36:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5787s) There we go. Loading to full. And now

[01:36:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5790s) watch this. I'm going to type in show ip

[01:36:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5792s) route.

[01:36:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5800s) All the OPF routes are gone and one

[01:36:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5804s) remains. It is a default route, an inter

[01:36:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5808s) area route, saying pretty much

[01:36:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5809s) everything that I don't know about, I'm

[01:36:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5812s) sending it over to agent Smith. That

[01:36:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5816s) is a totally stubby area, dude. [snorts]

[01:37:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5822s) Um, and that is the OS. Oh, you know

[01:37:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5824s) what?

[01:37:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5827s) We can totally do this. I've got I've

[01:37:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5829s) got

[01:37:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5829s) >> Wait, there's more.

[01:37:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5831s) >> We can do just phase phase six is it.

[01:37:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5833s) So, [applause] we can do this. We can do

[01:37:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5835s) this. We can do this. Okay. So, uh,

[01:37:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5837s) command one's choices, not chances. Here

[01:37:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5839s) we go. Zion has two ways out. Where is

[01:37:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5842s) Zion? Hang on. Zion's over here. So,

[01:37:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5844s) Morpheus has two ways out, right? One

[01:37:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5846s) through Neo, one through Trinity. Two

[01:37:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5848s) ways out. Uh, through each of you to Neo

[01:37:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5851s) and Trinity. We've looked at the

[01:37:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5852s) hardware on both the links. Trinities is

[01:37:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5855s) the better path. We want Trinity's link

[01:37:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5857s) used for everything leaving Zion toward

[01:37:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5859s) the backbone when it's healthy. Full

[01:37:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5861s) stop. Neo's link exists for the tra day

[01:37:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5864s) that Trinities doesn't. So Neo becomes

[01:37:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5866s) the backup. Um we don't want to find out

[01:37:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5869s) during an outage that the network never

[01:37:51](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5871s) actually treated it as a backup. Okay.

[01:37:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5873s) Okay. So blah blah blah blah. Okay. So

[01:37:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5874s) >> so if we just get rid of the

[01:37:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5876s) summarization that we did uh on Trinity

[01:37:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5879s) before the then Trinity is going to be

[01:38:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5883s) routing all that traffic is the law of

[01:38:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5884s) specificity.

[01:38:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5885s) >> That would work.

[01:38:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5888s) >> That's not maybe the best idea, but I

[01:38:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5890s) mean it'll still work. it would work. So

[01:38:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5892s) one way is to remove the summary on

[01:38:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5893s) Trinity. So then everybody's using

[01:38:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5895s) Trinity, nobody uses Neo. But the

[01:38:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5898s) concept is OPF cost. So take a look go

[01:38:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5904s) over to Neo

[01:38:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5906s) >> and uh we never really even talked about

[01:38:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5910s) bandwidth in any of this. It's all

[01:38:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5912s) Ethernet, right? So if I do a show

[01:38:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5914s) ipospf interface ethernet0

[01:38:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5918s) which is e uh neo's connection here to

[01:38:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5921s) the backbone right everybody seeing that

[01:38:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5923s) so I'm looking at that interface right

[01:38:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5925s) at the top of that output I will see the

[01:38:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5929s) cost is 10 right it's a very low cost so

[01:38:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5934s) what I can do is I can change the cost

[01:38:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5937s) of that link to something more than 10

[01:39:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5940s) because all of these are 10 and at that

[01:39:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5942s) point all of the routes coming to

[01:39:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5945s) Morpheus from Neo which let's look let's

[01:39:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5947s) look at Morpheus real quick I'll do a uh

[01:39:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5951s) show ip route on Morpheus and you can

[01:39:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5954s) see just about everything is load

[01:39:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5957s) balanced right you can see uh the path

[01:39:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5959s) to 17216 I got one there and one there

[01:39:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5963s) right there it's load balancing between

[01:39:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5964s) the two so if I go to TR go to Neo and I

[01:39:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5967s) go into interface Ethernet zero and

[01:39:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5971s) change the cost and I say ipospf cost

[01:39:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5975s) and let's just make it instead it was 10

[01:39:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5977s) before let's make it 500 [laughter] go

[01:39:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5981s) big uh hit enter now all of the routes

[01:39:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5985s) coming in through Neo so they're all

[01:39:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5988s) coming in from Agent Smith the Oracle

[01:39:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5989s) and going through Neo to Morpheus are no

[01:39:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5992s) longer as desirable as the routes coming

[01:39:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=5995s) from Trinity so at this point we're on

[01:40:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6000s) Morpheus and they were all load

[01:40:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6001s) balancing. Now, after I typed in that

[01:40:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6003s) command, I'll hit the up arrow and do a

[01:40:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6005s) show ip route.

[01:40:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6007s) Boom. Look at all that.

[01:40:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6008s) >> There it is.

[01:40:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6009s) >> The route to Neo is gone. Instead of

[01:40:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6013s) having two routes for every single one

[01:40:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6014s) that load balancing, it's just like

[01:40:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6016s) Trinity's my gal. Now, if I go in

[01:40:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6018s) >> Yeah.

[01:40:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6020s) >> to Trinity and uh uh take let's just I

[01:40:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6025s) was going to reboot her, but that's

[01:40:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6027s) pretty devastating. Let's Let's go into

[01:40:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6029s) uh Ethernet 01

[01:40:32](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6032s) and let's shut it down.

[01:40:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6033s) >> Shut the interface. Yeah.

[01:40:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6035s) >> So, it no longer has a connection to

[01:40:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6037s) Morpheus. Boom. That'll that'll lose the

[01:40:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6040s) neighbor. So, you guys all see this

[01:40:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6042s) output right now, right? So, neighbor

[01:40:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6044s) just went down. Hit the up arrow.

[01:40:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6047s) Ah, it hasn't lost it yet.

[01:40:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6055s) Yeah, he still sees Trinity. Well, for

[01:40:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6057s) sake of time, we'll go faster here.

[01:40:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6059s) We'll we'll just uh kill the uh kill the

[01:41:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6063s) route from Morpheus's side. Uh

[01:41:08](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6068s) I can't remember which which interface

[01:41:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6070s) is which. Ethernet 0.

[01:41:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6074s) Oh, there we go. I just had to wait a

[01:41:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6076s) little bit. Now, Trinity's down. Now, if

[01:41:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6078s) I do the show ip route,

[01:41:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6083s) all of these are going through Neo. it

[01:41:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6085s) what I know we're flying through all of

[01:41:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6087s) this but 192168 1 or 2.1 before now it's

[01:41:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6091s) 1.1 um which is going up here through

[01:41:35](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6095s) Neo that's the path that it's taking

[01:41:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6098s) there Claude I'm only one minute over

[01:41:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6102s) >> I was going to say for for being a

[01:41:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6104s) minute over Claude basically got spanked

[01:41:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6106s) here today

[01:41:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6108s) >> I am and I'm probably going to lose my

[01:41:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6110s) voice through all this great [snorts]

[01:41:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6113s) >> you got a guy like me slowing you down

[01:41:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6114s) one too where I'm like, hey, you know,

[01:41:55](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6115s) another way we could do this. It's

[01:41:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6117s) probably not the best, but I mean, it's

[01:41:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6119s) still like you have the same result.

[01:42:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6121s) >> So,

[01:42:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6122s) >> good. So, that that was everything OPF

[01:42:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6127s) in one session. And you have now seen

[01:42:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6129s) enough OPF to actually be prepared for

[01:42:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6132s) not only CCNA,

[01:42:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6134s) but most of CCNP as well. And CCNP,

[01:42:17](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6137s) you'll get into ASBRs and external

[01:42:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6139s) routes and all of that, but um that Wow,

[01:42:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6143s) thank you. just see the it caught the

[01:42:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6145s) corner of my aisle. The comments are

[01:42:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6146s) like, "Woohoo!" Everybody is uh going

[01:42:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6149s) [laughter]

[01:42:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6150s) >> no t-shirts for anyone.

[01:42:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6154s) >> Just like that, I've become Scrooge. No

[01:42:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6156s) t-shirts, right? Actually, there was

[01:42:38](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6158s) there was uh there was one guy who

[01:42:41](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6161s) genuinely caught the error. Um was that

[01:42:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6163s) Dave? I can't

[01:42:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6164s) >> It was Dave. Yep,

[01:42:45](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6165s) >> it was Dave. Yeah.

[01:42:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6166s) >> All right. Dave gets a teacher.

[01:42:49](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6169s) >> Absolutely cool.

[01:42:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6170s) >> Well, you crushed it, Jeremy. Good job.

[01:42:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6172s) Great job. Claude got nothing on you.

[01:42:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6174s) See, AI's got nothing.

[01:42:57](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6177s) >> It's And the fun part about doing this

[01:42:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6179s) is all of this was done in a very

[01:43:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6181s) non-step, very non-traditional way. I I

[01:43:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6184s) had Claw just make it as real world as

[01:43:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6185s) possible. Of course, it threw the Matrix

[01:43:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6187s) uh scenario into there. But that is

[01:43:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6190s) actually what it is like in the real

[01:43:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6193s) world. And now you've got it. You've got

[01:43:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6195s) this whole thing. We're g keeping it

[01:43:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6196s) forever on uh the recording. We'll give

[01:43:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6199s) you the the lab. will give you I got to

[01:43:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6202s) export the con. Actually, I'm going to

[01:43:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6203s) reboot all those routers because I I

[01:43:25](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6205s) think I only saved Morpheus. So, I'll

[01:43:27](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6207s) clear his config, but all the others

[01:43:29](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6209s) I'll reboot so you've got a clean slate

[01:43:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6211s) and you guys can go at that

[01:43:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6213s) configuration, too.

[01:43:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6214s) >> Update those loop back addresses too,

[01:43:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6216s) right?

[01:43:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6217s) >> Oh, yeah. Yeah. Thank you.

[01:43:39](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6219s) >> When Jeremy uh gets that file all set up

[01:43:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6222s) and ready to go, um yeah, just send it

[01:43:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6224s) over to me. I'll put it in the Discord

[01:43:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6226s) for everybody and then Micah I think

[01:43:47](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6227s) will sync to probably add it to the LMS

[01:43:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6230s) too so have both of those. So um just uh

[01:43:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6236s) be patient. We'll get you the file as

[01:43:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6238s) [laughter] soon as we can.

[01:43:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6239s) >> Yeah, that's good. Well, that that was

[01:44:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6241s) the number one requested topic of all

[01:44:04](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6244s) the CCNA that we've done so far. I

[01:44:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6246s) thought it would be subnetting. It was

[01:44:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6247s) OPF. So hopefully that guy that that

[01:44:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6250s) really helps you guys in the future. Um,

[01:44:13](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6253s) and I am so glad that all of you showed

[01:44:15](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6255s) up for this as well because this uh Oh,

[01:44:19](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6259s) [laughter] I clicked the wrong one. Uh,

[01:44:21](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6261s) but uh yes, Claude is a toy. That's

[01:44:23](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6263s) right. Uh, no, the one right above it uh

[01:44:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6266s) was uh xx Luna saying, "I'm glad I

[01:44:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6268s) showed up for this." I am glad you

[01:44:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6270s) showed up, too. Uh, because this went

[01:44:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6271s) really well and I think you've got

[01:44:33](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6273s) encapsulated a whole bunch of uh good

[01:44:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6276s) OPF. So, that said, um, I think we're

[01:44:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6280s) done. Uh, let's let's wrap it up, Zach.

[01:44:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6282s) >> Awesome. All right. Thank you everybody

[01:44:43](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6283s) for joining for another uh check-in for

[01:44:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6286s) the summer CCNA. If you haven't yet, you

[01:44:48](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6288s) can sign up for the summer CCNA here.

[01:44:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6290s) But if you follow us on socials, stay

[01:44:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6292s) tuned because we're going to be

[01:44:53](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6293s) announcing the fall into CCNA, which is

[01:44:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6296s) coming in September. So, if you guys are

[01:44:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6298s) interested in going along with us just

[01:45:00](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6300s) like we're doing today and learning from

[01:45:02](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6302s) the master here who just dominated over

[01:45:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6305s) Claude today. Fantastic.

[01:45:06](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6306s) >> Three sessions. You all can you all can

[01:45:09](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6309s) sign up for the summer CCNA or fall in

[01:45:11](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6311s) the CCNA and you will learn from from

[01:45:12](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6312s) one of the best. Absolutely. Make sure

[01:45:14](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6314s) you join us on Discord if you haven't

[01:45:16](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6316s) yet. We did a couple giveaways today.

[01:45:18](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6318s) Congratulations to everybody who won.

[01:45:20](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6320s) And of course, give our uh partner

[01:45:22](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6322s) Skilbit a shout out. Give them, you

[01:45:24](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6324s) know, the holler. Say, "Hey, we followed

[01:45:26](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6326s) you from Network Chuck Academy. They

[01:45:28](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6328s) help us host all of our practice and

[01:45:30](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6330s) virtual labs that we offer as part of

[01:45:31](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6331s) the summer CCNA." They've been fantastic

[01:45:34](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6334s) to work with. So, that's all we got for

[01:45:36](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6336s) today. We're going to be doing another

[01:45:37](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6337s) one of these sessions in two weeks. It's

[01:45:40](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6340s) the last uh session for everybody, I

[01:45:42](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6342s) believe. Right.

[01:45:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6344s) >> Yep.

[01:45:44](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6344s) >> Yeah, it will be. Uh the the summer of

[01:45:46](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6346s) CCNA comes to an end in August 28th. So,

[01:45:50](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6350s) uh you'll see us one more time and then

[01:45:52](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6352s) in September you'll you might be seeing

[01:45:54](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6354s) us again. So, thank you everybody for

[01:45:56](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6356s) joining us today. We hope you enjoyed

[01:45:58](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6358s) the session. If you have any comments,

[01:45:59](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6359s) questions, suggestions, please reach out

[01:46:01](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6361s) to us. We're happy to help you and we'll

[01:46:03](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6363s) see you again next time. Take care

[01:46:05](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6365s) everybody and bye bye.

[01:46:07](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6367s) >> Bye guys.

[01:46:10](https://www.youtube.com/watch?v=HUXUnMbeOyo&t=6370s) [music]
