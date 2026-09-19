---
type: source
source_type: youtube-transcript
title: "One year testing Meridian: Real agency results and takeaways"
source: "https://www.youtube.com/watch?v=fMaPvjp1eEs"
video_id: "fMaPvjp1eEs"
channel_id: "UCgl9rHdm9KojNRWs56QI_hg"
channel: "Google Ads"
published_at: "2026-09-02T15:24:48Z"
acquired_at: "2026-09-09T18:01:49.541646Z"
language: "en-j3PyPqV-e1s"
caption_type: "manual"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 2141
last_transcript_second: 2140.500
transcript_coverage: 0.999766
transcript_words: 6658
payload_sha256: "193b17b192b0baba5cf2ae0d5a1a93e6230573b1f5520a1ef2808454435a6319"
---
# One year testing Meridian: Real agency results and takeaways

## Creator description

Media mix modeling used to feel out of reach for many businesses, locked behind high software fees and specialized data science teams. With open source models like Meridian and AI coding assistants, the technical barrier has shifted, making advanced measurement accessible for everyday marketing teams.

In this special episode of Ads Decoded, host Ginny Marvin sits down with Patrick Gilbert, CEO of AdVenture Media, and Nechama Teigman, Director of Marketing Analytics. Together, they share an unvarnished look at their first full year implementing Meridian across their client base, covering everything from data preparation to major campaign breakthroughs.

Check out the video series Ginny mentions to help you get started with Meridian here: https://www.youtube.com/playlist?list=PLI5YfMzCfRtYvZ9AYp1wrtBM4apIsDc1i

Want Ginny’s key takeaways and tips from this conversation? Subscribe to the Ads Decoded newsletter: https://goo.gle/3NO45ZW.

Find Ginny at linkedin.com/in/ginnymarvin and @adsliaison on X.

#GoogleAds #PPCChat #AdsDecoded #MerchantCenter #ProductData #HolidayRetail

## Transcript

[00:00:00](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=0s) Want to know what it's really like

[00:00:01](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1s) to implement an open source media mix model like Meridian.

[00:00:04](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=4s) If you think it's out of reach or just too technical,

[00:00:07](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=7s) this conversation is for you.

[00:00:09](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=9s) You might know Patrick Gilbert as the author of join or die,

[00:00:12](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=12s) or his latest book on strategic marketing in an AI world,

[00:00:16](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=16s) never, always, never, never.

[00:00:18](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=18s) Or as the CEO of the agency adventure media.

[00:00:21](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=21s) The last few times I'd seen Patrick,

[00:00:23](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=23s) our conversations turned to the work

[00:00:26](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=26s) that his team had been doing to implement Meridian

[00:00:29](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=29s) as part of their measurement stack,

[00:00:32](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=32s) and those charts were so interesting

[00:00:33](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=33s) that they seemed the perfect companion to my broader

[00:00:36](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=36s) conversation on measurement with product Leader John Chen.

[00:00:40](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=40s) That is also out now.

[00:00:42](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=42s) So get ready for an unvarnished look at what it takes

[00:00:45](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=45s) for marketers, not data scientists or developers,

[00:00:49](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=49s) to get Meridian up and running.

[00:00:52](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=52s) You just might get inspired to give it a go yourself.

[00:00:55](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=55s) Enjoy Patrick, thank you so much for joining this conversation.

[00:01:01](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=61s) I'm very excited about this.

[00:01:02](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=62s) I Patrick, you've been filling me in on some of the work

[00:01:05](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=65s) that your team has been doing.

[00:01:08](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=68s) I'm very much looking forward to hearing more

[00:01:11](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=71s) about the kind of big picture, and also getting into the weeds

[00:01:16](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=76s) in terms of how your team's implemented Meridian.

[00:01:20](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=80s) How are you using it.

[00:01:21](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=81s) Challenges you faced.

[00:01:22](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=82s) Any insights that you can give fellow marketers.

[00:01:25](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=85s) Well, first of all, thanks for having us.

[00:01:28](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=88s) I'm really excited about this conversation,

[00:01:30](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=90s) partially because I'm really excited about this entire

[00:01:32](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=92s) project and thinking about where we were a year ago, two

[00:01:37](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=97s) years ago, with measurement and seeing where we are now

[00:01:40](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=100s) is so awesome.

[00:01:42](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=102s) And Meridian has been a big part of that.

[00:01:45](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=105s) To to the root of your question, it's

[00:01:46](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=106s) just been an inevitable journey to where we are now

[00:01:49](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=109s) many years ago, trying to think about multi-touch attribution

[00:01:53](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=113s) and knowing that it was not a perfect science,

[00:01:55](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=115s) and then becoming obsessed with the idea of third party

[00:02:00](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=120s) attribution tools.

[00:02:01](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=121s) Just kind of chasing this idea of better measurement

[00:02:03](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=123s) is something that we went through

[00:02:05](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=125s) and the entire industry went through let's say like 2021

[00:02:08](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=128s) was really when it became we need to do this.

[00:02:11](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=131s) And then over the course of several years

[00:02:13](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=133s) that ultimately led us down this path.

[00:02:15](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=135s) Now we at our agency, we had some background

[00:02:18](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=138s) with the last few years before Meridian was open source

[00:02:21](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=141s) and available to us.

[00:02:23](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=143s) We started learning about this and experimenting

[00:02:25](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=145s) with these kind of measurement methodologies

[00:02:27](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=147s) for the last couple of years.

[00:02:28](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=148s) But the problem was that we had to hire an external vendor

[00:02:30](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=150s) to help us with it.

[00:02:31](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=151s) So it was clunky, it was expensive.

[00:02:35](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=155s) It was only accessible to a handful of our clients

[00:02:39](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=159s) because you needed so much data, and it

[00:02:42](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=162s) was difficult for just a lot of reasons.

[00:02:45](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=165s) So we had gone through it.

[00:02:46](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=166s) We had seen that this could be really valuable as a concept,

[00:02:49](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=169s) and it just took us a really long time.

[00:02:51](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=171s) So when Meridian came available, it's like, OK,

[00:02:53](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=173s) this could be great, let's experiment with it.

[00:02:55](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=175s) And now we're about a year into it

[00:02:57](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=177s) and the results have been fantastic.

[00:02:59](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=179s) We've really enjoyed what our experience has been thus far.

[00:03:03](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=183s) So I think it's been inevitable.

[00:03:05](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=185s) What I'm hearing you say, Patrick,

[00:03:07](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=187s) is a lot of the challenges that marketers, agencies were

[00:03:11](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=191s) facing with memes and feeling like

[00:03:14](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=194s) the operational and financial lift that was needed

[00:03:20](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=200s) was a real barrier.

[00:03:23](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=203s) And when you were thinking about Meridian

[00:03:24](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=204s) and what were some of the factors

[00:03:27](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=207s) that you considered that said, let's

