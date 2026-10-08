---
type: source
source_type: youtube-transcript
title: "Zapier GTM Shared Brain: How Zapier built an AI focus group from real sales calls and account data"
source: "https://www.youtube.com/watch?v=0VELkydmwbo"
video_id: "0VELkydmwbo"
channel_id: "UCEvsxF4Z12vwpwDUaU02yiA"
channel: "Zapier"
published_at: "2026-08-17T13:54:07Z"
acquired_at: "2026-08-18T21:30:08.487812Z"
language: "en"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 3639
last_transcript_second: 3638.680
transcript_coverage: 0.999912
transcript_words: 11240
payload_sha256: "d2b65f5466f4bcf95393142dd327af86cb406e8fa57f221c2c06da1208df7e7f"
---
# Zapier GTM Shared Brain: How Zapier built an AI focus group from real sales calls and account data

## Creator description

Sign up today: https://bit.ly/4cmApwc 

Sales, Marketing, and Customer Success each carry a different version of the customer.

Sales hears one version in calls. Marketing sees another in campaign performance. Customer Success learns what happens after the deal closes. Those signals live in different tools, decay at different speeds, and rarely make it back into the persona deck everyone is supposed to use.

AI should make your marketing better. Without shared context, it becomes a slop hose.

Your team can produce more content, campaigns, outbound, and enablement than ever. But when the context beneath that work is stale or fragmented, AI produces generic output faster.

Zapier's marketing team is building a different model by building five buyer personas from account patterns and de-identified sales calls (Databricks and Gong), then put them to work pressure-testing copy, campaigns, and outreach before it ships. These aren't imaginary AI characters or static profiles with a chatbot attached. They're evidence-backed representations shaped by sales conversations, campaign performance, customer behavior, and what the team learns next.

Join Lindsay Rothlisberger, Joe Stych, and Ryan Anderson for a candid look at how Zapier built these personas, keeps them current, and puts them to work across GTM.

## Transcript

[00:00:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=4s) Welcome to today's webinar. Before we

