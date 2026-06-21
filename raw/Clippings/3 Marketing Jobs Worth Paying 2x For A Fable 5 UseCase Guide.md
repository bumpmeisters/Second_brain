The model releases just keep coming. All our feeds are awash with hype videos for Fable 5, anthropic’s latest model. And that hype is justified. The model does, from the small amount I’ve read and tested, seem incredible.

However, Fable 5 does deserve a different conversation. It’s a new class of model - the first Mythos-class model Anthropic has released to the public.

It’s expensive. There are some use cases where it’s likely worth the 2x premium over Opus, and many jobs where it’s not.

I’ve had less time than expected to play with Fable 5, as I had some unexpected time sucks this week. But I want to do a short post to highlight some marketing use cases where Fable 5 performs better than other models, and explain why.

## Do marketers need Fable 5?

I believe the current set of models can cover the bulk of marketing use cases. I think what’s not solved is the UX, workflows, and the integration of AI more seamlessly into how people work.

Opus 4.8 and GPT-5.5 can already handle the bulk of a marketer’s daily AI work. Drafting emails, writing content, brainstorming campaign angles, rewriting landing page copy, generating ad variants, summarising meeting notes, and building email sequences. Most marketing tasks don’t require huge context windows or multi-agent orchestration. In fact, I’d argue the newer models haven’t improved much on general marketing tasks over a couple of cycles. I still don’t believe AI is incredible at creative tasks, which is where marketers spend the majority of their time.

Fable 5 is actually worse for some of those use cases. Its writing is dense, over-detailed, written for engineers, not a copywriter. It’s not the model you’ll start using for your latest blog post.

It’s also slow and expensive. $10 per million input tokens, $50 per million output. It burns through tokens at roughly 2x the rate of Opus, even on similar tasks. Using it to rewrite a subject line is taking a bazooka to a water gun fight.

There is a simple way to think about this: if you’re sitting in the loop, going back and forth with the model, editing as you go, use Opus. It’s faster, cheaper, and writes better prose. Fable 5 is for large multi-step tasks where you set a clear outcome and just let it run.

## When should you use Fable 5?

So what is Fable actually good at?

Three things, and they all share the same shape: big input, autonomous execution, finished output.

**It holds massive context and synthesises across it.** Fable has a 1 million token context window and, more importantly, it actually reasons well across that full window. You can feed it thousands of survey responses, dozens of documents, and an entire website, and it will find patterns across all of them. Opus can handle pieces of this. Fable holds the full picture at once.

**It chains multi-step work without you having to babysit each step.** This is the real shift. Previous models needed you in the loop, do this, now do this, now do this. Fable takes a goal and works toward it autonomously, planning its own steps, checking its own work, looping until the job is done. One example is a user pointed Fable at a GitHub backlog and told it to close irrelevant issues and write fixes for the rest. It just went through the entire list and produced mergeable code. Fable is truly an outcome-driven model.

**It builds complete, working things end to end. A vibe coder’s dream.** It seems incredibly powerful and builds working things in one shot. Finished, functional tools, calculators, dashboards, interactive experiences, full applications. A user described a complex multi-feature productivity app in a single prompt and got back a working product with zero bugs. Another built an entire 3D game from one prompt in 3-4 hours of autonomous work. Yes, the model worked for 3-4 hours with no human input needed.

The way to think about when to use it: if the job would take a smart person half a day of focused work across multiple sources, and the output is something more complex than a Google Doc, that’s a Fable job.

Here are three marketing jobs that highlight use cases worthy of Fable 5’s power

---

**1\. Customer & Competitive data to positioning insight:**

This works great for Fable as it’s gathering a lot of context, doing multi-step tasks, and working towards an outcome.

In the world of AI, positioning is more important than ever. It’s so much harder to stand out and differentiate your company.

It runs four phases, after one setup step where it loads your internal data: real sales calls and chat logs.

Phase 1 is competitor context. It pulls every competitor’s homepage, pricing page and their “vs you” attack page, plus what G2 reviewers praise and punish them for. Verbatim quotes only, links required.

Phase 2 is the internal context. It audits your own site the same way, then mines your customer conversations for objections, competitor triggers, and the exact words buyers use. Their vocabulary, not yours. If you don’t have all of this data, just ask it to create synthetic data to use so you can see how the prompt works. You can do this easily by asking to research your brand, reviews, and ideal customer profile to fake these interactions. Not perfect, but enough to test.