[00:03:30](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=210s) put the time into seeing if this is the right solution.

[00:03:33](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=213s) It's funny because I think that there wasn't so much time

[00:03:36](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=216s) that was spent on it.

[00:03:37](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=217s) It was more like, we've been wanting

[00:03:39](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=219s) to do this for a long time.

[00:03:41](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=221s) We looked into it a bunch of different times

[00:03:43](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=223s) and eventually worked with a vendor.

[00:03:45](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=225s) Patrick said before, for some clients,

[00:03:47](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=227s) there was always a certain amount of frustration

[00:03:50](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=230s) of if we had the technical abilities like we could do this,

[00:03:53](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=233s) it would be smoother than working with someone who

[00:03:55](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=235s) doesn't understand our clients.

[00:03:57](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=237s) As soon as Meridian was available, it just was like, OK,

[00:03:59](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=239s) I'm going to start testing with this.

[00:04:00](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=240s) There was no big decision because it was open source.

[00:04:05](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=245s) There was no big budgets that were going into it.

[00:04:07](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=247s) It was just like, hey, I'm going to take some of my time.

[00:04:09](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=249s) I'm going to start going through it, going through documentation.

[00:04:12](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=252s) And just learning, one of the big questions

[00:04:16](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=256s) is, what kind of technical expertise do I need to have,

[00:04:19](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=259s) or do people on my team need to have.

[00:04:21](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=261s) How can you give a little bit of background

[00:04:23](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=263s) on where you were coming from a capability standpoint,

[00:04:28](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=268s) in your own role and experience.

[00:04:32](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=272s) Yeah, so my role has been very much on the account management

[00:04:36](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=276s) side within our agency.

[00:04:39](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=279s) And then more so maybe on the marketing analytics side,

[00:04:44](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=284s) but very much not a software or any coding background.

[00:04:49](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=289s) So that was definitely a limitation in the past.

[00:04:53](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=293s) But I think with AI that was something

[00:04:55](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=295s) that we were able to bypass in a way,

[00:04:58](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=298s) because obviously there's tools available for that

[00:05:01](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=301s) now that we're able to use.

[00:05:03](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=303s) So I think, like I've been thinking about this a lot

[00:05:05](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=305s) over the last couple of days, and it's

[00:05:07](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=307s) like at one point I think the barrier was technical know how

[00:05:12](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=312s) and budget.

[00:05:14](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=314s) And the reason that the budget was such a big deal

[00:05:16](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=316s) was because you needed to get people

[00:05:18](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=318s) who were like data scientists, and then by default,

[00:05:20](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=320s) you're only working with crazy high budgets,

[00:05:22](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=322s) because that's primarily the only people who could afford it

[00:05:25](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=325s) and also what it was best at.

[00:05:27](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=327s) And then you also have a fair amount

[00:05:28](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=328s) of data cleaning and storage and all that stuff

[00:05:30](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=330s) that comes with it.

[00:05:31](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=331s) But now I think that the barrier shifted

[00:05:34](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=334s) because it's so easy to do it.

[00:05:38](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=338s) Anyone can spin up Cloud Code and be like,

[00:05:40](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=340s) hey, go plug into Meridian, here's some data.

[00:05:43](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=343s) Can you work on this.

[00:05:44](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=344s) Yeah And so the AI coding tools just

[00:05:46](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=346s) opened up a whole new approachability

[00:05:49](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=349s) for you and your team for sure.

[00:05:52](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=352s) What are you trying to do with EMS and meridian?

[00:05:56](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=356s) Did it come from an internal curiosity.

[00:05:59](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=359s) Or were clients asking for this or both.

[00:06:02](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=362s) I wish clients were asking about it.

[00:06:04](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=364s) We've been having more and more conversations where

[00:06:07](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=367s) prospective clients are coming to us,

[00:06:09](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=369s) with the expectation that we are at least savvy

[00:06:14](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=374s) with this concept.

[00:06:15](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=375s) So right now in 2026, we're still

[00:06:18](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=378s) I think, at the early stages of the adoption of this whole world

[00:06:23](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=383s) of better measurement.

[00:06:25](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=385s) And I think most people have at least heard of incrementality.

[00:06:28](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=388s) Very few marketers know what is and can

[00:06:34](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=394s) answer the question about what it is for if they even do.

[00:06:37](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=397s) So really being able to tell that story,

[00:06:38](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=398s) I think has been difficult because I think just hey,

[00:06:41](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=401s) there's this amazing thing that we want to set up

[00:06:43](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=403s) and they're like, yeah, yeah, yeah, can you fix my roas?

[00:06:45](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=405s) And that's just what you hear from clients all the time.

[00:06:48](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=408s) So I think it's going to take a lot more education.

[00:06:51](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=411s) But it's definitely like once you start talking about it,

[00:06:53](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=413s) once you sit down with someone and you explain what is

[00:06:56](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=416s) and why it's so important to set up

[00:06:59](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=419s) as early in the relationship as possible.

[00:07:01](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=421s) Everyone immediately is like, oh, that's a no brainer.

[00:07:04](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=424s) This sounds amazing.

[00:07:05](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=425s) I can't wait to see it.

[00:07:06](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=426s) And can you.

[00:07:07](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=427s) I would love to hear your elevator pitch

[00:07:10](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=430s) for how do you explain the value and where

[00:07:15](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=435s) it fits in with the overall kind of measurement

[00:07:19](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=439s) landscape for a client.

[00:07:21](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=441s) I mean, normally what I'm talking about to someone who

[00:07:23](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=443s) doesn't understand it at all.

[00:07:25](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=445s) There's still people who are working at a business

[00:07:29](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=449s) or who own a business like they have,

[00:07:31](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=451s) and they've been running some sort of media.

[00:07:33](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=453s) So they usually come in from that perspective

[00:07:35](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=455s) and just talk about times where it's correlation.

[00:07:40](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=460s) So meaning what we're trying to do in

[00:07:43](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=463s) is figure out when we change something within our media

[00:07:47](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=467s) what happens to the business.

[00:07:49](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=469s) So it's a much more of a strategic decision

[00:07:51](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=471s) like budget types of decisions are

[00:07:53](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=473s) being made on that budget allocation and things,

[00:07:56](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=476s) figuring out, where your saturation curves are,

[00:07:58](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=478s) where you're hitting diminishing returns, things like that.

[00:08:00](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=480s) And when you're trying to plan out things for the future.

[00:08:02](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=482s) The thing that I would add to that

[00:08:04](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=484s) is I like to talk about this really

[00:08:06](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=486s) from the scientific method and saying,

[00:08:09](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=489s) the itself is the groundwork for a testing environment.

[00:08:15](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=495s) So that's point number one.

[00:08:17](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=497s) But then it's really like once you have this in place,

[00:08:20](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=500s) then you start asking questions about how your marketing could

[00:08:23](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=503s) be better or what sort of questions