[00:00:07](https://www.youtube.com/watch?v=0VELkydmwbo&t=7s) get started, let's go over a few quick

[00:00:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=9s) housekeeping items. First, yes, we've

[00:00:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=12s) had a few people ask, this webinar is

[00:00:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=15s) being recorded. You can access the

[00:00:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=17s) recording at any time after we close by

[00:00:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=19s) using the same link you used to join

[00:00:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=22s) today. We'll also send you an email with

[00:00:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=24s) the recording link once the webinar has

[00:00:26](https://www.youtube.com/watch?v=0VELkydmwbo&t=26s) ended.

[00:00:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=28s) Second, for the best experience, we

[00:00:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=30s) recommend using Google [music] Chrome.

[00:00:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=33s) If you run into any technical

[00:00:34](https://www.youtube.com/watch?v=0VELkydmwbo&t=34s) difficulties during the webcast, simply

[00:00:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=37s) refresh your browser. That resolves most

[00:00:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=39s) issues.

[00:00:41](https://www.youtube.com/watch?v=0VELkydmwbo&t=41s) Third, [music] we'll have time for a

[00:00:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=43s) live Q&A after we've covered all of

[00:00:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=45s) today's content. [music] But don't wait

[00:00:47](https://www.youtube.com/watch?v=0VELkydmwbo&t=47s) until the end. Feel free to submit your

[00:00:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=50s) questions throughout the presentation

[00:00:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=52s) using the questions tab. We'll

[00:00:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=54s) prioritize the questions with the most

[00:00:56](https://www.youtube.com/watch?v=0VELkydmwbo&t=56s) up votes. So, please post your questions

[00:00:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=59s) there rather than in the chat. With so

[00:01:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=62s) many people joining today, questions in

[00:01:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=64s) the chat can sometimes get lost.

[00:01:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=68s) And [music] finally, be sure to check

[00:01:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=69s) out the links tab. That's where you'll

[00:01:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=72s) find all the resources, links, and next

[00:01:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=75s) steps we mentioned during the session.

[00:01:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=77s) There are no silly questions here. We're

[00:01:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=80s) all here to learn, share ideas, and grow

[00:01:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=83s) together. So, don't hesitate to engage

[00:01:26](https://www.youtube.com/watch?v=0VELkydmwbo&t=86s) with your fellow attendees.

[00:01:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=88s) And now, let's hand it over to today's

[00:01:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=91s) presenters.

[00:01:34](https://www.youtube.com/watch?v=0VELkydmwbo&t=94s) Hey, welcome everybody. Um, thanks so

[00:01:36](https://www.youtube.com/watch?v=0VELkydmwbo&t=96s) much for tuning in here. See a couple

[00:01:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=99s) people from around the world, which is

[00:01:41](https://www.youtube.com/watch?v=0VELkydmwbo&t=101s) very awesome. Beth, I'm super close to

[00:01:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=103s) Western Mass right now. I'm over in

[00:01:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=105s) upstate New York. I was just up there

[00:01:47](https://www.youtube.com/watch?v=0VELkydmwbo&t=107s) for a wedding. So, welcome. Um, really

[00:01:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=110s) excited to talk to everyone today about

[00:01:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=113s) what I think is the absolute coolest

[00:01:56](https://www.youtube.com/watch?v=0VELkydmwbo&t=116s) thing we're doing here at Zapier Go to

[00:01:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=119s) Market. Um, Joe is very humble and he

[00:02:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=122s) was like, "Yeah, it's pretty cool." And

[00:02:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=124s) I was like, "No, this this is the

[00:02:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=126s) coolest thing." So, I'm really excited

[00:02:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=128s) to to show this off to everyone and what

[00:02:11](https://www.youtube.com/watch?v=0VELkydmwbo&t=131s) Joe has been building and what Lindsay

[00:02:13](https://www.youtube.com/watch?v=0VELkydmwbo&t=133s) have been building. We'll talk all about

[00:02:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=135s) our AI focus group and how Joe has built

[00:02:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=138s) synthetic personas off of our our go to

[00:02:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=141s) market shared brain. So, we've got a lot

[00:02:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=143s) of cool stuff to show you today. Um, but

[00:02:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=145s) first, let's do just a round of intros

[00:02:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=148s) here. Um, I'm Ryan. I lead all of our AI

[00:02:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=151s) transformation marketing programming.

[00:02:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=153s) Um, so host a lot of events just like

[00:02:36](https://www.youtube.com/watch?v=0VELkydmwbo&t=156s) this with wonderful people um like Joe

[00:02:38](https://www.youtube.com/watch?v=0VELkydmwbo&t=158s) and Lindsay. Um, I've been with Zapier

[00:02:41](https://www.youtube.com/watch?v=0VELkydmwbo&t=161s) for a little over four years and I'm

[00:02:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=164s) typically in San Francisco, California.

[00:02:46](https://www.youtube.com/watch?v=0VELkydmwbo&t=166s) Lindsay, you want to go next?

[00:02:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=168s) >> Sure. Hi everyone. I'm Lindsay

[00:02:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=170s) Rothllessberger. I live in San Diego,

[00:02:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=172s) California. I've been at Zapier for over

[00:02:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=175s) six years now and originally worked in

[00:02:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=177s) marketing operations and led the revenue

[00:02:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=179s) operations or have recently transitioned

[00:03:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=182s) into a new role where I'm focused on

[00:03:05](https://www.youtube.com/watch?v=0VELkydmwbo&t=185s) building uh the go-to market AI

[00:03:07](https://www.youtube.com/watch?v=0VELkydmwbo&t=187s) operating model. So making sure that we

[00:03:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=190s) can figure out how everything changes in

[00:03:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=192s) go to market uh now that AI is so

[00:03:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=195s) prevalent in the way that we work. Uh

[00:03:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=198s) Joe, you want to go next?

[00:03:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=200s) >> Yeah, thanks Lindsay. And I think you're

[00:03:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=201s) going to hear a few shared themes here,

[00:03:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=203s) but my name is Joe Stike. I work in

[00:03:26](https://www.youtube.com/watch?v=0VELkydmwbo&t=206s) agentic go to market. What that means

[00:03:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=208s) for us here is that my job is to both uh

[00:03:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=211s) shrink the time between us building

[00:03:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=213s) something and bringing it to market for

[00:03:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=215s) Zapier customers. So, how can we

[00:03:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=217s) generate that marketing assets faster

[00:03:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=220s) and get them in front of the people who

[00:03:41](https://www.youtube.com/watch?v=0VELkydmwbo&t=221s) need them? And then the other part of it

[00:03:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=223s) is doing a lot of understanding our

[00:03:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=225s) market, getting pulses on that kind of

[00:03:47](https://www.youtube.com/watch?v=0VELkydmwbo&t=227s) stuff. I used to work in product

[00:03:49](https://www.youtube.com/watch?v=0VELkydmwbo&t=229s) marketing here, so you're going to hear

[00:03:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=230s) a lot of that kind of uh information

[00:03:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=232s) come through and how I think about this

[00:03:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=234s) stuff. And I live in Minneapolis,

[00:03:56](https://www.youtube.com/watch?v=0VELkydmwbo&t=236s) Minnesota. I've been here for almost 12

[00:03:58](https://www.youtube.com/watch?v=0VELkydmwbo&t=238s) years now. So, thanks for coming, y'all.

[00:04:01](https://www.youtube.com/watch?v=0VELkydmwbo&t=241s) >> Yeah. Joe, remember when we used to run

[00:04:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=243s) product marketing together?

[00:04:05](https://www.youtube.com/watch?v=0VELkydmwbo&t=245s) Yeah, that was weird. It was a

[00:04:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=246s) [laughter] lot less fun, honestly, back

[00:04:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=249s) when we didn't have all these AI tools

[00:04:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=250s) and now it's been really cool to build

[00:04:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=252s) out all this fun stuff.

[00:04:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=254s) >> Yeah, I think I think we'll comment on

[00:04:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=255s) that a bunch. But as y'all were doing

[00:04:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=257s) your intros, I was realizing we've been

[00:04:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=259s) working together so much over the years.

[00:04:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=261s) It's really fun. We're we're vets,

[00:04:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=262s) longtime vets here at Zapier.

[00:04:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=265s) Um well, nice. Um let's talk about the

[00:04:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=268s) next 60 minutes here. Um we've got a

[00:04:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=272s) bunch of content and some great demos. I

[00:04:34](https://www.youtube.com/watch?v=0VELkydmwbo&t=274s) think what we've been doing with the

[00:04:36](https://www.youtube.com/watch?v=0VELkydmwbo&t=276s) shared brain and the marketing operating

[00:04:38](https://www.youtube.com/watch?v=0VELkydmwbo&t=278s) system um and agents is kind of

[00:04:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=282s) transitioning away from this older goto

[00:04:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=285s) market model um into kind of a new way

[00:04:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=288s) of operating as a team and honestly we

[00:04:51](https://www.youtube.com/watch?v=0VELkydmwbo&t=291s) are really just at the beginning here

[00:04:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=293s) but it's been really fun really

[00:04:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=295s) interesting really impactful and we

[00:04:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=297s) wanted to to show it off um and I think

[00:05:00](https://www.youtube.com/watch?v=0VELkydmwbo&t=300s) the thing with the shared brain which

[00:05:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=302s) we'll get into the second part here is a

[00:05:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=304s) lot changes in our workflows. Um both

[00:05:07](https://www.youtube.com/watch?v=0VELkydmwbo&t=307s) how we approach to maintaining the

[00:05:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=310s) quality of the shared brain and actually

[00:05:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=312s) the agents that everyone is building on

[00:05:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=314s) top of it. Um then the third thing we'll

[00:05:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=317s) talk about is we're going to go into one

[00:05:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=318s) of the key use cases off of the shared

[00:05:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=321s) brain which is this AI focus group.

[00:05:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=323s) these synthetic personas that are built

[00:05:26](https://www.youtube.com/watch?v=0VELkydmwbo&t=326s) on uh real-time data from um data bricks

[00:05:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=330s) in the way that Zapier customers are

[00:05:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=332s) using Zapier um gong conversation calls

[00:05:36](https://www.youtube.com/watch?v=0VELkydmwbo&t=336s) and um account data in HubSpot plus a

[00:05:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=339s) bunch of kind of actual human cadences

[00:05:41](https://www.youtube.com/watch?v=0VELkydmwbo&t=341s) on top of it to make these things that

[00:05:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=343s) you know I as a marketer can interact

[00:05:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=345s) with and then we'll kind of talk about

[00:05:47](https://www.youtube.com/watch?v=0VELkydmwbo&t=347s) what went wrong along the way and if

[00:05:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=350s) this is kind of new where Joe in

[00:05:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=352s) particular would recommend getting

[00:05:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=353s) started and we'll answer a lot of

[00:05:56](https://www.youtube.com/watch?v=0VELkydmwbo&t=356s) questions along the way.

[00:05:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=359s) Um, okay, let's do this. Joe, I'm going

[00:06:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=362s) to just kind of hand it off to you.

[00:06:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=363s) You're going to give a quick sneak peek

[00:06:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=364s) because we are going to demo this, but

[00:06:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=366s) we thought we'd just start off by by

[00:06:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=368s) showing, not telling.

[00:06:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=370s) >> Yeah. So, before we get into any of the

[00:06:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=372s) theory and stuff like that, I do want to

[00:06:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=374s) show you where this ends up so that you

[00:06:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=376s) know kind of where we're heading and you

[00:06:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=377s) can help ground what you're going to

[00:06:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=379s) hear today and kind of the results. So

[00:06:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=381s) the idea here and again coming at this

[00:06:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=383s) from a customer understanding and

[00:06:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=385s) product marketing perspective. Imagine

[00:06:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=387s) that you have a panel of your customers

[00:06:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=389s) sitting next to you while you work. They

[00:06:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=391s) can judge your ideas. They can praise

[00:06:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=393s) the good ones. They can tell you what

[00:06:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=395s) they would never ever buy and why.

[00:06:38](https://www.youtube.com/watch?v=0VELkydmwbo&t=398s) That's one of the really cool things you

[00:06:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=399s) can these AI tools. And just to show you

[00:06:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=402s) kind of what this will look like uh when

[00:06:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=404s) we end up showing it off.

[00:06:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=408s) So this is our uh persona panel and

[00:06:51](https://www.youtube.com/watch?v=0VELkydmwbo&t=411s) messaging lab. We have five different

[00:06:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=413s) personas that we work with. And

[00:06:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=415s) basically the idea here is that you can

[00:06:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=417s) bring an asset or a marketing thing or

[00:07:00](https://www.youtube.com/watch?v=0VELkydmwbo&t=420s) whatever you're working on to this group

[00:07:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=422s) and they'll be able to tell you what

[00:07:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=424s) they think of it. Now the other cool

[00:07:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=426s) thing about this is that this is

[00:07:07](https://www.youtube.com/watch?v=0VELkydmwbo&t=427s) constantly fed with new information. And

[00:07:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=429s) so you'll be able to see like the most

[00:07:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=432s) up-to-date versions of what our IT and

[00:07:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=434s) governance owners care about. um lots of

[00:07:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=436s) different info there and you can even do

[00:07:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=439s) things like interview them and update

[00:07:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=441s) these ideas based on what they say. So

[00:07:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=443s) that's kind of the ultimate goal of what

[00:07:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=445s) you're getting to with this work and

[00:07:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=447s) we'll teach you today a little bit more

[00:07:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=448s) about how we use it, how we built it,

[00:07:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=450s) and then also how we keep it up to date.

[00:07:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=455s) >> Awesome. Well, let's uh let's dig into

[00:07:38](https://www.youtube.com/watch?v=0VELkydmwbo&t=458s) some of the background here and let's

[00:07:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=459s) talk about the the old go to market

[00:07:41](https://www.youtube.com/watch?v=0VELkydmwbo&t=461s) model um in particular being one that

[00:07:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=465s) just loses context uh really quickly

[00:07:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=468s) really often because it's a lot of

[00:07:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=470s) humans trying to hold it all together on

[00:07:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=473s) their own through enablement sessions um

[00:07:56](https://www.youtube.com/watch?v=0VELkydmwbo&t=476s) and all of that. Um, so let's kind of

[00:07:58](https://www.youtube.com/watch?v=0VELkydmwbo&t=478s) dig into like the why behind why we're

[00:08:01](https://www.youtube.com/watch?v=0VELkydmwbo&t=481s) building a shared brain, why we built

[00:08:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=483s) the marketing OS ultimately. Um, and

[00:08:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=486s) Joe, you have this really great metaphor

[00:08:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=488s) of of kind of talking through this. So,

[00:08:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=490s) can you can you kind of talk about the

[00:08:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=492s) old world here?

[00:08:13](https://www.youtube.com/watch?v=0VELkydmwbo&t=493s) >> Yeah. So, maybe a quick show of digital

[00:08:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=496s) hands in the chat. Uh, is anyone else

[00:08:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=498s) like me old enough to remember when you

[00:08:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=500s) could actually tape something on a VHS

[00:08:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=502s) off the TV and then you copy a version

[00:08:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=505s) of that and give the tape to a friend or

[00:08:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=507s) keep it for later? There's this really

[00:08:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=509s) interesting concept um called generation

[00:08:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=511s) loss. So basically every copy you make

[00:08:34](https://www.youtube.com/watch?v=0VELkydmwbo&t=514s) of digital media will lose a little bit

[00:08:36](https://www.youtube.com/watch?v=0VELkydmwbo&t=516s) of signal with each copy you take of it.

[00:08:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=519s) So the first one is fine, the third one

[00:08:41](https://www.youtube.com/watch?v=0VELkydmwbo&t=521s) is getting kind of fuzzy by the ninth

[00:08:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=523s) copy. Steamboat Willy here is basically

[00:08:46](https://www.youtube.com/watch?v=0VELkydmwbo&t=526s) like ghosts and static and black and

[00:08:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=528s) white waves. Kind of creepy. Uh but

[00:08:51](https://www.youtube.com/watch?v=0VELkydmwbo&t=531s) that's exactly what happens with your

[00:08:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=532s) strategy, your messaging and your

[00:08:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=534s) customer's voice inside your company. A

[00:08:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=537s) customer might be giving you very clear

[00:08:58](https://www.youtube.com/watch?v=0VELkydmwbo&t=538s) or helpful feedback on the call. And

[00:09:00](https://www.youtube.com/watch?v=0VELkydmwbo&t=540s) then you can see this flow where a rep

[00:09:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=542s) summarizes it. It still feels pretty

[00:09:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=544s) clean, but then the marketing team

[00:09:07](https://www.youtube.com/watch?v=0VELkydmwbo&t=547s) creates a brief out of that summary. The

[00:09:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=549s) channel owners end up building a

[00:09:11](https://www.youtube.com/watch?v=0VELkydmwbo&t=551s) campaign based on that brief. And then

[00:09:13](https://www.youtube.com/watch?v=0VELkydmwbo&t=553s) what actually ships ends up being this

[00:09:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=555s) ninth version where it's barely

[00:09:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=556s) recognizable from the original. So

[00:09:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=559s) nobody did anything wrong in this case.

[00:09:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=561s) Every person is doing their job, but the

[00:09:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=563s) system is just very lossy in a lot of

[00:09:26](https://www.youtube.com/watch?v=0VELkydmwbo&t=566s) ways and loses a lot of its definition

[00:09:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=567s) over time. So at Zapier, what we really

[00:09:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=569s) want to do is we want our customers to

[00:09:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=571s) see the master tape and not the ninth

[00:09:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=573s) copy of it.

[00:09:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=575s) >> Yeah. And I think the the reason uh here

[00:09:38](https://www.youtube.com/watch?v=0VELkydmwbo&t=578s) is something Lindsay that you talked

[00:09:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=580s) about which is you kind of described the

[00:09:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=582s) old model as just like humans acting as

[00:09:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=585s) middleware. Um and that's not always

[00:09:49](https://www.youtube.com/watch?v=0VELkydmwbo&t=589s) super rewarding or it's not always super

[00:09:51](https://www.youtube.com/watch?v=0VELkydmwbo&t=591s) reliable but you know can you talk about

[00:09:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=593s) this? Joe touched on a little bit what

[00:09:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=595s) this looks like in a goto market or

[00:09:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=597s) >> yeah so the middleware reference is I'm

[00:10:00](https://www.youtube.com/watch?v=0VELkydmwbo&t=600s) obviously very much a revops person. um

[00:10:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=604s) always thinking in terms of systems um

[00:10:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=606s) but yeah so I think what in go to market

[00:10:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=609s) there are a lot of very specialized

[00:10:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=612s) functions um there's a lot of customer

[00:10:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=614s) transition points so a lot of customer

[00:10:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=617s) uh handoffs uh meaning going from

[00:10:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=620s) experiencing marketing to experiencing

[00:10:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=622s) sales to experiencing post sales and um

[00:10:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=625s) I think there can be a lot of friction

[00:10:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=627s) in that experience for customers and if

[00:10:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=629s) you think of the role of humans in that

[00:10:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=631s) like those of us who work behind behind

[00:10:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=633s) the scenes in facilitating that customer

[00:10:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=635s) journey, we're also doing a lot of

[00:10:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=637s) handoffs. Like we're having to gather

[00:10:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=639s) context from a lot of different people,

[00:10:41](https://www.youtube.com/watch?v=0VELkydmwbo&t=641s) from a lot of different tools, from a

[00:10:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=643s) little a lot of sources of truth. And I

[00:10:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=645s) think with AI, what's really interesting

[00:10:47](https://www.youtube.com/watch?v=0VELkydmwbo&t=647s) is we've seen uh personal productivity

[00:10:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=650s) skyrocket. So people feel like they have

[00:10:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=652s) superpowers. But what we really wanted

[00:10:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=654s) to do here was start thinking about how

[00:10:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=657s) um how we can give superpowers to a

[00:10:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=659s) whole team or to a whole organization.

[00:11:01](https://www.youtube.com/watch?v=0VELkydmwbo&t=661s) And so we're trying to figure out how to

[00:11:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=663s) cut out uh the the need for humans to

[00:11:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=666s) have to sort of like share context, hop

[00:11:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=669s) around different systems, talk to

[00:11:11](https://www.youtube.com/watch?v=0VELkydmwbo&t=671s) product, talk to sales, talk to

[00:11:13](https://www.youtube.com/watch?v=0VELkydmwbo&t=673s) marketing, and really drive alignment

[00:11:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=675s) from like looking at this as a system, a

[00:11:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=677s) system problem that we can solve.

[00:11:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=680s) >> Yeah. And um I think this is what

[00:11:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=683s) product marketing and revops have in

[00:11:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=685s) common in different ways is like

[00:11:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=687s) literally sitting at the middle of lots

[00:11:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=689s) of teams or Lindsay in your case systems

[00:11:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=692s) uh and teams and feeling very much in

[00:11:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=695s) the middle of of things. Um so you said

[00:11:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=699s) you said these are fascinating functions

[00:11:41](https://www.youtube.com/watch?v=0VELkydmwbo&t=701s) but fascinating might be code for like

[00:11:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=702s) pain painful functions. [laughter]

[00:11:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=705s) >> Yeah. Yeah. It can lead to like just a

[00:11:47](https://www.youtube.com/watch?v=0VELkydmwbo&t=707s) lot of misalignment if you don't treat

[00:11:49](https://www.youtube.com/watch?v=0VELkydmwbo&t=709s) this as a system problem. Yep. Those two

[00:11:51](https://www.youtube.com/watch?v=0VELkydmwbo&t=711s) teams feel it for sure. Um well, like

[00:11:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=714s) just to underline the failure systems

[00:11:56](https://www.youtube.com/watch?v=0VELkydmwbo&t=716s) here, Joe, like the three of us sat down

[00:11:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=719s) and really characterized this. Um uh and

[00:12:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=722s) and Lindsay as well. So Lindsay, just

[00:12:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=724s) like dig in a little bit more here, like

[00:12:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=726s) what are the failure states of the old

[00:12:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=728s) world?

[00:12:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=729s) >> Yeah, I'm sure a lot of people have

[00:12:11](https://www.youtube.com/watch?v=0VELkydmwbo&t=731s) experienced like what happens when a

[00:12:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=734s) person leaves an organization who has

[00:12:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=736s) just a ton of context in their head. um

[00:12:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=738s) and and we really wanted to figure out

[00:12:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=740s) ways to start moving away from that risk

[00:12:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=743s) um and no longer having people or

[00:12:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=745s) individuals carry the context. Um, and

[00:12:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=749s) then to Joe's point earlier about uh the

[00:12:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=752s) video recording, we really wanted to uh

[00:12:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=755s) remove the fact that when people tell a

[00:12:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=759s) story, particularly about customers or

[00:12:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=762s) like what's working or what's not, that

[00:12:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=764s) it starts to become blurriier and and

[00:12:47](https://www.youtube.com/watch?v=0VELkydmwbo&t=767s) the point of view starts to get a little

[00:12:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=768s) bit lost throughout some of those

[00:12:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=770s) handoffs. Um, but I think the other

[00:12:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=772s) thing that we're realizing with AI is if

[00:12:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=774s) you don't have a really solid foundation

[00:12:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=777s) for these things, um,

[00:13:00](https://www.youtube.com/watch?v=0VELkydmwbo&t=780s) you're no longer, uh, the the risk gets

[00:13:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=782s) very high because, uh, AI can really,

[00:13:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=786s) uh, operate more like a fire hose versus

[00:13:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=788s) a squirt gun. Uh so you have to make

[00:13:11](https://www.youtube.com/watch?v=0VELkydmwbo&t=791s) sure that um the foundation is really

[00:13:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=794s) strong in which AI is making decisions,

[00:13:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=797s) making sense of information and then

[00:13:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=799s) just fragmentation as a whole. I know

[00:13:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=802s) here at Zapier we have a lot of docs and

[00:13:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=804s) a lot of them go out of date um or

[00:13:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=807s) aren't owned and then you lose a lot of

[00:13:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=809s) context or you're not sure what's a

[00:13:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=811s) source of truth. Um, and so through this

[00:13:34](https://www.youtube.com/watch?v=0VELkydmwbo&t=814s) process of building a context layer, we

[00:13:36](https://www.youtube.com/watch?v=0VELkydmwbo&t=816s) really wanted to think about how to

[00:13:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=819s) eliminate some of that risk. Um, and how

[00:13:41](https://www.youtube.com/watch?v=0VELkydmwbo&t=821s) to avoid duplication of work. Um, I know

[00:13:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=824s) you all remember when we had like four

[00:13:47](https://www.youtube.com/watch?v=0VELkydmwbo&t=827s) different persona efforts happening at

[00:13:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=830s) one time internally here. Um, so another

[00:13:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=834s) just example of how fragmentation can

[00:13:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=837s) really um, hinder uh, how we're talking

[00:14:00](https://www.youtube.com/watch?v=0VELkydmwbo&t=840s) and showing up for customers. Yeah, Joe,

[00:14:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=843s) anything you want to touch on? You were

[00:14:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=844s) building the marketing OS, so you

[00:14:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=846s) obviously and ran product marketing at

[00:14:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=848s) one point, so you're very familiar with

[00:14:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=849s) these and some of these kind of persist

[00:14:11](https://www.youtube.com/watch?v=0VELkydmwbo&t=851s) as well, even in the new new world where

[00:14:13](https://www.youtube.com/watch?v=0VELkydmwbo&t=853s) you have a shared brain like this. Yeah,

[00:14:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=857s) I mean when I started on this new role

[00:14:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=860s) three months ago or so, uh the thing

[00:14:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=862s) that really struck me was that kind of

[00:14:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=864s) what Lindsay was saying across the

[00:14:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=865s) organization, we had no lack of customer

[00:14:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=868s) knowledge or documents like this, but

[00:14:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=871s) marketers and sales folks and RevOps

[00:14:34](https://www.youtube.com/watch?v=0VELkydmwbo&t=874s) people were all like reassembling this

[00:14:36](https://www.youtube.com/watch?v=0VELkydmwbo&t=876s) by hand for every single task and they

[00:14:38](https://www.youtube.com/watch?v=0VELkydmwbo&t=878s) all had their own versions of it. Right?

[00:14:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=880s) So Lindsay mentioned we had four

[00:14:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=882s) different kinds of personas. We had many

[00:14:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=884s) many kinds of messaging docs and all

[00:14:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=885s) these different formats. Um, and one

[00:14:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=888s) thing that AI is so good at is

[00:14:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=890s) standardizing things to a template that

[00:14:51](https://www.youtube.com/watch?v=0VELkydmwbo&t=891s) you pick and keeping them up to date in

[00:14:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=893s) that way. So, honestly, the hard part

[00:14:56](https://www.youtube.com/watch?v=0VELkydmwbo&t=896s) about this wasn't like gathering the

[00:14:58](https://www.youtube.com/watch?v=0VELkydmwbo&t=898s) data and putting it all in the right

[00:14:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=899s) format though. It was actually making

[00:15:01](https://www.youtube.com/watch?v=0VELkydmwbo&t=901s) those human judgment calls on what

[00:15:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=903s) actually deserves to be canonical and uh

[00:15:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=906s) highlighted as like gold star context

[00:15:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=909s) and what is the judgment call that we

[00:15:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=910s) need to make there of what's the most

[00:15:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=912s) important thing to focus on.

[00:15:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=915s) >> Perfect. Well, we've successfully made

[00:15:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=917s) this Orion meet up. Thanks for sharing

[00:15:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=919s) Sarah. I'm going to make sure I get

[00:15:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=920s) there. Uh and Ryan Solo, maybe you can

[00:15:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=923s) join me. Um well, you know about the

[00:15:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=925s) problems like what's the desired state

[00:15:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=927s) here, Joe. Um, do you want to talk to

[00:15:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=929s) this a little bit?

[00:15:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=932s) >> Yeah. So, I kind of mentioned at the

[00:15:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=935s) beginning that part of my job is to make

[00:15:36](https://www.youtube.com/watch?v=0VELkydmwbo&t=936s) it very fast for us to go to market. So,

[00:15:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=939s) when a customer really the desire state

[00:15:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=942s) of this is when a customer says

[00:15:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=943s) something on a real call, something like

[00:15:46](https://www.youtube.com/watch?v=0VELkydmwbo&t=946s) I don't need another tool. I need the

[00:15:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=948s) six that we have to stop arguing with

[00:15:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=950s) each other. The way that used to work is

[00:15:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=953s) that this would go into like an old CRM

[00:15:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=955s) note. somebody might not even see it or

[00:15:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=957s) it might be like an idea that makes its

[00:15:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=959s) way through many different people and

[00:16:00](https://www.youtube.com/watch?v=0VELkydmwbo&t=960s) then like morphs into something weird.

[00:16:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=963s) But in the new world, we have agents

[00:16:05](https://www.youtube.com/watch?v=0VELkydmwbo&t=965s) that can just make sure this shows up in

[00:16:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=966s) the next campaign and it can be intact.

[00:16:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=969s) It can use the exact line that the

[00:16:11](https://www.youtube.com/watch?v=0VELkydmwbo&t=971s) customer is using and then test that out

[00:16:13](https://www.youtube.com/watch?v=0VELkydmwbo&t=973s) and learn from it. The goal here is that

[00:16:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=976s) when someone has an insight from the

[00:16:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=978s) market or when we have something we want

[00:16:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=980s) to launch, it can get into the market

[00:16:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=982s) within hours. The whole game is really

[00:16:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=985s) to shrink that distance between what the

[00:16:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=987s) customer says or uh the strategic choice

[00:16:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=990s) we made or a product that we're

[00:16:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=992s) launching. Shrink the time between

[00:16:34](https://www.youtube.com/watch?v=0VELkydmwbo&t=994s) having that thing decided and getting it

[00:16:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=997s) in front of the people who actually want

[00:16:38](https://www.youtube.com/watch?v=0VELkydmwbo&t=998s) to buy it from you. So everything we

[00:16:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=1000s) show next is kind of that orange arrow

[00:16:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=1002s) in the middle and how we shrink that.

[00:16:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=1005s) >> Well, let's um let's go over the shared

[00:16:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=1008s) brain here. Um, and you know, Lindsay,

[00:16:51](https://www.youtube.com/watch?v=0VELkydmwbo&t=1011s) I'll I'll transfer to the next slide

[00:16:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=1013s) here that visualized this, but I think

[00:16:56](https://www.youtube.com/watch?v=0VELkydmwbo&t=1016s) you know, when you think about a shared

[00:16:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=1017s) brain, the thing that is really

[00:16:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=1019s) important to remember is this is not

[00:17:01](https://www.youtube.com/watch?v=0VELkydmwbo&t=1021s) just a better knowledge base. So, do you

[00:17:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=1023s) want to kind of talk about what's

[00:17:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=1024s) actually happening here, Lindsay?

[00:17:07](https://www.youtube.com/watch?v=0VELkydmwbo&t=1027s) >> Yeah. Uh I think we really wanted to

[00:17:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=1030s) move from this idea of like a knowledge

[00:17:13](https://www.youtube.com/watch?v=0VELkydmwbo&t=1033s) base where people have to go and access

[00:17:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=1036s) information and we wanted to avoid like

[00:17:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=1039s) the old world where um you know product

[00:17:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=1042s) marketing would come up with messaging

[00:17:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=1043s) and materials and they would push it out

[00:17:26](https://www.youtube.com/watch?v=0VELkydmwbo&t=1046s) and share it out and then just hope

[00:17:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=1048s) people adopt it and use it and apply it.

[00:17:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=1051s) And I think what's really fascinating

[00:17:34](https://www.youtube.com/watch?v=0VELkydmwbo&t=1054s) uh about this change in go to market

[00:17:36](https://www.youtube.com/watch?v=0VELkydmwbo&t=1056s) with AI is that you can start to think

[00:17:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=1059s) of your context and your point of view

[00:17:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=1062s) view and your knowledge as

[00:17:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=1064s) infrastructure that gets pulled into all

[00:17:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=1068s) of the systems like how agents are

[00:17:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=1070s) thinking about it, how humans are

[00:17:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=1073s) thinking about it. Um so I think

[00:17:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=1077s) evolution um when you start to think

[00:17:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=1079s) about context as infrastructure.

[00:18:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=1083s) >> Yeah I think Cal Cal agrees with you

[00:18:05](https://www.youtube.com/watch?v=0VELkydmwbo&t=1085s) here. Joe you use this term when we were

[00:18:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=1088s) talking about um you know your point of

[00:18:11](https://www.youtube.com/watch?v=0VELkydmwbo&t=1091s) view as marketing infrastructure like

[00:18:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=1094s) can you just underline for everyone what

[00:18:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=1096s) you mean there? Yeah, kind of like I

[00:18:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=1099s) mentioned before,

[00:18:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=1101s) we have so many documents, so many like

[00:18:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=1104s) pieces of customer information. Like

[00:18:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=1107s) every company on this call can probably

[00:18:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=1108s) connect their transcripts or their CRM

[00:18:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=1111s) or their usage data to one of these

[00:18:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=1113s) systems. Honestly, tools like Zapier

[00:18:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=1115s) make that really easy. If you haven't

[00:18:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=1117s) used Zapio's MCP yet, it's basically a

[00:18:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=1120s) tool that helps you to have data flow

[00:18:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=1123s) into different systems like Cloud,

[00:18:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=1125s) ChatgPT, whichever agent harness you're

[00:18:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=1128s) using. And it allows those to actually

[00:18:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=1130s) access that data and use it in the ways

[00:18:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=1132s) that you find uh safe and secure. And so

[00:18:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=1135s) that's kind of honestly pretty

[00:19:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=1142s) data itself is not a differentiated

[00:19:05](https://www.youtube.com/watch?v=0VELkydmwbo&t=1145s) brain for you. What's really going to

[00:19:07](https://www.youtube.com/watch?v=0VELkydmwbo&t=1147s) make that matter for you is the judgment

[00:19:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=1149s) layer that's on top. So what does your

[00:19:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=1150s) company believe? What is your strategy?

[00:19:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=1152s) How do you see the market? Uh what

[00:19:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=1154s) customer evidence actually matters

[00:19:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=1156s) versus stuff that's noise. And so it's

[00:19:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=1158s) really that idea of cutting through that

[00:19:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=1160s) part and making those calls on

[00:19:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=1165s) access it.

[00:19:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=1167s) >> Nice. And you know, uh, I think Dan's

[00:19:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=1170s) got a point here around getting to how

[00:19:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=1172s) we made this. So, I'm going to move us

[00:19:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=1175s) just a little bit forward and and just

[00:19:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=1177s) go high level. Um, I think one of the

[00:19:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=1180s) things that's really noticeable when I

[00:19:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=1182s) use our shared brain and the OS that Joe

[00:19:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=1185s) set up is like I'm starting to move from

[00:19:47](https://www.youtube.com/watch?v=0VELkydmwbo&t=1187s) being a doer to an actual director of

[00:19:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=1190s) work because like there was a time when

[00:19:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=1192s) we used to write everything by hand

[00:19:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=1195s) which seems like a really long time ago

[00:19:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=1197s) as an example. Um, and so like now

[00:20:01](https://www.youtube.com/watch?v=0VELkydmwbo&t=1201s) judgment is uh more important than ever.

[00:20:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=1204s) Um, like Lindsay said, right? we can

[00:20:07](https://www.youtube.com/watch?v=0VELkydmwbo&t=1207s) create a lot of work. Is it is it good

[00:20:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=1210s) work? But I think the thing that um I

[00:20:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=1212s) want to highlight before we kind of get

[00:20:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=1214s) into the synthetic personas and how Joe

[00:20:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=1216s) built these is what the shared um brain

[00:20:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=1219s) unlocks. Um Joe, Lindsay, y'all are at

[00:20:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=1222s) the heart of a lot of these use cases.

[00:20:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=1224s) Um but there's a lot that you can build

[00:20:26](https://www.youtube.com/watch?v=0VELkydmwbo&t=1226s) when you do have this foundational

[00:20:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=1229s) layer. So maybe you want to just cover

[00:20:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=1231s) these ones, Joe.

[00:20:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=1233s) Yeah, I can just go through these quick,

[00:20:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=1235s) but I would love to get to the building

[00:20:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=1237s) part, too. Um, we're going to talk today

[00:20:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=1239s) about synthetic personas. Those are

[00:20:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=1240s) basically this idea that you have these

[00:20:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=1243s) customer profiles that are backed by

[00:20:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=1245s) real data, constantly updated that you

[00:20:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=1248s) can work within your AI tools. But all

[00:20:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=1250s) this different context that you gather

[00:20:51](https://www.youtube.com/watch?v=0VELkydmwbo&t=1251s) and the things you decide on are

[00:20:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=1254s) basically going to uh be the foundation

[00:20:56](https://www.youtube.com/watch?v=0VELkydmwbo&t=1256s) for all these other items. So updating

[00:20:58](https://www.youtube.com/watch?v=0VELkydmwbo&t=1258s) your positioning and messaging, showing

[00:21:00](https://www.youtube.com/watch?v=0VELkydmwbo&t=1260s) that on your homepage, uh planning and

[00:21:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=1264s) creating campaign ideas, doing things

[00:21:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=1266s) like sales coaching and call prep. All

[00:21:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=1268s) this stuff is unlocked by that data

[00:21:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=1270s) layer that is kind of like your company

[00:21:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=1272s) foundation. So what are the things you

[00:21:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=1274s) believe about your company and how can

[00:21:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=1275s) you put those into practice and keep

[00:21:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=1277s) them fresh?

[00:21:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=1279s) >> Totally. Well, let's let's zip forward

[00:21:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=1282s) um in how we built this at Personas. I'm

[00:21:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=1283s) actually going to skip I think we've

[00:21:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=1285s) covered what these are so we don't need

[00:21:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=1287s) to go into too much detail but I think

[00:21:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=1289s) this is a really important thing um to

[00:21:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=1292s) talk to here uh Joe um which is you know

[00:21:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=1297s) how do you get the the good data in so

[00:21:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=1300s) that the output that I pull when I'm

[00:21:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=1303s) going to like craft a new webinar is

[00:21:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=1305s) actually good and based on our customers

[00:21:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=1308s) or canonical information like our latest

[00:21:51](https://www.youtube.com/watch?v=0VELkydmwbo&t=1311s) positioning and messaging for the for

[00:21:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=1312s) Zapier

[00:21:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=1314s) Yeah, for sure. And we can get into this

[00:21:56](https://www.youtube.com/watch?v=0VELkydmwbo&t=1316s) uh even deeper later on, but I'll give

[00:21:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=1319s) you kind of the brief overview of how we

[00:22:01](https://www.youtube.com/watch?v=0VELkydmwbo&t=1321s) uh went after this and accomplished the

[00:22:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=1323s) first version. So for the first version

[00:22:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=1326s) of let's just take our personas as

[00:22:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=1328s) example, we are basically taking what we

[00:22:11](https://www.youtube.com/watch?v=0VELkydmwbo&t=1331s) already believe about our customers,

[00:22:13](https://www.youtube.com/watch?v=0VELkydmwbo&t=1333s) some of that strategy stuff like which

[00:22:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=1335s) kind of people are we going after and

[00:22:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=1337s) we're creating a first version of that.

[00:22:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=1339s) Now with any first version you are

[00:22:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=1342s) basically using that for testing your

[00:22:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=1344s) assumptions updating those assumptions

[00:22:26](https://www.youtube.com/watch?v=0VELkydmwbo&t=1346s) based on new data that comes in. But the

[00:22:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=1348s) really powerful thing about the way that

[00:22:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=1351s) we are running these with the shared

[00:22:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=1352s) brain is that we use things like Zapier

[00:22:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=1355s) MCP to feed new data in constantly. So

[00:22:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=1359s) we have three systems that are kind of

[00:22:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=1360s) core to this. The first one is Gong. So,

[00:22:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=1363s) if you're not familiar with that, it is

[00:22:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=1365s) a uh tool that we can use on our sales

[00:22:47](https://www.youtube.com/watch?v=0VELkydmwbo&t=1367s) calls to record the calls, get the

[00:22:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=1370s) transcripts, get some insights on that,

[00:22:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=1372s) and basically understand what our

[00:22:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=1374s) customers are saying to us when we're

[00:22:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=1375s) trying to teach them about Zapier. So,

[00:22:58](https://www.youtube.com/watch?v=0VELkydmwbo&t=1378s) that is one data signal that goes back

[00:22:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=1379s) into the personas and either uh

[00:23:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=1382s) strengthens what we already have or

[00:23:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=1384s) suggests updates. Second one is data

[00:23:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=1386s) bricks. So this is just like any other

[00:23:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=1389s) uh data lake tool or uh business

[00:23:11](https://www.youtube.com/watch?v=0VELkydmwbo&t=1391s) intelligence tool that you might use.

[00:23:13](https://www.youtube.com/watch?v=0VELkydmwbo&t=1393s) This is basically telling us like which

[00:23:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=1395s) products on Zapier that these different

[00:23:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=1397s) personas use, how they might use them,

[00:23:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=1399s) what integrations do they use. This is

[00:23:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=1401s) probably different data for your

[00:23:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=1402s) company, but this is kind of our

[00:23:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=1404s) behavioral signal of what they're doing.

[00:23:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=1407s) And then our last one is HubSpot where

[00:23:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=1408s) we have a lot of information about uh

[00:23:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=1411s) enriching those leads like what is their

[00:23:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=1413s) company, what is the company size, what

[00:23:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=1415s) is some news about that company, things

[00:23:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=1417s) like that and learning kind of um which

[00:23:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=1420s) deals for us end up closing, what

[00:23:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=1422s) account context is there. The whole idea

[00:23:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=1424s) here is that these signals are pulling

[00:23:47](https://www.youtube.com/watch?v=0VELkydmwbo&t=1427s) on a daily basis or even more often and

[00:23:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=1430s) going into our personas to say does this

[00:23:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=1433s) make this one stronger or is there

[00:23:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=1435s) something we might need to update. The

[00:23:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=1437s) other thing that is really important

[00:23:58](https://www.youtube.com/watch?v=0VELkydmwbo&t=1438s) here is that we still have that human

[00:24:01](https://www.youtube.com/watch?v=0VELkydmwbo&t=1441s) layer. uh at least every month we are

[00:24:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=1443s) getting together with our leadership

[00:24:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=1444s) team to talk about hey here's what

[00:24:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=1446s) signals are popping up that are uh

[00:24:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=1449s) really resonating or things that we

[00:24:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=1450s) think we might need to update with our

[00:24:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=1452s) approach and our strategy or our

[00:24:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=1454s) messaging and then we have that approval

[00:24:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=1456s) layer that we actually speak to with the

[00:24:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=1458s) uh leadership team and make those final

[00:24:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=1460s) updates.

[00:24:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=1461s) >> Yeah, that's such a such an important

[00:24:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=1463s) part. I think you [snorts] can't leave

[00:24:26](https://www.youtube.com/watch?v=0VELkydmwbo&t=1466s) out the judgment piece and just trust

[00:24:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=1469s) the data is good all the time. There's a

[00:24:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=1471s) lot of meeting and prioritization that

[00:24:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=1473s) also happens to make sure this is good.

[00:24:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=1475s) Well, Adam's question here is a really

[00:24:36](https://www.youtube.com/watch?v=0VELkydmwbo&t=1476s) good one uh that I think tees up your

[00:24:38](https://www.youtube.com/watch?v=0VELkydmwbo&t=1478s) your demo quite well, Joe, which is like

[00:24:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=1480s) how does a team of people use this

[00:24:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=1482s) because if you're familiar with a shared

[00:24:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=1484s) brain and you are actively using

[00:24:47](https://www.youtube.com/watch?v=0VELkydmwbo&t=1487s) building and using agents, you are used

[00:24:49](https://www.youtube.com/watch?v=0VELkydmwbo&t=1489s) to creating a single brain for yourself

[00:24:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=1492s) but not necessarily one for the whole

[00:24:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=1494s) organization. And so, um, Joe's going to

[00:24:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=1497s) get in here to a live demo of our

[00:24:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=1499s) synthetic buyer personas.

[00:25:01](https://www.youtube.com/watch?v=0VELkydmwbo&t=1501s) >> Cool. And Adam, just to answer your

[00:25:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=1504s) question very quickly, and then we'll

[00:25:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=1506s) touch on it more as we go. The idea here

[00:25:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=1508s) is that, uh, instead of having a shared

[00:25:11](https://www.youtube.com/watch?v=0VELkydmwbo&t=1511s) brain just for you on your own, say,

[00:25:13](https://www.youtube.com/watch?v=0VELkydmwbo&t=1513s) cloud setup or on your local computer,

[00:25:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=1516s) uh, you want to have it hosted

[00:25:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=1517s) somewhere. That could be Google Drive,

[00:25:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=1519s) that could be GitHub, that could be uh

[00:25:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=1521s) any sort of file sharing tool that your

[00:25:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=1524s) whole team has access to where they'll

[00:25:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=1527s) be able to pull that data from. And so

[00:25:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=1529s) what I'll be able to show you now is

[00:25:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=1530s) kind of how these personas work and the

[00:25:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=1532s) um experience we built around them and

[00:25:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=1535s) then also how we think about that

[00:25:38](https://www.youtube.com/watch?v=0VELkydmwbo&t=1538s) sharing among the team. Basically

[00:25:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=1540s) everything I'm going to show you today

[00:25:41](https://www.youtube.com/watch?v=0VELkydmwbo&t=1541s) is accessible to the rest of the Zap

[00:25:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=1543s) year team and sort of my role in it is

[00:25:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=1545s) to make sure that it stays up to date

[00:25:47](https://www.youtube.com/watch?v=0VELkydmwbo&t=1547s) with these systems on the back end that

[00:25:49](https://www.youtube.com/watch?v=0VELkydmwbo&t=1549s) are constantly pushing new information

[00:25:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=1550s) into it. So let me share my screen here

[00:25:56](https://www.youtube.com/watch?v=0VELkydmwbo&t=1556s) and Ryan holler at me if you can't see

[00:25:58](https://www.youtube.com/watch?v=0VELkydmwbo&t=1558s) it. But coming back here to our uh

[00:26:01](https://www.youtube.com/watch?v=0VELkydmwbo&t=1561s) persona lab, this is basically our set

[00:26:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=1564s) of personas at Zapier and what they uh

[00:26:07](https://www.youtube.com/watch?v=0VELkydmwbo&t=1567s) care about, who we're usually seeing

[00:26:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=1569s) buyers from. And what we can do here is

[00:26:13](https://www.youtube.com/watch?v=0VELkydmwbo&t=1573s) this is all backed by these files I've

[00:26:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=1575s) been talking about that are updated

[00:26:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=1577s) constantly with new information, stuff

[00:26:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=1579s) about the market, etc. So, I've kind of

[00:26:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=1581s) programmed these to be pretty uh harsh

[00:26:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=1583s) and insistent, but let's just give it

[00:26:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=1585s) something pretty simple like Zapier

[00:26:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=1588s) makes you happier

[00:26:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=1590s) and see how they react to that.

[00:26:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=1593s) When I click read the room here, it is

[00:26:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=1595s) basically going to make an AI call in

[00:26:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=1597s) the back end that goes to look at those

[00:26:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=1599s) persona profiles and then they will give

[00:26:41](https://www.youtube.com/watch?v=0VELkydmwbo&t=1601s) their feedback on kind of what they're

[00:26:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=1604s) reading here.

[00:26:46](https://www.youtube.com/watch?v=0VELkydmwbo&t=1606s) So, it might take a moment because it's

[00:26:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=1608s) uh using a little more

[00:26:51](https://www.youtube.com/watch?v=0VELkydmwbo&t=1611s) computer uh memory as we're on a call,

[00:26:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=1614s) but as you can see, they're pretty harsh

[00:26:56](https://www.youtube.com/watch?v=0VELkydmwbo&t=1616s) on this one. It was just a little line,

[00:26:58](https://www.youtube.com/watch?v=0VELkydmwbo&t=1618s) right? So, we have things like Avery,

[00:27:01](https://www.youtube.com/watch?v=0VELkydmwbo&t=1621s) our VP of marketing, saying, "I don't

[00:27:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=1623s) need happier. I need fewer tools that

[00:27:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=1626s) actually talk to each other." We have

[00:27:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=1628s) Morgan, our IT security director, who

[00:27:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=1630s) says, "I don't care if it makes people

[00:27:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=1632s) happier. I care if I'm able to sleep at

[00:27:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=1634s) night." So, you know, like a little bit

[00:27:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=1636s) harsh on it, but that's kind of what we

[00:27:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=1638s) want, right? We want to understand from

[00:27:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=1640s) these people's perspectives, what is

[00:27:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=1642s) actually keeping them up at night? What

[00:27:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=1644s) is going to make them uh care about this

[00:27:26](https://www.youtube.com/watch?v=0VELkydmwbo&t=1646s) thing enough to actually buy it or want

[00:27:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=1648s) to implement it, right? So, let's try

[00:27:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=1650s) something a little more real. I'm going

[00:27:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=1652s) to go back to the homepage here and I'm

[00:27:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=1655s) going to go ahead and switch to campaign

[00:27:38](https://www.youtube.com/watch?v=0VELkydmwbo&t=1658s) concept and I'm actually going to upload

[00:27:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=1660s) here the uh brief that we put together

[00:27:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=1664s) for this webinar. So, we're going to see

[00:27:46](https://www.youtube.com/watch?v=0VELkydmwbo&t=1666s) what they think about that and how they

[00:27:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=1668s) might improve it. As they're reading

[00:27:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=1670s) through that, uh I'll also show off that

[00:27:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=1673s) we have a couple of the tabs here. One

[00:27:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=1675s) is for interviewing the persona. So

[00:27:58](https://www.youtube.com/watch?v=0VELkydmwbo&t=1678s) basically we'll be able to ask them uh

[00:28:00](https://www.youtube.com/watch?v=0VELkydmwbo&t=1680s) direct questions about like an idea or a

[00:28:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=1683s) piece of content etc. Uh we can workshop

[00:28:07](https://www.youtube.com/watch?v=0VELkydmwbo&t=1687s) things with them which I'm going to show

[00:28:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=1688s) you next. We also have a selling um

[00:28:11](https://www.youtube.com/watch?v=0VELkydmwbo&t=1691s) simulator that you can actually go into

[00:28:13](https://www.youtube.com/watch?v=0VELkydmwbo&t=1693s) a room with these folks and say hey I'm

[00:28:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=1695s) trying to sell you on something like MCP

[00:28:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=1697s) right um and try to figure out what

[00:28:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=1699s) would actually make them say yes. So

[00:28:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=1702s) here's kind of how they reacted to the

[00:28:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=1704s) actual brief for this webinar. Um, let's

[00:28:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=1708s) actually take Jordan and let's say, hey,

[00:28:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=1709s) I want to workshop this. So, we're going

[00:28:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=1711s) to workshop this idea a little bit. Uh,

[00:28:34](https://www.youtube.com/watch?v=0VELkydmwbo&t=1714s) you can see that Jordan over here has a

[00:28:36](https://www.youtube.com/watch?v=0VELkydmwbo&t=1716s) lot of different information we've

[00:28:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=1717s) pulled in and it's all been anonymized,

[00:28:38](https://www.youtube.com/watch?v=0VELkydmwbo&t=1718s) so there's no PII leaking or real

[00:28:41](https://www.youtube.com/watch?v=0VELkydmwbo&t=1721s) companies coming in, but it's basically

[00:28:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=1723s) taking that as an aggregate and things

[00:28:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=1725s) that we know about people in this sort

[00:28:47](https://www.youtube.com/watch?v=0VELkydmwbo&t=1727s) of group. So here it says uh show me the

[00:28:51](https://www.youtube.com/watch?v=0VELkydmwbo&t=1731s) skeleton I could run myself, what

[00:28:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=1733s) signals go in, what the refresh job

[00:28:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=1735s) actually does. Honestly, that's like

[00:28:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=1737s) great feedback and some feedback that

[00:28:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=1739s) we've actually gotten in the chat

[00:29:00](https://www.youtube.com/watch?v=0VELkydmwbo&t=1740s) already, right? So what we can do is we

[00:29:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=1743s) can say here um make this more

[00:29:07](https://www.youtube.com/watch?v=0VELkydmwbo&t=1747s) actionable

[00:29:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=1749s) for

[00:29:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=1750s) uh Jordan

[00:29:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=1752s) and give a first step they can walk out

[00:29:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=1756s) with.

[00:29:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=1759s) So when I say rewipe for me, this is

[00:29:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=1761s) again making a call uh to the anthropic

[00:29:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=1764s) API. It is doing those thinking pieces

[00:29:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=1767s) on the back end to say what does Jordan

[00:29:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=1769s) care about and how can we make this

[00:29:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=1772s) better for Jordan? And then once it is

[00:29:34](https://www.youtube.com/watch?v=0VELkydmwbo&t=1774s) done rewriting, it's going to give us a

[00:29:36](https://www.youtube.com/watch?v=0VELkydmwbo&t=1776s) new score that will tell us kind of what

[00:29:38](https://www.youtube.com/watch?v=0VELkydmwbo&t=1778s) has improved about this.

[00:29:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=1782s) Ryan, while it's loading, is there

[00:29:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=1783s) anything that I didn't touch on yet? Um,

[00:29:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=1785s) there's actually a great question here

[00:29:46](https://www.youtube.com/watch?v=0VELkydmwbo&t=1786s) from Brian in the chat. Um, what guard

[00:29:49](https://www.youtube.com/watch?v=0VELkydmwbo&t=1789s) rails do you have against these personas

[00:29:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=1792s) for how generative or creative their

[00:29:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=1795s) replies are? And so like if you run this

[00:29:58](https://www.youtube.com/watch?v=0VELkydmwbo&t=1798s) over and over again, like how different

[00:30:00](https://www.youtube.com/watch?v=0VELkydmwbo&t=1800s) would the replies be from from each

[00:30:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=1802s) persona?

[00:30:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=1804s) >> Yeah, that's that's something that

[00:30:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=1806s) honestly you need to be like pretty

[00:30:07](https://www.youtube.com/watch?v=0VELkydmwbo&t=1807s) hands-on with to understand the

[00:30:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=1809s) experience yourself. And that's general

[00:30:11](https://www.youtube.com/watch?v=0VELkydmwbo&t=1811s) advice I give for all of these sorts of

[00:30:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=1812s) AI tools that we build and host is you

[00:30:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=1815s) need to actually go use them, experience

[00:30:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=1818s) them, write with them, etc. And so I

[00:30:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=1821s) have done a bit of tweaking to say um

[00:30:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=1824s) like have fun with it, be a little bit

[00:30:26](https://www.youtube.com/watch?v=0VELkydmwbo&t=1826s) combative, like in a friendly way,

[00:30:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=1828s) right? Have those sorts of interactions.

[00:30:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=1831s) But it is going to be a little more

[00:30:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=1833s) generative. Uh especially because we do

[00:30:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=1835s) have these personas updated very

[00:30:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=1837s) consistently. And so even if you're

[00:30:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=1839s) coming back to this tool a week later,

[00:30:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=1842s) the persona itself is going to have new

[00:30:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=1844s) facts uh new information that it's

[00:30:46](https://www.youtube.com/watch?v=0VELkydmwbo&t=1846s) working from and new stuff that it would

[00:30:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=1848s) actually uh give back to you for the

[00:30:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=1850s) same sort of question. So hopefully

[00:30:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=1852s) there we are getting constantly better

[00:30:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=1854s) at how we understand these folks. Um but

[00:30:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=1857s) that that's kind of the answer there.

[00:30:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=1859s) >> And then maybe a question Joe like you

[00:31:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=1862s) um built these out. I mean essentially

[00:31:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=1864s) what these personas are are these

[00:31:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=1868s) markdown files right that are have a lot

[00:31:11](https://www.youtube.com/watch?v=0VELkydmwbo&t=1871s) of this data they get updated by real-

[00:31:13](https://www.youtube.com/watch?v=0VELkydmwbo&t=1873s) time data or as you push changes um to

[00:31:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=1877s) them but as you were building maybe this

[00:31:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=1880s) site versus um interacting with this and

[00:31:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=1884s) you're asking for feedback did you use

[00:31:26](https://www.youtube.com/watch?v=0VELkydmwbo&t=1886s) what cloud models did you use to build

[00:31:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=1889s) build this and then what's working in

[00:31:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=1890s) the back end here

[00:31:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=1892s) >> yeah So we have a pretty open policy at

[00:31:36](https://www.youtube.com/watch?v=0VELkydmwbo&t=1896s) Zapier on which sorts of models we're

[00:31:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=1899s) able to use. Uh they really want us

[00:31:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=1900s) pushing the boundaries which is nice.

[00:31:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=1902s) Often my development workflow for these

[00:31:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=1904s) sorts of things uh looks a little bit

[00:31:46](https://www.youtube.com/watch?v=0VELkydmwbo&t=1906s) like this. So I use cursor which is a

[00:31:49](https://www.youtube.com/watch?v=0VELkydmwbo&t=1909s) more developer focused tool but I

[00:31:51](https://www.youtube.com/watch?v=0VELkydmwbo&t=1911s) basically use that to build things like

[00:31:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=1914s) prototypes, new ideas, stuff like that.

[00:31:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=1917s) And when I use specific models,

[00:31:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=1919s) generally when I'm starting out, I try

[00:32:01](https://www.youtube.com/watch?v=0VELkydmwbo&t=1921s) to use something that is a little more

[00:32:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=1923s) frontier. So something like Fable or

[00:32:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=1926s) Chat GPT soul, things like that I've

[00:32:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=1928s) found really good success with lately.

[00:32:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=1930s) But what I usually do there is I use

[00:32:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=1932s) those models for like the early planning

[00:32:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=1934s) and figuring out what do we actually

[00:32:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=1936s) need to build and how can we do it at a

[00:32:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=1938s) high level craft and then I ask it to

[00:32:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=1941s) actually plan out how it would use sub

[00:32:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=1943s) aents or basically telling other models

[00:32:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=1945s) to go do the work on the things that are

[00:32:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=1947s) a little more simple. So after it does

[00:32:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=1950s) something like plan a site like this or

[00:32:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=1951s) the functionality it can go use a very

[00:32:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=1953s) cheap model like sonnet or it can use uh

[00:32:36](https://www.youtube.com/watch?v=0VELkydmwbo&t=1956s) even a composer which is uh cursor's

[00:32:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=1960s) model and go actually do the coding here

[00:32:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=1962s) for much cheaper and I found that to be

[00:32:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=1964s) a really good way to keep the costs in

[00:32:46](https://www.youtube.com/watch?v=0VELkydmwbo&t=1966s) check while still getting a lot of the

[00:32:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=1968s) value out of these frontier models.

[00:32:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=1970s) >> Cool. Yeah, there's there's kind of an

[00:32:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=1972s) optimization that happens over time. Um

[00:32:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=1975s) and I think this is another good

[00:32:56](https://www.youtube.com/watch?v=0VELkydmwbo&t=1976s) question from Julian. I'm not familiar

[00:32:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=1979s) with hyperbound or sales table but um

[00:33:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=1982s) asking why did you decide to build

[00:33:05](https://www.youtube.com/watch?v=0VELkydmwbo&t=1985s) versus buy here? I think hyperbound or

[00:33:07](https://www.youtube.com/watch?v=0VELkydmwbo&t=1987s) sales table might be similar in this

[00:33:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=1990s) way. Um maybe just talk about that piece

[00:33:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=1994s) of it.

[00:33:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=1995s) >> Sure. So at Zapier I will say we

[00:33:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=1998s) definitely have a build kind of culture

[00:33:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=2000s) like people are very much empowered when

[00:33:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=2002s) they have an idea to go build a solution

[00:33:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=2004s) for it or to build ideas for it. There's

[00:33:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=2007s) two way to think ways to think about

[00:33:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=2008s) this. First one is uh this gives us a

[00:33:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=2011s) little more creative freedom to actually

[00:33:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=2013s) build the things that we want for this.

[00:33:36](https://www.youtube.com/watch?v=0VELkydmwbo&t=2016s) So if we're trying to figure out like

[00:33:38](https://www.youtube.com/watch?v=0VELkydmwbo&t=2018s) how is sales actually going to use this?

[00:33:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=2020s) How might marketing go in and experience

[00:33:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=2022s) this thing? Is it going to be valuable?

[00:33:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=2025s) That kind of gives us more of a um a

[00:33:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=2028s) flexibility in actually building this to

[00:33:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=2030s) the specifications of how the team might

[00:33:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=2032s) use it. And in a lot of cases, we do

[00:33:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=2034s) build these sorts of things and we

[00:33:56](https://www.youtube.com/watch?v=0VELkydmwbo&t=2036s) figure out, oh, it's either not getting

[00:33:58](https://www.youtube.com/watch?v=0VELkydmwbo&t=2038s) used or there's another tool that could

[00:34:00](https://www.youtube.com/watch?v=0VELkydmwbo&t=2040s) actually give us um better value on that

[00:34:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=2044s) kind of thing. For example, we have been

[00:34:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=2046s) working on things like sales call prep,

[00:34:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=2049s) uh call scoring for our reps, and also

[00:34:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=2052s) live uh resourcing for uh recommending

[00:34:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=2056s) things that can use or say on sales

[00:34:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=2058s) calls. That's something we started to

[00:34:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=2060s) build out, but we found a tool that just

[00:34:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=2062s) does it really well, and we figured that

[00:34:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=2064s) this is something we didn't actually

[00:34:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=2065s) want to maintain long term for the cost.

[00:34:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=2067s) So, we do end up making those switching

[00:34:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=2069s) decisions based on kind of the internal

[00:34:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=2071s) feedback that we get. So, we very much

[00:34:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=2073s) treat it as like an internal product, a

[00:34:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=2075s) first version in a lot of cases. And we

[00:34:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=2077s) either decide to promote things or we

[00:34:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=2079s) decide to buy things if uh we either

[00:34:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=2082s) don't see the adoption we were looking

[00:34:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=2084s) for or just feel like we can't build it

[00:34:46](https://www.youtube.com/watch?v=0VELkydmwbo&t=2086s) in the best way.

[00:34:47](https://www.youtube.com/watch?v=0VELkydmwbo&t=2087s) >> Yeah. Yeah. Yeah, I mean and I I think

[00:34:49](https://www.youtube.com/watch?v=0VELkydmwbo&t=2089s) another version of this is like uh Joe

[00:34:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=2093s) is is a really prolific builder, but you

[00:34:56](https://www.youtube.com/watch?v=0VELkydmwbo&t=2096s) know, by no means are you an engineer,

[00:34:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=2097s) Joe, either. And so there's there's also

[00:35:00](https://www.youtube.com/watch?v=0VELkydmwbo&t=2100s) this element of you being able to go

[00:35:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=2102s) solve a problem that you uniquely knew

[00:35:05](https://www.youtube.com/watch?v=0VELkydmwbo&t=2105s) about as former head of product

[00:35:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=2106s) marketing and like a lot of the pain

[00:35:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=2110s) here that you know what is the ultimate

[00:35:13](https://www.youtube.com/watch?v=0VELkydmwbo&t=2113s) impact of this? It might be a little bit

[00:35:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=2115s) hard to measure. Um, but you can

[00:35:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=2117s) actually just go build, deploy, maintain

[00:35:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=2120s) this. It's not a huge amount of overhead

[00:35:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=2122s) and it's solving this really critical

[00:35:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=2124s) problem which is like for us is like

[00:35:26](https://www.youtube.com/watch?v=0VELkydmwbo&t=2126s) message drift, right? And not having

[00:35:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=2128s) teams aligned.

[00:35:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=2130s) >> Totally. Yeah. And one other um nice use

[00:35:34](https://www.youtube.com/watch?v=0VELkydmwbo&t=2134s) case I'll put forward is for example if

[00:35:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=2137s) our CMO comes to us and you know

[00:35:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=2139s) leadership always has these big ideas or

[00:35:41](https://www.youtube.com/watch?v=0VELkydmwbo&t=2141s) they get really excited about things

[00:35:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=2142s) which is great in a lot of ways. If our

[00:35:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=2144s) CMO comes to us and says hey I really

[00:35:46](https://www.youtube.com/watch?v=0VELkydmwbo&t=2146s) want to build this thing. I think this

[00:35:47](https://www.youtube.com/watch?v=0VELkydmwbo&t=2147s) is really cool. I can have like a mockup

[00:35:49](https://www.youtube.com/watch?v=0VELkydmwbo&t=2149s) for him in you know an hour for about 20

[00:35:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=2153s) bucks and I can just say does this feel

[00:35:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=2155s) like what you want? What is missing?

[00:35:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=2157s) Like how does this match up with your

[00:35:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=2159s) vision of reality? And then that's a

[00:36:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=2162s) really easy way to kind of like

[00:36:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=2163s) prototype and either align on yeah maybe

[00:36:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=2166s) not the best idea or like to continue

[00:36:07](https://www.youtube.com/watch?v=0VELkydmwbo&t=2167s) investing in something.

[00:36:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=2170s) >> So good. Um well Joe we have a we we

[00:36:13](https://www.youtube.com/watch?v=0VELkydmwbo&t=2173s) jumped 30 points here in resonance. So

[00:36:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=2176s) >> you wanted to talk about how this did

[00:36:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=2177s) and then we've got about 10 minutes

[00:36:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=2179s) before Q&A. So I want to make sure you

[00:36:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=2181s) go through the other pieces of the demo.

[00:36:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=2183s) >> I'll just run through this real quick.

[00:36:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=2185s) Like I said, um these are all backed by

[00:36:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=2188s) these files and these personas that are

[00:36:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=2190s) consistently updated. Um I just asked it

[00:36:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=2192s) to make it better for Jordan and Jordan

[00:36:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=2195s) kind of showed like the ways in which it

[00:36:38](https://www.youtube.com/watch?v=0VELkydmwbo&t=2198s) could be improved. I'm not going to read

[00:36:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=2199s) through this whole file because it's a

[00:36:41](https://www.youtube.com/watch?v=0VELkydmwbo&t=2201s) big deal, but it still says what's

[00:36:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=2203s) missing here and uh what we will

[00:36:46](https://www.youtube.com/watch?v=0VELkydmwbo&t=2206s) continue to update. You can just kind of

[00:36:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=2208s) keep going through those cycles or even

[00:36:49](https://www.youtube.com/watch?v=0VELkydmwbo&t=2209s) do the drafts yourself and to keep

[00:36:51](https://www.youtube.com/watch?v=0VELkydmwbo&t=2211s) making it better. But the real beauty of

[00:36:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=2213s) these, like Brian started to touch on,

[00:36:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=2215s) is that these are all just files, right?

[00:36:58](https://www.youtube.com/watch?v=0VELkydmwbo&t=2218s) They are text files that are

[00:37:00](https://www.youtube.com/watch?v=0VELkydmwbo&t=2220s) continuously updated with new context.

[00:37:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=2223s) Uh you have Avery, Jordan, Morgan. These

[00:37:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=2226s) are just mockups of them, but these are

[00:37:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=2228s) things that are accessible in a lot of

[00:37:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=2230s) different tools. And what we do with

[00:37:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=2232s) these uh files is um sorry, I'm

[00:37:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=2235s) forgetting who asked the question

[00:37:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=2236s) earlier, but someone asked like how do

[00:37:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=2238s) you end up distributing this? We make

[00:37:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=2240s) these available in many different ways

[00:37:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=2241s) to our internal teams. So this is kind

[00:37:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=2244s) of our knowledge base that we built that

[00:37:26](https://www.youtube.com/watch?v=0VELkydmwbo&t=2246s) has different ways to connect your

[00:37:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=2247s) agents to these files. This contains

[00:37:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=2250s) everything from our brand story to

[00:37:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=2252s) personas to positioning and messaging.

[00:37:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=2255s) And this is what is actually kept up to

[00:37:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=2257s) date and the back end for all of our

[00:37:38](https://www.youtube.com/watch?v=0VELkydmwbo&t=2258s) stuff. So one other use case I want to

[00:37:41](https://www.youtube.com/watch?v=0VELkydmwbo&t=2261s) show off in that realm is that when we

[00:37:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=2263s) have these sorts of things, you can

[00:37:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=2265s) actually just pull them into whatever

[00:37:47](https://www.youtube.com/watch?v=0VELkydmwbo&t=2267s) agent harness of choice you have and

[00:37:49](https://www.youtube.com/watch?v=0VELkydmwbo&t=2269s) access them directly. So one example I

[00:37:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=2272s) want to show here is I actually took the

[00:37:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=2274s) landing page from this webinar and I

[00:37:56](https://www.youtube.com/watch?v=0VELkydmwbo&t=2276s) said I want to make sure that Jordan

[00:37:58](https://www.youtube.com/watch?v=0VELkydmwbo&t=2278s) shows up to this. Uh could you please

[00:38:00](https://www.youtube.com/watch?v=0VELkydmwbo&t=2280s) write up some emails that would actually

[00:38:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=2282s) hook Jordan and have him want to attend?

[00:38:05](https://www.youtube.com/watch?v=0VELkydmwbo&t=2285s) And so Jordan uh we kind of went through

[00:38:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=2288s) this piece where we said what's going to

[00:38:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=2290s) matter with Jordan the most? Which

[00:38:13](https://www.youtube.com/watch?v=0VELkydmwbo&t=2293s) headlines should we write? And these are

[00:38:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=2295s) backed by things that have worked in the

[00:38:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=2296s) past for this same persona. Down here

[00:38:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=2299s) Jordan also can give their take. And

[00:38:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=2301s) this is all just happening in Claude. So

[00:38:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=2304s) if I change my mind and I say actually I

[00:38:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=2308s) want Avery

[00:38:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=2310s) to attend

[00:38:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=2313s) rewrite for that case

[00:38:36](https://www.youtube.com/watch?v=0VELkydmwbo&t=2316s) and this is a live demo so hopefully

[00:38:38](https://www.youtube.com/watch?v=0VELkydmwbo&t=2318s) this goes okay but what it should do

[00:38:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=2320s) here is it will go and find Avery's

[00:38:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=2323s) profile instead. It'll revisit what the

[00:38:46](https://www.youtube.com/watch?v=0VELkydmwbo&t=2326s) actual request was to write some emails

[00:38:49](https://www.youtube.com/watch?v=0VELkydmwbo&t=2329s) that would make them excited to attend.

[00:38:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=2332s) And it looks like right now it is

[00:38:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=2333s) reading the context of the persona

[00:38:56](https://www.youtube.com/watch?v=0VELkydmwbo&t=2336s) profile. So that's pulling again from

[00:38:58](https://www.youtube.com/watch?v=0VELkydmwbo&t=2338s) that consistently updated file and

[00:39:01](https://www.youtube.com/watch?v=0VELkydmwbo&t=2341s) tailoring some messages around what

[00:39:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=2343s) Avery would care about the most. So you

[00:39:05](https://www.youtube.com/watch?v=0VELkydmwbo&t=2345s) can kind of see all the thinking that

[00:39:07](https://www.youtube.com/watch?v=0VELkydmwbo&t=2347s) it's going through here

[00:39:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=2349s) and hopefully soon we'll have some new

[00:39:13](https://www.youtube.com/watch?v=0VELkydmwbo&t=2353s) subject lines.

[00:39:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=2354s) >> Joe, do you want to talk about where the

[00:39:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=2356s) where these files actually live for us?

[00:39:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=2359s) Like where the where the context

[00:39:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=2360s) actually is? Yep. So, we have actually

[00:39:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=2363s) two places that this lives. They're both

[00:39:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=2364s) in sync. We have these hosted on GitHub,

[00:39:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=2368s) and that's a little more of a uh

[00:39:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=2369s) developer tool, but it's a really good

[00:39:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=2372s) place to host files like this that you

[00:39:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=2373s) need to have um like change logs on and

[00:39:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=2377s) figuring out uh what's actually changed

[00:39:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=2380s) among these files from a day-to-day

[00:39:41](https://www.youtube.com/watch?v=0VELkydmwbo&t=2381s) basis. The other place we have these

[00:39:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=2383s) stored is an internal tool uh that we

[00:39:46](https://www.youtube.com/watch?v=0VELkydmwbo&t=2386s) have like document storage and knowledge

[00:39:47](https://www.youtube.com/watch?v=0VELkydmwbo&t=2387s) base kind of stuff in that we're

[00:39:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=2390s) currently building. It's in beta and

[00:39:51](https://www.youtube.com/watch?v=0VELkydmwbo&t=2391s) we're hoping to ship it to customers

[00:39:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=2393s) soon. But it's kind of a knowledge layer

[00:39:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=2395s) that we're building across Zapier to be

[00:39:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=2397s) able to have access to these sorts of

[00:39:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=2399s) things and just plug it into any AI

[00:40:00](https://www.youtube.com/watch?v=0VELkydmwbo&t=2400s) tooling that you would want through the

[00:40:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=2402s) Zapier MCP.

[00:40:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=2404s) >> Yeah, I think someone originally said,

[00:40:05](https://www.youtube.com/watch?v=0VELkydmwbo&t=2405s) you know, I've I, you know, one brain,

[00:40:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=2408s) one computer type of thing, that context

[00:40:11](https://www.youtube.com/watch?v=0VELkydmwbo&t=2411s) layer um that we've been developing is

[00:40:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=2414s) to solve exactly for how do you

[00:40:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=2415s) distribute to this team or a whole

[00:40:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=2417s) organization basically.

[00:40:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=2419s) >> Totally.

[00:40:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=2420s) Cool. Uh, two other quick use cases I'll

[00:40:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=2423s) just go over real fast. This other one

[00:40:26](https://www.youtube.com/watch?v=0VELkydmwbo&t=2426s) was me taking this page again and I

[00:40:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=2429s) literally just gave it the page and

[00:40:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=2430s) said, "Rewite this so that it appeals to

[00:40:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=2433s) Avery. It spits out a whole new webinar

[00:40:36](https://www.youtube.com/watch?v=0VELkydmwbo&t=2436s) page that would be very targeted at

[00:40:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=2437s) them." So, you can see this working for

[00:40:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=2440s) like customizing content based on the

[00:40:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=2442s) visitor or customizing the link that you

[00:40:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=2444s) send to someone in an email or in a

[00:40:46](https://www.youtube.com/watch?v=0VELkydmwbo&t=2446s) LinkedIn message, stuff like that. And

[00:40:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=2448s) then the other thing that you can do

[00:40:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=2450s) here is you can do things like uh sales

[00:40:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=2453s) call prep which is something we've been

[00:40:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=2455s) building. So this is a anonymized

[00:40:58](https://www.youtube.com/watch?v=0VELkydmwbo&t=2458s) version of uh what kind of information

[00:41:01](https://www.youtube.com/watch?v=0VELkydmwbo&t=2461s) we might give to our sales team. But if

[00:41:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=2463s) we were talking to someone at Wayost

[00:41:05](https://www.youtube.com/watch?v=0VELkydmwbo&t=2465s) Software and we saw that a good persona

[00:41:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=2468s) match was Jordan, we'd be able to pull

[00:41:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=2470s) in a lot of different stuff from this

[00:41:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=2472s) knowledge layer that says uh here's how

[00:41:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=2475s) the sort of frame you should use. Here

[00:41:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=2478s) are the sorts of questions you should

[00:41:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=2479s) ask or ways that you should frame the

[00:41:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=2481s) product. And even down here, we can pull

[00:41:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=2483s) in things like customer stories that

[00:41:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=2485s) might resonate and the different um

[00:41:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=2488s) proof points that we have that would

[00:41:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=2490s) match up with that. So, this is an

[00:41:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=2492s) example of how you can kind of bring all

[00:41:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=2493s) of that data together if you're really

[00:41:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=2495s) doing a good job keeping it fresh and up

[00:41:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=2497s) to date on your end and making that

[00:41:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=2500s) available to folks.

[00:41:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=2504s) >> I um I love this. This is a good

[00:41:46](https://www.youtube.com/watch?v=0VELkydmwbo&t=2506s) transition to uh the next point here

[00:41:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=2510s) which is this piece you know um the

[00:41:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=2512s) personas are but that sales call brief

[00:41:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=2515s) piece is stitching a lot of the layers

[00:41:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=2519s) of context and data systems data bricks

[00:42:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=2522s) HubSpot Gong etc all together in one

[00:42:05](https://www.youtube.com/watch?v=0VELkydmwbo&t=2525s) view that like as a seller you just have

[00:42:07](https://www.youtube.com/watch?v=0VELkydmwbo&t=2527s) never had before which I think is really

[00:42:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=2530s) cool. So Joe, do you want to talk about

[00:42:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=2532s) the kind of context stack that exists in

[00:42:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=2535s) our brain?

[00:42:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=2536s) >> Yeah, I can talk about it real quick.

[00:42:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=2538s) And this is very much where you'll see

[00:42:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=2540s) the product marketer coming through. But

[00:42:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=2542s) this is kind of how we think about uh

[00:42:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=2545s) how you build the context as sort of a

[00:42:26](https://www.youtube.com/watch?v=0VELkydmwbo&t=2546s) waterfall in an organization. So really

[00:42:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=2549s) you need to start uh from your company

[00:42:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=2551s) foundation. What is your mission? Uh

[00:42:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=2553s) what do you sell? What do you believe

[00:42:34](https://www.youtube.com/watch?v=0VELkydmwbo&t=2554s) in? Right? And then from there you kind

[00:42:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=2557s) of go to the strategic positioning. So

[00:42:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=2559s) that's who are you for, how are you

[00:42:41](https://www.youtube.com/watch?v=0VELkydmwbo&t=2561s) different from other competitors in your

[00:42:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=2563s) market, stuff like that. And from there

[00:42:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=2565s) it kind of flows down to say um how do

[00:42:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=2568s) you talk about this with customers in

[00:42:49](https://www.youtube.com/watch?v=0VELkydmwbo&t=2569s) the messaging architecture? What are the

[00:42:51](https://www.youtube.com/watch?v=0VELkydmwbo&t=2571s) actual products that you offer and how

[00:42:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=2573s) do you describe them? And then how does

[00:42:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=2575s) that come to life through the brand? The

[00:42:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=2577s) very important part here is that last

[00:42:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=2579s) piece with the signal. So let's say that

[00:43:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=2582s) we put out a LinkedIn campaign for a new

[00:43:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=2584s) product and we put that out specifically

[00:43:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=2586s) for a rowops persona. What we want to

[00:43:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=2589s) make sure happens in that last piece is

[00:43:11](https://www.youtube.com/watch?v=0VELkydmwbo&t=2591s) that the operational signal for did

[00:43:13](https://www.youtube.com/watch?v=0VELkydmwbo&t=2593s) people click on that, did they contact

[00:43:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=2595s) sales about that, etc. that needs to

[00:43:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=2598s) make it back into the top of this list

[00:43:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=2600s) so that we're updating everything else

[00:43:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=2602s) to say here's a thing we know really

[00:43:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=2604s) worked and resonated. We should be doing

[00:43:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=2607s) more of that. So, that's kind of the

[00:43:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=2609s) critical piece there.

[00:43:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=2610s) >> Yeah. And there um there's a great

[00:43:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=2612s) question here. I'd love for you to take

[00:43:34](https://www.youtube.com/watch?v=0VELkydmwbo&t=2614s) it. Uh Joe from Dan asking, "Can you

[00:43:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=2617s) build zaps via MCP? You know, it' be

[00:43:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=2619s) great to tell Claude to connect X and Y

[00:43:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=2622s) and not have to manually make the

[00:43:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=2623s) connection."

[00:43:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=2625s) >> Uh that is very much on the road map.

[00:43:49](https://www.youtube.com/watch?v=0VELkydmwbo&t=2629s) [laughter] I think that that is

[00:43:51](https://www.youtube.com/watch?v=0VELkydmwbo&t=2631s) something I've been experimenting with

[00:43:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=2632s) internally and something that folks are

[00:43:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=2634s) getting very excited about. Um, and so

[00:43:56](https://www.youtube.com/watch?v=0VELkydmwbo&t=2636s) it's something that we want to build

[00:43:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=2637s) towards and being able to use those um,

[00:44:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=2642s) uh, those agents to actually like build

[00:44:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=2643s) and manage different workflows. How I've

[00:44:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=2646s) been thinking about this often is that I

[00:44:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=2649s) mentioned before I use cursor as kind of

[00:44:11](https://www.youtube.com/watch?v=0VELkydmwbo&t=2651s) my development space. Usually the

[00:44:13](https://www.youtube.com/watch?v=0VELkydmwbo&t=2653s) process I go through is I build

[00:44:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=2655s) something in cursor. It's usually a

[00:44:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=2657s) little more expensive and then what I do

[00:44:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=2659s) is I try to find a model that will still

[00:44:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=2662s) produce the same results but for

[00:44:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=2664s) cheaper. Then the last step I take is

[00:44:26](https://www.youtube.com/watch?v=0VELkydmwbo&t=2666s) that I promote anything that's long

[00:44:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=2668s) running like this loop into Zapier

[00:44:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=2670s) itself. So automatically it will be

[00:44:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=2672s) running these in the background. You

[00:44:34](https://www.youtube.com/watch?v=0VELkydmwbo&t=2674s) don't have to have any sort of uh

[00:44:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=2677s) monitoring on that or uh manual triggers

[00:44:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=2680s) on that which is really nice. And the uh

[00:44:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=2683s) thing that you're asking about Dan is

[00:44:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=2685s) basically I can use this uh AI tooling

[00:44:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=2688s) to build the first version of the

[00:44:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=2690s) workflow and then ask the agent itself

[00:44:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=2693s) to promote that to Zapier and make it

[00:44:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=2695s) something more durable and something

[00:44:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=2697s) that runs in the background which is

[00:44:58](https://www.youtube.com/watch?v=0VELkydmwbo&t=2698s) really cool.

[00:45:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=2702s) >> Great question. And Joe, you brought up

[00:45:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=2704s) up loops here. So I think you you and

[00:45:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=2706s) Lindsay can talk a little bit to this um

[00:45:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=2709s) piece around the the loops. Um, but I

[00:45:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=2712s) think this is where this is not a

[00:45:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=2714s) knowledge base specifically. We've

[00:45:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=2716s) touched on this a little bit, but do you

[00:45:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=2717s) want to kind of go over this diagram

[00:45:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=2719s) here because I think this is essential

[00:45:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=2721s) for this being automatically useful

[00:45:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=2724s) every time a marketer, seller, whatever

[00:45:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=2727s) goes to the goes to access this.

[00:45:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=2730s) >> Yeah. Lindsay, you want to take this one

[00:45:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=2732s) or you want me to snag it?

[00:45:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=2735s) >> Yeah, sure. Maybe I'll I'll speak to

[00:45:36](https://www.youtube.com/watch?v=0VELkydmwbo&t=2736s) like what I think is like super duper

[00:45:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=2739s) interesting about this and then you can

[00:45:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=2740s) add on. Um I

[00:45:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=2743s) how many times like have we discovered

[00:45:47](https://www.youtube.com/watch?v=0VELkydmwbo&t=2747s) some insight about our customer? Um and

[00:45:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=2750s) whether that's like a salesperson starts

[00:45:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=2752s) to just see a trend emerging on sales

[00:45:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=2755s) calls or maybe a campaign just totally

[00:45:58](https://www.youtube.com/watch?v=0VELkydmwbo&t=2758s) flops. Um, and those learnings have been

[00:46:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=2762s) historically very hard to then integrate

[00:46:05](https://www.youtube.com/watch?v=0VELkydmwbo&t=2765s) into the go-to market motion and change

[00:46:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=2768s) how we actually operate. And I think

[00:46:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=2770s) what's just so cool about AI and really

[00:46:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=2774s) thinking about it as infrastructure and

[00:46:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=2776s) thinking about it as an operating model

[00:46:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=2778s) is that those loops get closed a lot

[00:46:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=2781s) more quickly because we can take that

[00:46:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=2782s) information and it automatically gets

[00:46:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=2785s) fed into our context layer. And

[00:46:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=2787s) sometimes that is a decision that has to

[00:46:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=2789s) be made, right? Which Joe can speak to

[00:46:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=2791s) um in terms of how we do it. But it

[00:46:34](https://www.youtube.com/watch?v=0VELkydmwbo&t=2794s) allows us to very quickly shift the way

[00:46:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=2797s) that we're talking and to do it in a way

[00:46:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=2799s) that is the same across sales and

[00:46:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=2802s) marketing and customer success.

[00:46:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=2805s) Anything you would add, Joe, in terms of

[00:46:47](https://www.youtube.com/watch?v=0VELkydmwbo&t=2807s) like how this works?

[00:46:49](https://www.youtube.com/watch?v=0VELkydmwbo&t=2809s) >> No, honestly, I think in the interest of

[00:46:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=2810s) time and making sure we have time for

[00:46:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=2812s) questions, we should move to the last

[00:46:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=2814s) couple maybe.

[00:46:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=2815s) >> Yeah. Yeah. I think one of the things

[00:46:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=2817s) too is this is a great new model. Um but

[00:47:01](https://www.youtube.com/watch?v=0VELkydmwbo&t=2821s) there are still like um nothing is safe,

[00:47:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=2824s) right? There are still some some issues

[00:47:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=2826s) here. So Lindsay, do you want to just

[00:47:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=2828s) like talk to some of the failure modes

[00:47:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=2830s) that still exist around the brain?

[00:47:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=2834s) >> Yeah, I mean there's still just this

[00:47:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=2835s) huge risk that um context doesn't get

[00:47:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=2838s) updated or you don't have a good model

[00:47:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=2840s) for who owns it and when it gets

[00:47:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=2842s) updated. Um, and that can really have a

[00:47:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=2845s) big impact impact on the outputs

[00:47:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=2847s) themselves. I'm curious, Joe, like

[00:47:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=2850s) through this process, um, how does that

[00:47:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=2853s) human review loop work? Um, and anything

[00:47:36](https://www.youtube.com/watch?v=0VELkydmwbo&t=2856s) you've seen sort of as like a failure

[00:47:38](https://www.youtube.com/watch?v=0VELkydmwbo&t=2858s) mode to avoid.

[00:47:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=2860s) >> Yeah. Um, so for the human review point,

[00:47:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=2864s) there are a couple ways this works. The

[00:47:46](https://www.youtube.com/watch?v=0VELkydmwbo&t=2866s) first one is just the individual, right?

[00:47:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=2868s) So never ever of course ship anything

[00:47:51](https://www.youtube.com/watch?v=0VELkydmwbo&t=2871s) that you're not reading. That's kind of

[00:47:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=2873s) a key part especially when you're

[00:47:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=2874s) building these uh these newer systems

[00:47:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=2877s) and trying to understand how the context

[00:47:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=2879s) flows through them and how they're

[00:48:01](https://www.youtube.com/watch?v=0VELkydmwbo&t=2881s) performing. Uh eventually you can get it

[00:48:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=2883s) to a point where it is really high

[00:48:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=2884s) quality and you've trained it well. But

[00:48:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=2886s) then the second part that's really

[00:48:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=2888s) important is this governance layer of

[00:48:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=2890s) the company leadership or aligning on

[00:48:13](https://www.youtube.com/watch?v=0VELkydmwbo&t=2893s) strategy. Right? Sometimes a lot of work

[00:48:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=2896s) is meetings, right? And it is getting in

[00:48:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=2898s) those rooms and it's feeling like we're

[00:48:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=2900s) having a discussion. we're agreeing on a

[00:48:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=2902s) way to go. And what this kind of gives

[00:48:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=2904s) you is the um the script for having that

[00:48:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=2908s) conversation or the insights for having

[00:48:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=2910s) the conversation. So let's say that we

[00:48:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=2912s) have these personas, right? They're

[00:48:34](https://www.youtube.com/watch?v=0VELkydmwbo&t=2914s) collecting data throughout the month. It

[00:48:36](https://www.youtube.com/watch?v=0VELkydmwbo&t=2916s) says we had 50 sales calls and nine of

[00:48:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=2920s) them were with RevOps and these are the

[00:48:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=2922s) things that popped out from those

[00:48:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=2924s) conversations. What we usually do or

[00:48:46](https://www.youtube.com/watch?v=0VELkydmwbo&t=2926s) what we have been doing at Zapier is we

[00:48:49](https://www.youtube.com/watch?v=0VELkydmwbo&t=2929s) actually have a group that gets together

[00:48:51](https://www.youtube.com/watch?v=0VELkydmwbo&t=2931s) and reviews kind of those insights and

[00:48:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=2933s) we decide which ones to promote into

[00:48:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=2935s) more like gold star or canonical sort of

[00:48:58](https://www.youtube.com/watch?v=0VELkydmwbo&t=2938s) context and which ones that we're like

[00:49:00](https://www.youtube.com/watch?v=0VELkydmwbo&t=2940s) hey maybe that makes sense but it's not

[00:49:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=2943s) part of our strategy. And so we use that

[00:49:05](https://www.youtube.com/watch?v=0VELkydmwbo&t=2945s) as sort of a human discussion point to

[00:49:07](https://www.youtube.com/watch?v=0VELkydmwbo&t=2947s) be able to say what is in or out for

[00:49:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=2949s) those.

[00:49:11](https://www.youtube.com/watch?v=0VELkydmwbo&t=2951s) >> Yeah. And there's there's a lot of great

[00:49:13](https://www.youtube.com/watch?v=0VELkydmwbo&t=2953s) agents or automations to build in order

[00:49:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=2955s) to detect things like drift or detect

[00:49:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=2958s) things like new signals and surface

[00:49:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=2960s) those that works great around this. I

[00:49:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=2962s) know um Courtney who runs our executive

[00:49:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=2965s) team um she has like a strategy drift

[00:49:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=2969s) agent that basically like crawls around

[00:49:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=2971s) Slack or the meetings that exec team is

[00:49:34](https://www.youtube.com/watch?v=0VELkydmwbo&t=2974s) having and basically like the agent will

[00:49:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=2975s) just flag hey this seems like it's

[00:49:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=2977s) drifting this project is drifting or

[00:49:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=2979s) this decision is drifting. Um, so I

[00:49:41](https://www.youtube.com/watch?v=0VELkydmwbo&t=2981s) think there's also a lot of great

[00:49:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=2982s) automation to detect anomalies or detect

[00:49:46](https://www.youtube.com/watch?v=0VELkydmwbo&t=2986s) um, drift or new insights. And so

[00:49:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=2988s) there's cool things to build around this

[00:49:51](https://www.youtube.com/watch?v=0VELkydmwbo&t=2991s) as well. One thing also I think while

[00:49:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=2993s) we're talking about this, Matt here in

[00:49:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=2995s) the chat has a great question around um,

[00:49:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=2999s) the canon needs to exist in two formats,

[00:50:01](https://www.youtube.com/watch?v=0VELkydmwbo&t=3001s) which is true. This is how we do it. um

[00:50:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=3004s) one for agents markdown files let's say

[00:50:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=3006s) and then another that humans can

[00:50:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=3008s) actually view crossch checkck etc. Um,

[00:50:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=3012s) we've we've come across this. I think

[00:50:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=3014s) we've we've solved for this for the most

[00:50:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=3016s) part, especially with um the micro site

[00:50:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=3018s) that you built, Joe, and Versel. Um, but

[00:50:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=3021s) anything you want to kind of like answer

[00:50:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=3023s) Matt's question to on on that detail?

[00:50:26](https://www.youtube.com/watch?v=0VELkydmwbo&t=3026s) >> Yeah, Matt, you're exactly right. There

[00:50:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=3028s) are there's basically like a data layer

[00:50:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=3031s) and a display layer for this, right?

[00:50:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=3033s) Where you have the agent working with it

[00:50:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=3035s) and then you have the human who also

[00:50:36](https://www.youtube.com/watch?v=0VELkydmwbo&t=3036s) needs to read it. And the way that we've

[00:50:38](https://www.youtube.com/watch?v=0VELkydmwbo&t=3038s) solved for that, like Ryan said, was we

[00:50:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=3040s) have this little micro site. I'll share

[00:50:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=3042s) my screen again quick.

[00:50:49](https://www.youtube.com/watch?v=0VELkydmwbo&t=3049s) Uh, basically all of our info that we've

[00:50:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=3052s) been keeping up to date. Uh, it has all

[00:50:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=3054s) these canonical documents of voice and

[00:50:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=3057s) messaging, positioning, brand story,

[00:50:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=3059s) stuff like that. And it also has a

[00:51:01](https://www.youtube.com/watch?v=0VELkydmwbo&t=3061s) change log of what's been updated. And

[00:51:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=3064s) so that's kind of how we display it to

[00:51:05](https://www.youtube.com/watch?v=0VELkydmwbo&t=3065s) humans. But the cool thing about these

[00:51:07](https://www.youtube.com/watch?v=0VELkydmwbo&t=3067s) agents is that it is honestly just

[00:51:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=3069s) really easy for them to keep multiple

[00:51:13](https://www.youtube.com/watch?v=0VELkydmwbo&t=3073s) places up to date. And so if you say

[00:51:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=3075s) something like, "Hey, I want to have a

[00:51:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=3077s) mirror of this on in KOD or in notion or

[00:51:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=3080s) in Google Docs, you can basically say, I

[00:51:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=3083s) have this markdown file. I want you to

[00:51:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=3085s) keep this one for the agents and make

[00:51:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=3087s) sure that it exactly matches what exists

[00:51:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=3090s) in the human readable version." You can

[00:51:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=3093s) also use that system to be able to say

[00:51:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=3095s) something like uh or include different

[00:51:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=3097s) like context or variables within the

[00:51:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=3099s) agent version that'll just help it

[00:51:41](https://www.youtube.com/watch?v=0VELkydmwbo&t=3101s) navigate a little bit better and then

[00:51:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=3103s) have a human readable mirror. But it's

[00:51:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=3105s) kind of up to you which tool you want to

[00:51:47](https://www.youtube.com/watch?v=0VELkydmwbo&t=3107s) build that into. The other I I've been

[00:51:49](https://www.youtube.com/watch?v=0VELkydmwbo&t=3109s) talking a lot about Zapier MCP, but the

[00:51:51](https://www.youtube.com/watch?v=0VELkydmwbo&t=3111s) other thing I really love about that

[00:51:53](https://www.youtube.com/watch?v=0VELkydmwbo&t=3113s) tool is that it very easily connects to

[00:51:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=3115s) those document tools. So, if you're

[00:51:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=3117s) using something um like a kod or a

[00:52:00](https://www.youtube.com/watch?v=0VELkydmwbo&t=3120s) notion or a Google docs, it can just

[00:52:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=3123s) instantly say like, cool, I'm gonna go

[00:52:05](https://www.youtube.com/watch?v=0VELkydmwbo&t=3125s) publish to that because I have a zap

[00:52:07](https://www.youtube.com/watch?v=0VELkydmwbo&t=3127s) action that can do it and I'm going to

[00:52:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=3128s) overwrite whatever's there currently or

[00:52:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=3130s) make updates to it and make sure that

[00:52:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=3132s) that mirrors. So, that's kind of how we

[00:52:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=3134s) solve it. Uh I'm not going to claim it's

[00:52:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=3136s) a perfect system, but that's what I

[00:52:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=3138s) would recommend is to build in those

[00:52:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=3139s) skills to the agent you're working with

[00:52:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=3141s) and have it do those updates.

[00:52:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=3143s) Yeah, Cal's asking, "Can normies adjust

[00:52:26](https://www.youtube.com/watch?v=0VELkydmwbo&t=3146s) to GitHub?" Joe, what do you think?

[00:52:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=3149s) >> Uh, I think so. Yeah, but also you don't

[00:52:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=3153s) have to, right? There's lots of other

[00:52:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=3155s) document hosting tools. You probably

[00:52:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=3157s) already have one. Um, and they also have

[00:52:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=3160s) these sort of like uh change log sorts

[00:52:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=3162s) of things that you can use. So, if it's

[00:52:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=3164s) not something you're comfortable with,

[00:52:46](https://www.youtube.com/watch?v=0VELkydmwbo&t=3166s) that's totally fine. But the other tip I

[00:52:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=3168s) always love to give is uh the thing that

[00:52:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=3170s) is really good at navigating tools like

[00:52:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=3172s) GitHub is your agents. And so they can

[00:52:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=3174s) just teach you. You can just be like,

[00:52:56](https://www.youtube.com/watch?v=0VELkydmwbo&t=3176s) "Hey, I don't know how this works. Can

[00:52:58](https://www.youtube.com/watch?v=0VELkydmwbo&t=3178s) you just like guide me through it?" And

[00:52:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=3179s) they will.

[00:53:00](https://www.youtube.com/watch?v=0VELkydmwbo&t=3180s) >> So that's the easiest way to learn.

[00:53:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=3183s) >> Totally. Yeah. And obviously MCP

[00:53:05](https://www.youtube.com/watch?v=0VELkydmwbo&t=3185s) connects these in multiple formats. So

[00:53:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=3188s) you can keep multiple versions or uh

[00:53:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=3192s) multiple formats all live at the same

[00:53:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=3195s) time synced with the right information.

[00:53:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=3198s) Um great. Well Joe, I think one thing

[00:53:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=3201s) that's really cool about what y'all have

[00:53:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=3203s) built is you have built the teams around

[00:53:26](https://www.youtube.com/watch?v=0VELkydmwbo&t=3206s) this as well. So like you said you are

[00:53:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=3208s) kind of the architect of this and I

[00:53:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=3210s) think a high level failsafe in many ways

[00:53:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=3213s) but you have also built there's the

[00:53:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=3215s) messaging council there are people tied

[00:53:38](https://www.youtube.com/watch?v=0VELkydmwbo&t=3218s) to different pieces of context that it's

[00:53:41](https://www.youtube.com/watch?v=0VELkydmwbo&t=3221s) kind of like their job to maintain

[00:53:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=3224s) update are responsible for um so we've

[00:53:47](https://www.youtube.com/watch?v=0VELkydmwbo&t=3227s) built a pretty robust system here for

[00:53:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=3230s) [snorts] folks where this is new like

[00:53:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=3232s) where do you suggest we start

[00:53:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=3234s) >> yeah I'll just kind of cruise through

[00:53:56](https://www.youtube.com/watch?v=0VELkydmwbo&t=3236s) Um, so if you're coming away from this

[00:53:58](https://www.youtube.com/watch?v=0VELkydmwbo&t=3238s) today and you feel excited about

[00:54:00](https://www.youtube.com/watch?v=0VELkydmwbo&t=3240s) building this sort of brain, that is

[00:54:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=3242s) awesome. How I would recommend starting

[00:54:05](https://www.youtube.com/watch?v=0VELkydmwbo&t=3245s) in the journey we've been through is

[00:54:07](https://www.youtube.com/watch?v=0VELkydmwbo&t=3247s) start pretty small. So pick one kind of

[00:54:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=3250s) canonical thing that you want to really

[00:54:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=3254s) make solid for your company. That could

[00:54:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=3256s) be personas, that could be your

[00:54:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=3257s) positioning, it could be even like a

[00:54:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=3260s) style guide for how you write emails,

[00:54:21](https://www.youtube.com/watch?v=0VELkydmwbo&t=3261s) something like that. And gather the

[00:54:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=3264s) stuff you have already. So go out and

[00:54:26](https://www.youtube.com/watch?v=0VELkydmwbo&t=3266s) find who's responsible for that today. I

[00:54:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=3269s) can guarantee that there are a bunch of

[00:54:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=3271s) people in your company who are doing

[00:54:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=3273s) like these ad hoc versions of it and

[00:54:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=3275s) just say like, "Hey, I'm working on

[00:54:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=3277s) this. I want to see what you're doing

[00:54:38](https://www.youtube.com/watch?v=0VELkydmwbo&t=3278s) too. I want to kind of consolidate

[00:54:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=3280s) these." The third part here would be

[00:54:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=3282s) naming an owner of that. So for this

[00:54:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=3284s) first one, it could be you. But for us,

[00:54:47](https://www.youtube.com/watch?v=0VELkydmwbo&t=3287s) uh, for example, we have our head of

[00:54:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=3288s) product marketing who owns our

[00:54:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=3290s) positioning. We have another marketer

[00:54:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=3292s) who owns personas. it's kind of their

[00:54:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=3294s) job to make sure that uh everything that

[00:54:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=3297s) makes it into these sources is true and

[00:55:01](https://www.youtube.com/watch?v=0VELkydmwbo&t=3301s) well sourced and useful. So they're kind

[00:55:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=3303s) of the human review layer on it. And

[00:55:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=3306s) then the other thing to go to next is to

[00:55:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=3308s) say let's pick one AI tool to make this

[00:55:11](https://www.youtube.com/watch?v=0VELkydmwbo&t=3311s) accessible or sorry one tool where we

[00:55:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=3314s) can make this accessible to everyone

[00:55:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=3316s) including our agents. Again, that could

[00:55:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=3318s) be notion, KOD, uh, GitHub, whatever.

[00:55:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=3322s) Just pick one place where you're

[00:55:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=3323s) actually going to invest in keeping that

[00:55:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=3325s) context. And then the final two things

[00:55:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=3327s) here, um, that review cadence we talked

[00:55:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=3329s) about. So, make sure you're actually

[00:55:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=3330s) talking to each other about what's going

[00:55:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=3333s) in here, that you all agree what's

[00:55:34](https://www.youtube.com/watch?v=0VELkydmwbo&t=3334s) happening there, and then expand that

[00:55:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=3337s) loop after you feel like you have a good

[00:55:39](https://www.youtube.com/watch?v=0VELkydmwbo&t=3339s) solid foundation. So, as you start to

[00:55:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=3342s) see this like running and keeping itself

[00:55:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=3343s) up to date, uh, expand it to more

[00:55:46](https://www.youtube.com/watch?v=0VELkydmwbo&t=3346s) personas, more messaging, whatever that

[00:55:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=3348s) looks like for you. [snorts]

[00:55:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=3350s) >> Love it. I think this is really really

[00:55:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=3352s) good advice. I'm curious. We'll we'll do

[00:55:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=3354s) this again in a couple months and see

[00:55:56](https://www.youtube.com/watch?v=0VELkydmwbo&t=3356s) what what uh progress we've made and

[00:55:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=3359s) then also um, you know, what advice you

[00:56:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=3362s) have. And I want to get into questions.

[00:56:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=3364s) There's one in the Q&A panel. We've been

[00:56:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=3366s) trying to answer them as we are going

[00:56:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=3368s) along here. But just a a couple things I

[00:56:11](https://www.youtube.com/watch?v=0VELkydmwbo&t=3371s) think one um if you're looking uh to do

[00:56:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=3374s) something next, we have a team of uh

[00:56:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=3378s) great strategists to kind of talk you

[00:56:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=3380s) through whether you want to build a a

[00:56:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=3382s) brain or you are looking for specific

[00:56:25](https://www.youtube.com/watch?v=0VELkydmwbo&t=3385s) workflows. Um, so I wanted to just push

[00:56:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=3387s) a couple links to folks if they're

[00:56:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=3389s) curious in taking the next step here um

[00:56:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=3392s) with with our team or any experts here

[00:56:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=3395s) at Zapier. Um, the other thing I want to

[00:56:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=3397s) call out is um for those that are

[00:56:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=3400s) actually running AI transformation

[00:56:42](https://www.youtube.com/watch?v=0VELkydmwbo&t=3402s) initiatives, we've got a private

[00:56:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=3404s) community um called the AI leaders lab.

[00:56:46](https://www.youtube.com/watch?v=0VELkydmwbo&t=3406s) This is a great place to talk with folks

[00:56:49](https://www.youtube.com/watch?v=0VELkydmwbo&t=3409s) like a Lindsay or like a Joe about some

[00:56:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=3412s) of these initiatives in ter in inside

[00:56:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=3414s) your company. We've got some great

[00:56:56](https://www.youtube.com/watch?v=0VELkydmwbo&t=3416s) events coming up. Um, namely Zap Connect

[00:56:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=3419s) is next month on the 23rd of September.

[00:57:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=3422s) A lot of topics like this will be

[00:57:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=3424s) covered all in one day. I think you

[00:57:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=3426s) could show up for, you know, one, two,

[00:57:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=3428s) three hours and walk away with a lot of

[00:57:11](https://www.youtube.com/watch?v=0VELkydmwbo&t=3431s) great takeaways. Um, hopefully just like

[00:57:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=3434s) you did today. Um, we have three minutes

[00:57:17](https://www.youtube.com/watch?v=0VELkydmwbo&t=3437s) left. We should uh go through I have one

[00:57:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=3440s) question in the Q&A here. Um

[00:57:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=3444s) and I think it's a it's a higher level

[00:57:26](https://www.youtube.com/watch?v=0VELkydmwbo&t=3446s) governance question because obviously

[00:57:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=3447s) Joe you published uh this to Verscell as

[00:57:31](https://www.youtube.com/watch?v=0VELkydmwbo&t=3451s) one example but Mike here is asking um

[00:57:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=3455s) you know what is the process for

[00:57:36](https://www.youtube.com/watch?v=0VELkydmwbo&t=3456s) securing an artifact like that to avoid

[00:57:38](https://www.youtube.com/watch?v=0VELkydmwbo&t=3458s) them being found by AI tools and and

[00:57:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=3460s) search engines.

[00:57:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=3463s) >> Okay, there's a couple ways I could take

[00:57:45](https://www.youtube.com/watch?v=0VELkydmwbo&t=3465s) this question and Mike correct me in the

[00:57:48](https://www.youtube.com/watch?v=0VELkydmwbo&t=3468s) chat if I'm answering it the wrong way.

[00:57:51](https://www.youtube.com/watch?v=0VELkydmwbo&t=3471s) Um basically we have this AI lab hosted

[00:57:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=3475s) on an internal tool. Uh it's hosted

[00:57:58](https://www.youtube.com/watch?v=0VELkydmwbo&t=3478s) through Verscell and it is something

[00:58:00](https://www.youtube.com/watch?v=0VELkydmwbo&t=3480s) that requires a Zap year login to view.

[00:58:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=3482s) So it's not something that can be picked

[00:58:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=3484s) up by external AI tools or external

[00:58:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=3486s) search engines. It is something that

[00:58:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=3488s) requires SSO login to actually see it.

[00:58:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=3492s) So you need to zap your email address.

[00:58:14](https://www.youtube.com/watch?v=0VELkydmwbo&t=3494s) And then the other uh way that we could

[00:58:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=3496s) take this question is basically like uh

[00:58:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=3498s) there's we talked about there's so much

[00:58:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=3500s) context out there and so much stuff that

[00:58:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=3502s) people are doing. How do you make sure

[00:58:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=3503s) to steer these AI tools and uh internal

[00:58:26](https://www.youtube.com/watch?v=0VELkydmwbo&t=3506s) search towards the right stuff? Uh we've

[00:58:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=3509s) seen that problem very much, right? Like

[00:58:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=3510s) we use tools like glean, we have

[00:58:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=3512s) different AI tools like cloud and chatpt

[00:58:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=3515s) that can kind of go fetch themselves

[00:58:37](https://www.youtube.com/watch?v=0VELkydmwbo&t=3517s) themselves. How we've ended up um

[00:58:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=3520s) managing for that is we have specific

[00:58:43](https://www.youtube.com/watch?v=0VELkydmwbo&t=3523s) skills that we build out for these

[00:58:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=3524s) agents that just show things like um

[00:58:49](https://www.youtube.com/watch?v=0VELkydmwbo&t=3529s) uh a list of the canonical context and

[00:58:51](https://www.youtube.com/watch?v=0VELkydmwbo&t=3531s) it says hey you should be able to um go

[00:58:55](https://www.youtube.com/watch?v=0VELkydmwbo&t=3535s) find this specific stuff and here's

[00:58:57](https://www.youtube.com/watch?v=0VELkydmwbo&t=3537s) where it lives. So we have kind of a

[00:58:59](https://www.youtube.com/watch?v=0VELkydmwbo&t=3539s) manifest of the different things that we

[00:59:01](https://www.youtube.com/watch?v=0VELkydmwbo&t=3541s) consider to be the gold star stuff and

[00:59:03](https://www.youtube.com/watch?v=0VELkydmwbo&t=3543s) the things that these agents and people

[00:59:05](https://www.youtube.com/watch?v=0VELkydmwbo&t=3545s) should be using and that's how we've

[00:59:07](https://www.youtube.com/watch?v=0VELkydmwbo&t=3547s) managed for how do you get the best

[00:59:09](https://www.youtube.com/watch?v=0VELkydmwbo&t=3549s) stuff to the top of the list. So uh

[00:59:12](https://www.youtube.com/watch?v=0VELkydmwbo&t=3552s) hopefully that answers the question Mike

[00:59:13](https://www.youtube.com/watch?v=0VELkydmwbo&t=3553s) let me know if that is not right.

[00:59:18](https://www.youtube.com/watch?v=0VELkydmwbo&t=3558s) >> Beautiful. Um Joe I'm I'm curious uh do

[00:59:22](https://www.youtube.com/watch?v=0VELkydmwbo&t=3562s) you recommend rag integration with

[00:59:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=3564s) something like this?

[00:59:28](https://www.youtube.com/watch?v=0VELkydmwbo&t=3568s) Uh,

[00:59:30](https://www.youtube.com/watch?v=0VELkydmwbo&t=3570s) I have not thought about that at all to

[00:59:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=3572s) be honest. So,

[00:59:33](https://www.youtube.com/watch?v=0VELkydmwbo&t=3573s) >> I think that's that's a great example,

[00:59:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=3575s) Joe, of where, like I said, Joe, you're

[00:59:38](https://www.youtube.com/watch?v=0VELkydmwbo&t=3578s) not an engineer, but the world you

[00:59:40](https://www.youtube.com/watch?v=0VELkydmwbo&t=3580s) created um is

[00:59:44](https://www.youtube.com/watch?v=0VELkydmwbo&t=3584s) very very useful and there are different

[00:59:46](https://www.youtube.com/watch?v=0VELkydmwbo&t=3586s) ways to to build, but I think that's a a

[00:59:49](https://www.youtube.com/watch?v=0VELkydmwbo&t=3589s) good insight into that.

[00:59:50](https://www.youtube.com/watch?v=0VELkydmwbo&t=3590s) >> Yep.

[00:59:52](https://www.youtube.com/watch?v=0VELkydmwbo&t=3592s) >> Nice. Well, we're just at the top of the

[00:59:54](https://www.youtube.com/watch?v=0VELkydmwbo&t=3594s) hour. Um, just want to thank everyone

[00:59:56](https://www.youtube.com/watch?v=0VELkydmwbo&t=3596s) for for joining us today. This is this

[00:59:58](https://www.youtube.com/watch?v=0VELkydmwbo&t=3598s) is really fun. I I loved our

[01:00:00](https://www.youtube.com/watch?v=0VELkydmwbo&t=3600s) conversation, Joe and Lindsay. Anything

[01:00:02](https://www.youtube.com/watch?v=0VELkydmwbo&t=3602s) you want to add you want folks to

[01:00:04](https://www.youtube.com/watch?v=0VELkydmwbo&t=3604s) remember before we break.

[01:00:06](https://www.youtube.com/watch?v=0VELkydmwbo&t=3606s) >> Do come to Zap Connect. Zap Connect is

[01:00:08](https://www.youtube.com/watch?v=0VELkydmwbo&t=3608s) al always a lot of fun. It's free.

[01:00:10](https://www.youtube.com/watch?v=0VELkydmwbo&t=3610s) >> It's a great day

[01:00:11](https://www.youtube.com/watch?v=0VELkydmwbo&t=3611s) >> and you'll learn a lot about this stuff.

[01:00:13](https://www.youtube.com/watch?v=0VELkydmwbo&t=3613s) And you can stay home, right? You can

[01:00:15](https://www.youtube.com/watch?v=0VELkydmwbo&t=3615s) just eat lunch and watch these cool

[01:00:16](https://www.youtube.com/watch?v=0VELkydmwbo&t=3616s) things. So,

[01:00:19](https://www.youtube.com/watch?v=0VELkydmwbo&t=3619s) >> Lindsay,

[01:00:20](https://www.youtube.com/watch?v=0VELkydmwbo&t=3620s) >> I'm just happy to be here. It's amazing.

[01:00:23](https://www.youtube.com/watch?v=0VELkydmwbo&t=3623s) I always learn stuff from the chat and

[01:00:24](https://www.youtube.com/watch?v=0VELkydmwbo&t=3624s) from everyone. So, thank you all.

[01:00:27](https://www.youtube.com/watch?v=0VELkydmwbo&t=3627s) >> Um, so great. Well, thanks everybody. We

[01:00:29](https://www.youtube.com/watch?v=0VELkydmwbo&t=3629s) will see you next time and uh appreciate

[01:00:32](https://www.youtube.com/watch?v=0VELkydmwbo&t=3632s) you taking the time today. All righty.

[01:00:35](https://www.youtube.com/watch?v=0VELkydmwbo&t=3635s) Thanks everybody.