Phase 3 is the red-team loop. The AI drafts positioning principles, then attacks its own work: Does it contradict our own reviews? Anything that fails gets killed, and the kills stay visible. I have a red-team skill for my [AI-second brain](https://www.kieranflanagan.io/p/i-built-an-ai-second-brain-its-made), which works incredibly well.

Phase 4 is the framework. Positioning statement, three message pillars with proof, rewritten homepage copy, objection scripts for sales, and a flag list of problems that need a business decision, not better copy.

[Here is the prompt](https://drive.google.com/file/d/1AWk3OxHihcTt8LpHIZ0C0yfsogsndCVb/view?usp=sharing) because it’s big

The output is good you can see the [artifact here](https://claude.ai/public/artifacts/56391e52-2438-43b1-83d9-f0da94632e91), this is just first draft, I haven’t iterated (because of the time sucks).

![](https://substackcdn.com/image/fetch/$s_!YB-1!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ff31addef-5403-4d5b-909d-a4983b3aef81_1046x685.png)

**2\. An entire website audit with a single prompt:**

This one is so simple, but yet so powerful. Fable 5 can reason across large context windows. That means you can do things like ask it to audit your entire website and look for issues with your copy, positioning and overarching web experience.

The prompt for this is a little more simple, you could certainly make this much better with a few iterations. The purpose here is to illustrate what a great use case this would be for Fable 5.

> I want you to audit my entire marketing website for messaging consistency.
> 
> Start by crawling every page on \[yoursite.com\] — homepage, pricing, product pages, case studies, about page, careers, and any other public pages you find.
> 
> For each page, extract:
> 
> \- The main headline and sub-headline
> 
> \- The core value proposition being communicated
> 
> \- The target audience the page seems to speak to
> 
> \- All CTAs (buttons, links, forms) and what they promise
> 
> Then compare across all pages and flag:
> 
> 1\. Where the value proposition changes wording or emphasis between pages (e.g. homepage says “save time” but pricing page says “reduce cost”)
> 
> 2\. Where the target audience seems to shift (e.g. one page speaks to founders, another to enterprise teams)
> 
> 3\. Where CTAs don’t match the page intent (e.g. a case study page with a “start free trial” button instead of “see more stories”)
> 
> 4\. Any claims on one page that contradict claims on another
> 
> Output a single markdown report with:
> 
> \- A top-level summary of the biggest messaging gaps (3-5 bullets max)
> 
> \- A page-by-page breakdown with specific quotes and specific fix recommendations
> 
> \- A priority list of what to fix first based on likely traffic and conversion impact
> 
> Be specific. Quote the actual text you found. Don’t be vague.

The results were incredibly helpful, you can see the full artifact [here](https://claude.ai/public/artifacts/0dca35f0-d5fc-4f48-8c36-9e78225a403e).

![](https://substackcdn.com/image/fetch/$s_!jCre!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F157d0c34-9a8f-4d19-8ce5-2893131daed3_978x618.png)

This is for illustration purposes, it only ran throw a subset of HubSpot’s website, the main pages. But, you can ask it to audit incredibly large websites and provide an incredibly rich overview of what improvements you need to make.

**3\. Vibe Coding on steroids:**

Lastly, there isn’t a prompt to share here and i’m honestly still a little early with testing it to build things because I lost a bunch of time unexpectedly this week.

But, I’ve spoken to a bunch of people who’ve been deep working with Fable 5 this week and the end to end ability of it to code is amazing. Fable 5 is able to build complete, interactive, end to end apps in one or a couple of prompts. It’s much better at handling complex logic, UI, interactions, self-fixing, and deployment-ready code autonomously

Here are some of the best ideas I’ve seen and an example of something you could try build with Fable 5 that I believe would be a great way to engage your customers.

Some of the best examples of this:

1\. Riley Brown (@rileybrown) built Rilable — an iOS app that lets you describe an idea and instantly generates full web + iOS apps in sandboxes (Lovable-style). It uses Convex for DB, Vercel AI gateway, and even handles AI-powered features. Built in ~10 prompts (~$210 tokens). He also cloned Lovable itself in just 2 prompts with extra features. Just to reiterate that, he cloned Lovable. Another example that marketing is all that really matters:)

[

![X avatar for @rileybrown](https://substackcdn.com/image/fetch/$s_!mlO8!,w_40,h_40,c_fill,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fpbs.substack.com%2Fprofile_images%2F1898571530956873728%2FJALEVTSb.jpg)

Riley Brown@rileybrown

Today i'm Open Sourcing "Rilable" The iOS app that builds Web apps and iOS Apps. I built it with Fable 5 in 10 prompts. (~ $210 in tokens on API pricing) All apps are built with Claude Models, and every app spins up a sandbox (Exactly like Lovable) using @daytonaio. Database

<video controls="" src="https://video.twimg.com/amplify_video/2064927609977176064/vid/avc1/1112x720/ToCJ2abiV2iyJbwb.mp4"></video>

6:42 AM · Jun 11, 2026 · 61.4K Views

---

49 Replies · 36 Reposts · 529 Likes

](https://x.com/rileybrown/status/2064931283403178354)

2\. Chris ([@ChrissGPT](https://x.com/ChrissGPT)) one-shot a stunning explorable 3D starship in Three.js. Features: working cockpit, crew quarters, planet views through windows, dynamic lighting, sleep/eat interactions, all self-optimizing to 60fps in-browser. We are moving towards a world where you’ll have 1:1 media, games, movies, music created just for you. This shows off complex interactive 3D coding, autonomous refinement, and performance tuning without manual fixes.

[

![X avatar for @ChrissGPT](https://substackcdn.com/image/fetch/$s_!ezX3!,w_40,h_40,c_fill,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fpbs.substack.com%2Fprofile_images%2F2046736394152812544%2FLfmDgg0I.jpg)

Chris@ChrissGPT

Claude 5 Fable (Ultracode) I asked it to build a demo of my dream game in Three.js and I'm genuinely shocked 💀 One shot, a full explorable starship with a working cockpit, crew quarters, a planet drifting past real windows, dynamic lighting, sleep/eat interactions, it

<video controls="" src="https://video.twimg.com/amplify_video/2065192978612715521/vid/avc1/1324x720/lDBAMtDiuZIqGacF.mp4"></video>

12:03 AM · Jun 12, 2026 · 118K Views

---

155 Replies · 93 Reposts · 1.61K Likes

](https://x.com/ChrissGPT/status/2065193150222663959)

3\. Maji Ammanath ([@majiammanath)](https://x.com/majiammanath) created a Call Copilot, it transcribes live calls and delivers real-time AI nudges/suggestions based on conversation context. Now extending to a browser version. This shows off real-time audio processing, context-aware agents, and practical productivity tools.

[

![X avatar for @majiammanath](https://substackcdn.com/image/fetch/$s_!tkoe!,w_40,h_40,c_fill,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fpbs.substack.com%2Fprofile_images%2F1080837307190505473%2FsjISVdbJ.jpg)

Maji Ammanath@majiammanath

Built this Call Copilot using Fable 5. The copilot will transcribe your calls and based on the conversation will give you real time nudges. Now building a browser extension for the same. Incredible. #Claude #Fable5

<video controls="" src="https://video.twimg.com/amplify_video/2065359395962437632/vid/avc1/1282x720/n3gqn_8Q6zJzxdUu.mp4?tag=14"></video>

11:04 AM · Jun 12, 2026 · 26 Views

](https://x.com/majiammanath/status/2065359700389158957)

Ok, here is my much more feeble example lol. It’s not to show off the power of Fable 5, more an idea of an app to build with it. You could easily create a version of Spotify Wrapped for your customer base to show how they engaged with your product and provide recommendations on how to get more from it. [MVP here](https://claude.ai/public/artifacts/252a9d8a-7e11-4352-884b-075a8c48207d).

Admittedly, this isn’t my best idea, I do blame writing this work at 1am. I will be back with proper examples illustrating point 3 (end to end apps) next week. In particular, I’m excited to plug my [AI second brain](https://www.kieranflanagan.io/p/i-built-an-ai-second-brain-its-made) into this model given that is a great example of reasoning across a huge amount of context.

---

## A new skill to learn?

Most of the Fable 5 coverage you’ll read this week is about the model. Benchmarks, pricing, comparisons. All important. But, one thing that is really going to matter for people is - model selection is a new skill to learn.

Six months ago, you picked one model and used it for everything. That was fine because the differences between them were marginal. Now the differences are structural. Fable thinks differently from Opus. It’s better at different jobs. It costs different amounts. Using Fable for your content is not only a waste of money, it’s not very good. Using Opus for a full-site messaging audit is good, but Fable is much better if this is a priority task for you, and you’re willing to pay the extra money.

The marketers who get the most from AI over the next year won’t be the ones using the most powerful model. They’ll be the ones who match the right model to the right job, instinctively, without thinking about it. Opus for the drafting. Fable for the heavy lifting. Sonnet for the quick stuff that doesn’t need either.

That’s an entirely new skill to learn.

Fable 5 is included in your Claude subscription until June 22nd. After that, it moves to usage-based pricing, you pay per token through the API, so it’s going to get real expensive. This is the first time a frontier lab has released a model that isn’t included in the subscription long-term.

If you’ve been meaning to test any of the prompts in this post, the next ten days are free. After that, you’re paying $50 per million output tokens. Run the website audit. Feed it your customer data. Build the thing you’ve been putting off. Figure out whether Fable is worth the premium for your specific work, while it costs you nothing to find out.

---

Until Next Time,

Happy AI’fying

Kieran