[00:08:25](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=505s) do you have about your marketing that you're already running.

[00:08:27](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=507s) And it might be a question about the effectiveness

[00:08:30](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=510s) of your branded search.

[00:08:32](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=512s) Or what about we want to make an investment in YouTube,

[00:08:36](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=516s) or connected TV, or Meta or Pinterest

[00:08:39](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=519s) or whatever it might be.

[00:08:40](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=520s) And aside from just trying to lean on something

[00:08:43](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=523s) like multi-touch attribution, which people don't click

[00:08:47](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=527s) on TV ads, so it's really hard to measure

[00:08:49](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=529s) the effectiveness of that.

[00:08:51](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=531s) You lean on the groundwork that has been laid with

[00:08:55](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=535s) to be able to confidently make an investment

[00:08:58](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=538s) in a different kind of marketing channel,

[00:08:59](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=539s) and then be able to really measure the Roi back

[00:09:02](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=542s) to real business results and not whatever one of the platforms

[00:09:05](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=545s) is reporting as their return on ad spend.

[00:09:07](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=547s) Love the examples of the kinds of questions

[00:09:09](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=549s) that you are putting to try to solve.

[00:09:13](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=553s) Are there questions that you're asking the clients in advance

[00:09:17](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=557s) to understand if this is going to be a good fit.

[00:09:20](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=560s) Are you surprised by who's been a good fit or not.

[00:09:24](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=564s) Is that kind of threshold.

[00:09:26](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=566s) Has that been shifting.

[00:09:27](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=567s) Yeah, I think it depends.

[00:09:29](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=569s) I've heard a lot of different numbers like, oh,

[00:09:31](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=571s) if you're spending 30k on a platform per month,

[00:09:33](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=573s) if you're spending 50 or whatever,

[00:09:36](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=576s) and that's definitely been shifting,

[00:09:38](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=578s) it's getting smaller with as the models get better.

[00:09:40](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=580s) The biggest thing is when we're talking

[00:09:42](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=582s) about before is variance.

[00:09:43](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=583s) If you have large variance on a small data set,

[00:09:45](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=585s) then that's going to get you further

[00:09:48](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=588s) than no variance in a larger data set.

[00:09:49](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=589s) What I mean by that is you're spending $1 million,

[00:09:52](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=592s) but you've just been doing the same thing forever in.

[00:09:55](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=595s) Put every one of those million dollars into your band search

[00:09:58](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=598s) and you don't know what else is actually happening.

[00:10:00](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=600s) It's not going to be enough data.

[00:10:01](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=601s) If client spending in that 2030k range on a platform I look

[00:10:06](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=606s) into it a little bit more and just run a basic one for them.

[00:10:09](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=609s) Not really talk about the results

[00:10:11](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=611s) because I don't necessarily trust the results at that point.

[00:10:13](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=613s) But just be like, OK, is this viable.

[00:10:15](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=615s) When I first started learning about.

[00:10:17](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=617s) It's very confusing and it's very overwhelming

[00:10:19](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=619s) because people are talking about econometric modeling and all

[00:10:22](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=622s) these other things and programming languages

[00:10:24](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=624s) and statistics, like deep stuff that I never fully understood.

[00:10:27](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=627s) As a marketer, what you're trying to really see

[00:10:29](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=629s) is as I increase one variable, which might be impressions

[00:10:34](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=634s) from YouTube, right.

[00:10:35](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=635s) As one variable goes up, what is the net impact

[00:10:38](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=638s) on the real business outcome, whether it's revenue or vice

[00:10:41](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=641s) versa.

[00:10:42](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=642s) If it goes down right.

[00:10:44](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=644s) That too.

[00:10:46](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=646s) And so the beauty of what you could

[00:10:49](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=649s) do with an if you have enough data

[00:10:51](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=651s) and if you have enough variance is

[00:10:54](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=654s) you can start to look through the historic patterns.

[00:10:56](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=656s) And even if you didn't really intentionally run a test,

[00:11:00](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=660s) there might be nuances of you look at the geographic split

[00:11:05](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=665s) and it's like, OK, well, there was a portion of time where just

[00:11:08](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=668s) for whatever reason, the PMax campaign didn't spend

[00:11:10](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=670s) a lot of money in these states, and it spent more

[00:11:13](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=673s) in these states.

[00:11:14](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=674s) And so you could go back through some historic,

[00:11:18](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=678s) some of the historic data.

[00:11:20](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=680s) And some of those testing variables

[00:11:23](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=683s) will already be in there, where you can compare and contrast

[00:11:25](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=685s) like a net lift in YouTube impressions that

[00:11:29](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=689s) wasn't fully intentional.

[00:11:30](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=690s) Now, ideally, this kind of goes back

[00:11:31](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=691s) to what I said before about creating the groundwork

[00:11:34](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=694s) of a testing environment.

[00:11:35](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=695s) Let's design a test and then let's

[00:11:37](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=697s) circle back in three months and say,

[00:11:39](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=699s) did an increase in impressions or spend

[00:11:41](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=701s) or whatever on this new thing lead to an increase.

[00:11:44](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=704s) If so, by how much and how can we separate that out.

[00:11:46](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=706s) And you're looking for enough variance within that stage.

[00:11:49](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=709s) It's going through and finding natural experiments,

[00:11:51](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=711s) but also adding another really important part,

[00:11:54](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=714s) which is the controls, which is just saying this happened,

[00:11:56](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=716s) but what else happened at the same time.

[00:11:58](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=718s) How do we isolate that.

[00:11:59](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=719s) Because we all know an without understanding seasonality

[00:12:03](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=723s) is going to be like, oh, wow.

[00:12:05](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=725s) Google an amazing meta amazing.

[00:12:08](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=728s) Everything amazing.

[00:12:09](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=729s) And it's like Black Friday and it's like yeah,

[00:12:11](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=731s) there's a reason for this.

[00:12:12](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=732s) And that's the amazing part about that's

[00:12:14](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=734s) why that's where it goes.

[00:12:15](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=735s) In my mind at least because we used

[00:12:17](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=737s) to do a lot of linear regressions for clients,

[00:12:19](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=739s) like before we were doing RMS, which

[00:12:21](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=741s) is that just saying when this goes up, what happens to that.

[00:12:24](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=744s) It's a straight line.

[00:12:26](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=746s) That's why it's a linear regression.

[00:12:28](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=748s) But it's just saying when x goes up or goes down,

[00:12:30](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=750s) what happens to y.

[00:12:31](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=751s) And x is typically going to be your spend or your clicks

[00:12:34](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=754s) or whatever, y is usually your revenue.

[00:12:36](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=756s) Or if your lead Gen like your leads or whatever it is.

[00:12:38](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=758s) But the problem we always have with that

[00:12:40](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=760s) was the same thing, which is yeah,

[00:12:41](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=761s) but what about all the other stuff that's happening that's

[00:12:43](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=763s) too complicated.

[00:12:44](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=764s) I don't know how to model for that.

[00:12:45](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=765s) And that's where in and it's able to take the full package

[00:12:49](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=769s) and then give you confidence levels of yeah,

[00:12:51](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=771s) I actually don't know either for this part.

[00:12:53](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=773s) But this other thing I'm super confident in.

[00:12:56](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=776s) Yeah, great.

[00:12:57](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=777s) And also, I know we've talked a lot

[00:13:00](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=780s) about being able to measure different channels

[00:13:02](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=782s) against each other.

[00:13:03](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=783s) I think you're also looking at it

[00:13:05](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=785s) within different to look at different campaign

[00:13:07](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=787s) types against each other.

[00:13:09](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=789s) So nahemah mentioned this earlier in a very small way,

[00:13:14](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=794s) but we had worked with previous vendors

[00:13:18](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=798s) when we would be designing a test

[00:13:20](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=800s) or designing the way to set up an account.

[00:13:22](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=802s) We didn't even know that these kinds of things

[00:13:24](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=804s) were possible, because you don't even know what questions you

[00:13:26](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=806s) should be asking.

[00:13:27](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=807s) And only after like we got into Meridian

[00:13:31](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=811s) did nahemah just say, hey, what's cool.

[00:13:34](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=814s) I can categorize campaigns by PMax versus shopping,

[00:13:39](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=819s) or brand versus non-brand, or prospecting versus remarketing.

[00:13:43](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=823s) The beauty of it is the way in which

[00:13:45](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=825s) we would report to the client can

[00:13:47](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=827s) now just we could just build it that way in Meridian.

[00:13:50](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=830s) And so from a reporting standpoint and.

[00:13:52](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=832s) And from a measurement standpoint,

[00:13:53](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=833s) there's a reason you report that way.

[00:13:55](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=835s) There's a reason if you care about your brand

[00:13:57](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=837s) versus non-brand like there's something behind it.

[00:13:59](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=839s) And so great.

[00:14:00](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=840s) Well, you could just set it up that way and measure it.

[00:14:02](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=842s) And I think that was the big unlock where it's like,

[00:14:05](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=845s) man, we didn't even know that this was possible.

[00:14:07](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=847s) And obviously it is.

[00:14:08](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=848s) We just never knew the answer to that question

[00:14:10](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=850s) or ask that question before.

[00:14:11](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=851s) I do want to now get into the real nitty gritty

[00:14:15](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=855s) about implementing this.

[00:14:17](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=857s) What factors are involved.

[00:14:20](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=860s) What needs are required for standing up

[00:14:24](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=864s) Meridian in your organization.

[00:14:27](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=867s) What should people be really keeping

[00:14:29](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=869s) in mind in terms of what is needed.

[00:14:32](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=872s) Is there if they're starting to have these conversations.

[00:14:35](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=875s) So it is running within the Meridian package.

[00:14:39](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=879s) So that's something that you could download.

[00:14:40](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=880s) You can get from Google.

[00:14:42](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=882s) If you use whatever you're using can ask

[00:14:45](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=885s) it to access those packages.

[00:14:48](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=888s) And that's the first thing just having access to the models

[00:14:51](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=891s) and then the next thing is, in order

[00:14:55](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=895s) to get started need your data.

[00:14:57](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=897s) And data is going to mean all your media.

[00:15:02](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=902s) And typically the way I like to do it

[00:15:04](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=904s) and Meridian makes this really easy

[00:15:06](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=906s) is get your data by day by day by.

[00:15:11](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=911s) Could mean different things for different people.

[00:15:14](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=914s) For a lot of our clients it ends up being by USD.

[00:15:16](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=916s) Sometimes it's by country.

[00:15:17](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=917s) It could be a DMA.

[00:15:19](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=919s) However you're used to getting it usually

[00:15:21](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=921s) end up with states for our US based clients

[00:15:24](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=924s) because the platforms like Google report

[00:15:27](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=927s) on that very cleanly.

[00:15:28](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=928s) That's for all the marketing channels that you have,

[00:15:30](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=930s) as well as your revenue or your leads, whatever

[00:15:33](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=933s) it is that you're trying to track for think about that as

[00:15:35](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=935s) just like rows in a CSV.

[00:15:37](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=937s) But again, we have it is we have a data pipeline that we have

[00:15:40](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=940s) put up, which basically just means that that's all getting

[00:15:42](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=942s) ingested to a data warehouse.

[00:15:45](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=945s) We use BigQuery on a daily basis.

[00:15:49](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=949s) So that means whenever we want to redo this.

[00:15:51](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=951s) We're not trying to get that data again.

[00:15:53](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=953s) It's like a one time setup where we're

[00:15:55](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=955s) connecting via API to different channels

[00:15:57](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=957s) and to our clients' data as well from a technical standpoint.

[00:16:01](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=961s) That's really all you need.

[00:16:02](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=962s) But then in addition to that need those controls.

[00:16:04](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=964s) So that's what we were talking about before.

[00:16:06](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=966s) Seasonality is a thing now.

[00:16:08](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=968s) Seasonality is pretty simple.

[00:16:09](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=969s) A lot of times I'll just do it anyways

[00:16:10](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=970s) because you'll bring in multiple years of data at a time.

[00:16:14](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=974s) So how far back are you going.

[00:16:15](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=975s) Three or four years.

[00:16:16](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=976s) I like to go three or four.

[00:16:17](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=977s) There are some issues with it though.

[00:16:19](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=979s) Sometimes we'll have a client that changed drastically

[00:16:22](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=982s) within the last six months or year,

[00:16:24](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=984s) and then your results are like, your results

[00:16:26](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=986s) are going to be the results for whatever data you put in.

[00:16:28](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=988s) Now, it's going to typically be more confident in something

[00:16:31](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=991s) that's longer, which is why I like

[00:16:32](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=992s) to go back three or four years.

[00:16:34](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=994s) But when we have a client that changed

[00:16:36](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=996s) so much within the last year, those last three or four years

[00:16:39](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=999s) aren't necessarily representative of it.

[00:16:41](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1001s) So the results might not mean what I want them to mean.

[00:16:44](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1004s) In which case have had times I've gone back like 18 months

[00:16:47](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1007s) I haven't with our volume, our clients volume, I volume.

[00:16:50](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1010s) I haven't been able to go back less than that.

[00:16:52](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1012s) And also, if you don't have at least two years of data,

[00:16:55](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1015s) you don't have seasonality built in at any degree.

[00:16:59](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1019s) When we're talking about controls,

[00:17:00](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1020s) this is where you really want to ask around the organization

[00:17:04](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1024s) and creatively think about the things that

[00:17:06](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1026s) might impact your performance.

[00:17:07](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1027s) For example we keep giving is Black Friday because it's

[00:17:09](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1029s) the easiest.

[00:17:10](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1030s) But the real things that drive value of an

[00:17:14](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1034s) are things that the marketing team or the people running this

[00:17:18](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1038s) might not totally be aware of.

[00:17:19](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1039s) It might be an external variable.

[00:17:21](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1041s) We had a client that's in the jewelry space,

[00:17:23](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1043s) and after running an for them, found out that the number one

[00:17:27](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1047s) thing that impacted their actual performance

[00:17:29](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1049s) was the price of gold.

[00:17:31](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1051s) So you pull in that API and we just no one really

[00:17:34](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1054s) thought to add that beforehand.

[00:17:36](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1056s) So there's certain things, it could

[00:17:37](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1057s) be impacted by whether we had a client that

[00:17:39](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1059s) was a national roofing chain, and you talk to the owner,

[00:17:43](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1063s) you talk to the salespeople.

[00:17:45](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1065s) And they know even though temperature is not even

[00:17:48](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1068s) the indicator, it's like, well, this city behaves this way

[00:17:50](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1070s) and that city behaves that way.

[00:17:52](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1072s) And so you just sort talk to the people in the organization

[00:17:54](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1074s) to figure out what really drives performance.

[00:17:56](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1076s) This is where getting some time with the CEO,

[00:17:59](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1079s) getting some time with the salespeople,

[00:18:01](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1081s) just kind of talking around outside,

[00:18:02](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1082s) just the marketing department is where you'll

[00:18:04](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1084s) get those ideas of oh, these are the kinds of data points

[00:18:08](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1088s) that we should consider feeding into the system

[00:18:10](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1090s) to see if that actually might drive anything.

[00:18:12](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1092s) Because ultimately, the more you get in there,

[00:18:14](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1094s) the more you can control for which

[00:18:16](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1096s) means the more you can actually measure

[00:18:18](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1098s) the true impact of the different media that you're running.

[00:18:22](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1102s) That totally makes sense.

[00:18:23](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1103s) I assume.

[00:18:24](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1104s) Also, you like finance CFO, have them involved,

[00:18:27](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1107s) I would assume also get them on board.

[00:18:30](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1110s) So they're bought in on this because the insights are often

[00:18:34](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1114s) going to dictate what your budget recommendations are

[00:18:38](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1118s) going to be across different platforms, channels.

[00:18:42](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1122s) And having that initial like having the CFO or the finance

[00:18:48](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1128s) team already bought in on that.

[00:18:50](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1130s) What your methodology is, how you're using that, I assume,

[00:18:53](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1133s) shortens those discussions and decisions.

[00:18:57](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1137s) The CFO doesn't care about return on ad spend.

[00:19:00](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1140s) They care about top line revenue and bottom line profit.

[00:19:03](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1143s) And so this is a tool that allows

[00:19:05](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1145s) you to speak a language that the rest of the organization

[00:19:08](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1148s) likes to speak.

[00:19:09](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1149s) Yes was there anything in terms that of setting this up

[00:19:14](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1154s) that surprised you in terms of it was more challenging

[00:19:18](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1158s) or it was easier or you were able to get something

[00:19:23](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1163s) get this set up.

[00:19:24](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1164s) Where I was surprised initially was how many revisions

[00:19:29](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1169s) it took to get to something like a model

[00:19:30](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1170s) that we were confident in.

[00:19:32](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1172s) So an example is the way that we run the GMs is I told you,

[00:19:36](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1176s) we collect the data daily, but then we aggregate it

[00:19:39](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1179s) so weekly data into the.

[00:19:42](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1182s) Now we were like, OK, since we have all the data coming in,

[00:19:45](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1185s) it's like, OK, let's use data for the last four years

[00:19:48](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1188s) and get it weekly.

[00:19:50](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1190s) And then there's something getting highly technical here.

[00:19:53](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1193s) But there's something called the holdout meep, which is basically

[00:19:56](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1196s) a score which takes out typically it's the last eight

[00:19:59](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1199s) weeks, but whatever.

[00:20:00](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1200s) It takes out some sort of data from the data that you gave it,

[00:20:04](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1204s) and it says, now we're going to use the model

[00:20:06](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1206s) to predict that data instead of actually

[00:20:09](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1209s) having the data on its own.

[00:20:10](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1210s) So let's say last week, we made $100,000 and model is going

[00:20:14](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1214s) to try to predict based on well, the media that happened

[00:20:17](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1217s) and the model itself, how much happened within the last week.

[00:20:23](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1223s) So typically want to be within 15% of the actual.

[00:20:26](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1226s) So if it came out, oh, the model thinks you made $500,000,

[00:20:29](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1229s) you have a problem with your model.

[00:20:30](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1230s) And that's going to be that's not great.

[00:20:33](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1233s) If it got 90,000 pretty good.

[00:20:37](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1237s) But our meep just kept coming out so bad.

[00:20:40](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1240s) And it's like everything else in this model is good.

[00:20:42](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1242s) But the holdout meep is bad.

[00:20:43](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1243s) And then you look at it and you're like, oh my gosh,

[00:20:46](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1246s) the last week isn't a full week of data.

[00:20:48](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1248s) So the model thinks it's predictable week of data.

[00:20:51](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1251s) And we have it's like Tuesday when I ran this.

[00:20:53](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1253s) So it's like nothing.

[00:20:55](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1255s) And it's just ridiculous.

[00:20:57](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1257s) But these are things that happen all the time.

[00:20:59](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1259s) And you're like, OK, we need to actually understand

[00:21:02](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1262s) what's happening so that we could find issues like this.

[00:21:04](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1264s) Any other tools that or resources

[00:21:08](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1268s) that come to mind in terms of that have helped you.

[00:21:11](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1271s) For me, it's really just been the AI.

[00:21:13](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1273s) And I did read all the Meridian documentation,

[00:21:17](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1277s) read it against AI because there were

[00:21:18](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1278s) things I didn't know what it was saying,

[00:21:20](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1280s) put it in and be like, no, no, give me a better analogy.

[00:21:22](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1282s) We're going to get somewhere here.

[00:21:25](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1285s) One of the biggest insights that I've been seeing

[00:21:28](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1288s) is like, it's really easy to run one.

[00:21:29](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1289s) It's harder to get one.

[00:21:31](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1291s) That's right.

[00:21:32](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1292s) And to validate it and know that it's right.

[00:21:35](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1295s) And that just comes down to learning

[00:21:36](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1296s) the concepts which aren't necessarily like technical stuff

[00:21:40](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1300s) behind them.

[00:21:40](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1300s) But the concepts are much less technical.

[00:21:44](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1304s) You could lean on AI to do the really technical parts.

[00:21:47](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1307s) Part I still don't know how to do and I've run a bunch of VMs.

[00:21:50](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1310s) I like your asking for analogies that will be relevant to you.

[00:21:57](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1317s) So that's helpful.

[00:21:57](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1317s) Everyone says explain it to me like I'm a ninth grader.

[00:22:00](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1320s) I don't maybe explain it to me like I'm

[00:22:02](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1322s) a marketing professional that's worked in performance

[00:22:04](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1324s) media for the last 15 years and I. So when you get to that

[00:22:08](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1328s) and it's like, hey, by the way, this thing

[00:22:09](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1329s) called adstock, that's just time lag.

[00:22:12](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1332s) It basically means the exact same thing,

[00:22:15](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1335s) just when you see the word adstock, that's what it means.

[00:22:18](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1338s) It's like, cool, because I know what time lag is.

[00:22:20](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1340s) And now I've learned the definition

[00:22:21](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1341s) of some of the stuff that comes up here.

[00:22:23](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1343s) How is it shaped or shifted, the kinds of conversations

[00:22:27](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1347s) that you're having with those clients.

[00:22:30](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1350s) We made some key mistakes early in our journey

[00:22:33](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1353s) with this, about the language that we use,

[00:22:37](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1357s) and the kinds of expectations that we set around

[00:22:41](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1361s) and measurement in total, when we started working with Meridian

[00:22:44](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1364s) or doing any harm, really, it was like,

[00:22:46](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1366s) OK, we're going to do this thing and it's

[00:22:47](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1367s) going to take a lot of time, but it's going

[00:22:49](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1369s) to really tell us the true Roi.

[00:22:52](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1372s) It's like, well, it's not really going to answer that.

[00:22:55](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1375s) Because really it's helpful.

[00:22:57](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1377s) It's directional.

[00:22:58](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1378s) It's this thing that allows you to set the groundwork

[00:23:00](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1380s) for future testing.

[00:23:02](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1382s) It gives you more confidence.

[00:23:03](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1383s) The other problem is we were brand new to this stuff,

[00:23:05](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1385s) so it took us a lot longer.

[00:23:07](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1387s) I was talking about I didn't realize

[00:23:09](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1389s) to exclude the last week, when you make this big expectation

[00:23:12](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1392s) for a client of all this stuff and then one

[00:23:14](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1394s) it takes, a month longer than they expected.

[00:23:17](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1397s) And two, the results aren't like exactly what they expected.

[00:23:21](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1401s) You've just frustrated a lot of people.

[00:23:24](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1404s) So now I think getting smarter about how we talk about it

[00:23:27](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1407s) as yeah, that's why we want to set it up early in a client

[00:23:29](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1409s) relationship to lay the groundwork

[00:23:32](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1412s) and to really have an honest, transparent conversation.

[00:23:34](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1414s) You need to be able to set a real expectation around what

[00:23:38](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1418s) you're really trying to achieve here.

[00:23:39](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1419s) And it's forward looking.

[00:23:41](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1421s) It's getting the right information

[00:23:42](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1422s) and being directional about how you're

[00:23:44](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1424s) setting up tests in the future.

[00:23:46](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1426s) And it's not a standalone.

[00:23:47](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1427s) It's right.

[00:23:48](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1428s) It's not going to be the one magic silver

[00:23:50](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1430s) bullet that is the be all and end all of your measurement tool

[00:23:55](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1435s) set.

[00:23:56](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1436s) You also need attribution like and that includes

[00:24:01](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1441s) multi-touch and in platform.

[00:24:02](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1442s) All that stuff is helpful.

[00:24:03](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1443s) And you also need incrementality.

[00:24:04](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1444s) You need all three of those things

[00:24:06](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1446s) if you want to do this right.

[00:24:07](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1447s) The will be incredibly helpful and is

[00:24:09](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1449s) the thing that ties together all these other kind of tests

[00:24:12](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1452s) that you run.

[00:24:13](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1453s) But by itself is you're not going to wake up tomorrow and be

[00:24:17](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1457s) like, oh, cool, let's take all of our budget

[00:24:19](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1459s) and put it into this campaign.

[00:24:20](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1460s) It's just not going to tell you that.

[00:24:21](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1461s) If you were talking to a marketing team, lead agency

[00:24:27](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1467s) lead, and who was saying, we're thinking

[00:24:29](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1469s) about getting started with Meridian, how long would

[00:24:33](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1473s) you say that they should be thinking about this project.

[00:24:37](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1477s) How long from we're going to do it.

[00:24:40](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1480s) We've got this stood up for our clients.

[00:24:44](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1484s) Find one client that you think you can do it

[00:24:46](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1486s) for where you have some variance in data I would say try and get

[00:24:51](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1491s) four channels and channels, by the way,

[00:24:53](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1493s) could be PMax and search or PMax and shopping or something

[00:24:57](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1497s) that you can get variance from.

[00:24:59](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1499s) And if you really like sat down and just dove into it,

[00:25:06](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1506s) you could probably get something within the first month.

[00:25:08](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1508s) But I guess what I'm saying is if the team itself

[00:25:12](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1512s) is brand new to Meridian they have not used Meridian at all.

[00:25:18](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1518s) So if you said looking back, if I go from the I

[00:25:25](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1525s) think we're going to start doing something

[00:25:27](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1527s) with Meridian to feeling comfortable talking

[00:25:31](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1531s) to clients about this.

[00:25:33](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1533s) So when you say, I think it depends who the person is.

[00:25:37](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1537s) You need a couple of weeks of learning.

[00:25:39](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1539s) Obviously, depending on how much time of your day

[00:25:42](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1542s) you're going to put into that, and then you could really get it

[00:25:45](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1545s) within a month or two, I think you could have something

[00:25:49](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1549s) if you're really going to be focused on that

[00:25:51](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1551s) and not use it as a little side project.

[00:25:53](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1553s) There's layers of value that you get out

[00:25:55](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1555s) of this to get to a point where you're understanding saturation

[00:25:59](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1559s) curves and diminishing returns and being able to turn this

[00:26:02](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1562s) into real forecasting.

[00:26:03](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1563s) It's going to take you a little while to get there,

[00:26:05](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1565s) and you need to educate yourself on how that stuff works.

[00:26:08](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1568s) I think the first time we really successfully ran this,

[00:26:10](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1570s) it was for an e-commerce client, and of the five channels

[00:26:14](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1574s) that we had in there, one of them was PMax

[00:26:17](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1577s) and one of them was shopping and the in-platform reported

[00:26:21](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1581s) return on ad spend was basically equal.

[00:26:23](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1583s) And depending on when you look at shopping,

[00:26:25](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1585s) actually had the edge for return on ad spend and spend

[00:26:28](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1588s) was similar.

[00:26:29](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1589s) I at the time we were spending a little more on PMax.

[00:26:31](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1591s) So you normally if you didn't have any other measurement

[00:26:33](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1593s) in place, you would say, OK, well,

[00:26:36](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1596s) we should probably spend more on shopping or keep this 50/50,

[00:26:39](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1599s) whatever it is.

[00:26:39](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1599s) But in running when it came out and it showed like, no, actually

[00:26:43](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1603s) $1 invested in the PMax has a much better overall impact

[00:26:47](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1607s) on the revenue to the business than it does on shopping.

[00:26:51](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1611s) And so then it's interesting.

[00:26:54](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1614s) Why What.

[00:26:56](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1616s) And there's really two questions like why

[00:26:59](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1619s) is it reporting that way.

[00:27:00](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1620s) Why is that not being accounted for in return on ad spend.

[00:27:02](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1622s) And that's a series of questions you

[00:27:04](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1624s) should go down and understand.

[00:27:05](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1625s) We're getting a little bit of brand halo effect

[00:27:07](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1627s) because we're doing some display and some video here.

[00:27:09](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1629s) And it's only 10% of the budget, but it's a lot of impressions

[00:27:12](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1632s) and we get a little bit of a lift.

[00:27:14](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1634s) It's driving some stuff that's not

[00:27:15](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1635s) like being caught in the natural Google Ads Conversion Tracking.

[00:27:19](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1639s) What do we do with this information.

[00:27:21](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1641s) And so in this case, it was very simple.

[00:27:23](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1643s) Let's test putting more of the budget into PMax.

[00:27:27](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1647s) Even if the reported return on ad spend

[00:27:28](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1648s) starts to look a little bit worse.

[00:27:30](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1650s) And guess what.

[00:27:31](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1651s) The next three months, the overall business

[00:27:33](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1653s) did a lot better.

[00:27:34](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1654s) And again, we had that hypothesis going into it.

[00:27:36](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1656s) We no, because we're still marketers,

[00:27:39](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1659s) we still understand how the world works,

[00:27:42](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1662s) that if you have two very similar campaigns,

[00:27:43](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1663s) but one of them has the potential

[00:27:45](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1665s) to add a little bit of a brand halo effect

[00:27:47](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1667s) that might not be measured in your traditional click based

[00:27:50](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1670s) attribution.

[00:27:51](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1671s) Now you're actually on to something

[00:27:52](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1672s) when the results actually show this.

[00:27:54](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1674s) Otherwise, that was an immediate out of the box thing.

[00:27:56](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1676s) And then now you keep iterating.

[00:27:58](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1678s) And month after month after month,

[00:27:59](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1679s) you're learning more about what can be done

[00:28:01](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1681s) with this kind of analysis.

[00:28:03](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1683s) You unlock a lot more that can be done, but out of the box,

[00:28:06](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1686s) you might get something valuable.

[00:28:08](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1688s) No promises, but it's possible.

[00:28:10](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1690s) Yeah OK, well, that's very helpful

[00:28:12](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1692s) because I think that's one of the things

[00:28:13](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1693s) that when I talk to marketers, I hear

[00:28:16](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1696s) of I don't know where to start, and I don't have

[00:28:19](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1699s) any sense of how long this is going

[00:28:22](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1702s) to take my team, my organization,

[00:28:25](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1705s) to be able to put this into practice.

[00:28:27](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1707s) So that's very helpful context and then

[00:28:32](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1712s) insights to be able to optimize for marginal Roi.

[00:28:35](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1715s) I want to close out with one or two takeaways, top learnings

[00:28:39](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1719s) that you think marketers who are thinking about embarking

[00:28:44](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1724s) on putting Meridian into place.

[00:28:47](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1727s) What would you give them in terms of biggest piece

[00:28:51](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1731s) of advice, your top learnings from your experience so far.

[00:28:56](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1736s) The top things is just start just get in there

[00:29:01](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1741s) and you don't have to promise anyone anything.

[00:29:03](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1743s) The main thing is just start and don't

[00:29:06](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1746s) be scared because AI is there and it's super helpful.

[00:29:09](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1749s) But also don't think that just because I could do it for you,

[00:29:12](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1752s) it's going to do everything.

[00:29:13](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1753s) You still have to understand the concepts and what

[00:29:15](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1755s) you're working with.

[00:29:16](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1756s) How has having Meridian as part of your measurement tool set

[00:29:21](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1761s) changed how you work or how you communicate with clients.

[00:29:24](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1764s) So actually, I think two things.

[00:29:26](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1766s) The first thing is that I used to run a lot of projections

[00:29:30](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1770s) and for our clients.

[00:29:31](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1771s) And those are not easy things to run.

[00:29:33](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1773s) You're making so many assumptions

[00:29:35](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1775s) as you're building them.

[00:29:36](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1776s) And I think that Meridian makes me much more confident.

[00:29:39](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1779s) We know that Patrick, from Patrick's earlier

[00:29:42](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1782s) example, the example, the price of gold

[00:29:43](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1783s) is really important here.

[00:29:44](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1784s) So if the price of gold changes, then here's

[00:29:45](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1785s) what we expect with it.

[00:29:47](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1787s) And you end up in a much more confident space

[00:29:49](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1789s) and then setting up the tests.

[00:29:50](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1790s) That's the other part that I think

[00:29:51](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1791s) has changed how we interact with clients.

[00:29:53](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1793s) I have this longer term plan.

[00:29:55](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1795s) And then the last thing I think that was actually

[00:29:57](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1797s) the thing that was more surprising to me,

[00:29:59](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1799s) it's helped to learn things about what's

[00:30:00](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1800s) going on in clients, businesses, and have

[00:30:02](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1802s) interesting conversations because you're like,

[00:30:04](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1804s) this model is not working.

[00:30:05](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1805s) You're not like there's something

[00:30:06](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1806s) that happened around this date and they're like, oh yeah,

[00:30:08](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1808s) this happened that really helpful,

[00:30:10](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1810s) not just from an standpoint, but just

[00:30:12](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1812s) from working with the account management team and being like,

[00:30:14](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1814s) oh that's interesting.

[00:30:15](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1815s) How else could we incorporate this.

[00:30:17](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1817s) And you end up with larger discussions.

[00:30:19](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1819s) Yeah, I love that.

[00:30:20](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1820s) That's great.

[00:30:21](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1821s) How about you Patrick.

[00:30:22](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1822s) Any big takeaways.

[00:30:23](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1823s) Point number one this is accessible.

[00:30:25](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1825s) You don't need a statistician a data engineer on your team.

[00:30:29](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1829s) You can do it.

[00:30:30](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1830s) Takeaway number two is that it's accessible for your clients

[00:30:33](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1833s) or for your business in ways that it wasn't previously.

[00:30:36](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1836s) When I first learned about this, it

[00:30:37](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1837s) was like, oh, that's the kind of stuff that brands like Colgate

[00:30:40](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1840s) do.

[00:30:40](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1840s) Great well, I'm not running marketing for Colgate.

[00:30:43](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1843s) I wish I was but it's like, no actually.

[00:30:46](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1846s) And part of what's underlying this

[00:30:48](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1848s) is a lot of AI that's doing a lot of that forecasting.

[00:30:51](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1851s) So you don't need as much data.

[00:30:52](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1852s) You don't need as much spend.

[00:30:53](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1853s) You can get away with it and still get value out of this.

[00:30:56](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1856s) So it's accessible for small and medium sized businesses.

[00:30:59](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1859s) And then the third thing is around expectations.

[00:31:02](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1862s) This is not a you're going to run this and get a full answer

[00:31:06](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1866s) about where your Roi is.

[00:31:07](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1867s) You really need to learn about the probabilistic nature of what

[00:31:11](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1871s) you're getting out of this, and understand that it's directional

[00:31:13](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1873s) and that we keep coming back to this.

[00:31:15](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1875s) It's leading you toward the tests

[00:31:18](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1878s) that you should run, as opposed to just throwing spaghetti

[00:31:21](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1881s) at the wall.

[00:31:21](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1881s) Month after month.

[00:31:22](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1882s) What about this.

[00:31:23](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1883s) What about that.

[00:31:24](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1884s) This gives you a lot more confidence

[00:31:26](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1886s) to go out and run tests in a way that

[00:31:28](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1888s) will make this model stronger.

[00:31:30](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1890s) And by the way, we didn't even touch upon this.

[00:31:31](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1891s) At any point like this.

[00:31:34](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1894s) DM gets better over time.

[00:31:36](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1896s) You run it once and it's like, OK, good.

[00:31:37](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1897s) And then you run it.

[00:31:38](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1898s) You run a test.

[00:31:39](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1899s) And the purpose of the test is that it improves

[00:31:42](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1902s) the confidence of the model.

[00:31:44](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1904s) So if you do this, if you started doing this today, then

[00:31:48](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1908s) a year from now, the actual model that you'd be using

[00:31:50](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1910s) would be much more reliable in terms of actually predicting

[00:31:53](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1913s) and understanding your Roi.

[00:31:55](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1915s) So it is a long term play.

[00:31:57](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1917s) It's directional, and it really does change the way

[00:31:59](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1919s) that you think about running a marketing program

[00:32:02](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1922s) and interacting with your clients

[00:32:03](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1923s) and testing and all that other stuff that we talked about.

[00:32:06](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1926s) And then I guess I would just emphasize

[00:32:07](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1927s) that the quality of the data that you're ingesting really

[00:32:12](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1932s) matters.

[00:32:12](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1932s) We talk about this all the time with anything that you're

[00:32:16](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1936s) using for measurement AI.

[00:32:18](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1938s) What you put in is going to inform the quality of what

[00:32:21](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1941s) you get out.

[00:32:22](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1942s) All right.

[00:32:23](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1943s) Well, thank you both so much.

[00:32:25](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1945s) This has been fascinating for me and I

[00:32:28](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1948s) hope fascinating and inspiring for others.

[00:32:31](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1951s) And thank you so much for sharing your experience,

[00:32:35](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1955s) expertise, and your time.

[00:32:36](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1956s) Thank you for having us.

[00:32:38](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1958s) That was such a treat.

[00:32:39](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1959s) A huge thank you to Patrick and mahama

[00:32:41](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1961s) for sharing their hands on experience with Meridian.

[00:32:45](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1965s) If you've been on the fence about media mix modeling,

[00:32:48](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1968s) I hope this conversation showed that it is perhaps much more

[00:32:51](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1971s) accessible than you had thought.

[00:32:54](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1974s) And here are my top three takeaways and action items

[00:32:57](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1977s) from our conversation.

[00:32:59](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1979s) Number one, the barrier to entry is clearly shifted.

[00:33:02](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1982s) You no longer need massive budgets and a specialized team

[00:33:05](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1985s) to run an open source.

[00:33:08](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1988s) Tools like Meridian, combined with AI coding assistance,

[00:33:11](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1991s) have opened up a whole new level of accessibility for marketers.

[00:33:17](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=1997s) The challenge is to take the time

[00:33:20](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2000s) to learn about the underlying concepts that is key,

[00:33:23](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2003s) so that you can accurately set up and interpret the models

[00:33:28](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2008s) outputs.

[00:33:29](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2009s) Number two data variance and controls are important,

[00:33:33](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2013s) and so for the model to be able to find

[00:33:35](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2015s) correlations clear signals your data

[00:33:38](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2018s) needs to have natural fluctuations situations, rather

[00:33:41](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2021s) than just a flat line of consistent spend.

[00:33:44](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2024s) Additionally, you have to feed the model the right controls

[00:33:48](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2028s) to isolate those variables.

[00:33:50](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2030s) So you want to talk to people outside of your direct marketing

[00:33:53](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2033s) teams like sales, finance, the CEO and other perhaps work

[00:33:58](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2038s) with other agencies or other marketing teams as well.

[00:34:02](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2042s) You want to uncover those external variables

[00:34:05](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2045s) that impact performance, such as seasonality, weather,

[00:34:08](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2048s) or even the price of gold.

[00:34:11](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2051s) Number three.

[00:34:11](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2051s) Set realistic expectations.

[00:34:15](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2055s) Is not going to be a silver bullet that

[00:34:18](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2058s) gives you definitive answers.

[00:34:20](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2060s) Instead, it's going to provide directional insights.

[00:34:23](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2063s) Lay that groundwork for true testing environment.

[00:34:27](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2067s) And it's designed to inform strategic,

[00:34:29](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2069s) forward looking decisions.

[00:34:31](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2071s) You want to use it alongside daily Moultrie attribution

[00:34:35](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2075s) and periodic incrementality testing.

[00:34:38](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2078s) Part of a trifecta effector action items

[00:34:41](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2081s) are one to start learning those concepts.

[00:34:45](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2085s) Really immerse yourself.

[00:34:46](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2086s) We have a great set of videos, explainers that we'll

[00:34:50](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2090s) link to here in the show notes.

[00:34:52](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2092s) Just start experimenting.

[00:34:54](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2094s) Pick a client that has data history and good data

[00:34:58](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2098s) variance across a few different types of channels, or even

[00:35:01](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2101s) campaign types.

[00:35:03](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2103s) Be sure to keep it low pressure.

[00:35:04](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2104s) Don't over promise and lean on AI.

[00:35:07](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2107s) Use an AI tool to help translate complex concepts

[00:35:11](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2111s) into simple marketing terms or analogies that

[00:35:15](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2115s) will be relevant to you, and run your initial data to check

[00:35:20](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2120s) for variance and build your understanding over time.

[00:35:23](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2123s) And that is it.

[00:35:25](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2125s) Thanks so much for tuning in to this special episode of ads

[00:35:28](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2128s) decoded.

[00:35:29](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2129s) You can find me Jenny Marvin on LinkedIn or at as liaison on X.

[00:35:34](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2134s) Keep those questions coming.

[00:35:36](https://www.youtube.com/watch?v=fMaPvjp1eEs&t=2136s) Thanks so much for tuning in and happy testing.
