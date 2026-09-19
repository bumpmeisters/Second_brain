### From Karpathy's LLM Wiki to Brian Halligan's digital twin, how the smartest people in tech are building AI systems that think, remember, and act on their behalf.

When Andrej Karpathy posted about building an “ [LLM Wiki](https://x.com/karpathy/status/2039805659525644595) ” in April and garnered **==19.6 million views==**, he started a trend: an army of geeks building their own “AI brains.”

I’m one of them. So is Brian Halligan, the former CEO of HubSpot and now partner at Sequoia, who revealed he’d built an AI agent trained on his entire life that now attends his Zoom meetings. He calls it ‘ [Hal](https://x.com/bhalligan/status/2069857238500741310) ’. Tiago Forte, the person who coined “ [Building a Second Brain](https://www.buildingasecondbrain.com/),” took his original system, which relied on you doing all the organizing, and handed that job to AI agents. Salesforce’s President of Enterprise AI revealed he dumps stream-of-consciousness thoughts into a private Slack channel so AI can reason across months of his thinking. Jason Lemkin built an AI version of himself at SaaStr that his team can talk to any time, trained on decades of SaaS knowledge. And, of course, I have also gone all in on my “ [AI brain](https://www.kieranflanagan.io/p/i-built-an-ai-second-brain-its-made) ”.

Something is happening. The smartest people in tech are racing to build personal AI systems that know everything they know, remember everything they forget, and, in some cases, act on their behalf. They’re calling them “AI Second Brains,” “AI Agents,” “Digital Twins.” What are they? They give AI the full context of who you are, how you think, and what you’ve learned, then let it compound that knowledge over time.

For those following me, you know I’ve been building my own for the past three months using Claude Code, Obsidian and Git. It’s made me a dramatically better leader, with faster and higher-quality decisions on things that used to take me days to think through.

This post covers why people are building these systems, where the concept is heading, and five examples from people who are actually doing it.

## Why Now?

The idea of a “second brain” isn’t new. Tiago Forte popularised the concept with his book *Building a Second Brain*, which sold over 500,000 copies and taught people a methodology for capturing, organising, and retrieving their notes and ideas. Before that, people tried wikis, Evernote, Notion databases, Zettelkasten systems, and a dozen other approaches to managing what they know.

They all had the same fatal flaw: you had to maintain them. And nobody does. Not really. Not for long enough for it to matter. Everyone’s ‘file’ system will eventually decay.

In the 1980s, Ray Dalio started writing down every decision he made at Bridgewater Associates and the reasoning behind it. Over decades, this became his “Principles” system: a codified repository of how he thinks, what he values, and what he’s learned from every mistake. New employees studied it. Decisions were cross-referenced against it. It became Bridgewater’s institutional memory.

It worked. It also required decades of manual effort and a team to maintain. Dalio could sustain it because he ran a $150 billion fund and had the discipline and resources to keep the system alive.

What’s changed is that AI removes the maintenance. The AI reads, writes, organizes, links, and retrieves. You just talk to it. Context windows got big enough, agents got capable enough, and tools like Claude Code made it possible to point an LLM at a folder and ask it to enrich the folder with data from across a wide spectrum of sources.

But it’s not just about remembering things. The real pull is compounding. The more you feed the system, the smarter it gets. Connections form that you’d never draw yourself. An idea from February resurfaces in June because the AI spotted the link. People who build these systems all describe the same feeling: *it’s like having a version of yourself that never forgets*. Even better, it’s a place to keep all the intelligence you gain through years of work. What worked, what didn’t, why certain decisions were made, why that big bet turned out to be so successful.

As Joe Inzerillo, Salesforce’s President of Enterprise and AI Technology, put it: “Human intellect is amazing, but our memory is very flawed. Reasoning across huge volumes of data is something LLMs just don’t break a sweat with.”

![](https://substackcdn.com/image/fetch/$s_!brmA!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F2e6ffe5e-827d-4eba-a47f-a59ce17a0986_3600x1840.png)

## The Architecture Question Nobody Has Solved Yet

Here’s the honest tension: if you have a personal brain, a team brain, and a company brain, how do they actually connect? This is one of the harder problems to solve.

Today, I have a ‘work brain’ for HubSpot and a ‘personal brain’ for Kieran. It means I have to switch between two brains; they don’t share any knowledge; it’s inefficient. I’m in the process of building our first team brain at HubSpot, and the company brain at the moment is in Glean. The question is how you bring all these together in a much smarter way.

The emerging pattern looks like layers with permissions rather than three separate systems. And for good reason. If you split into three separate brains, you lose the compounding benefit. A personal insight that’s useful for the team never surfaces. A company decision that should change your personal priorities stays siloed.

Think of when I’m doing advisory or helping a founder. I’ll start the call by connecting Claude Code or Codex to my brain, so instead of having to remember every relevant piece of work I’ve done to bring up during the conversation, my brain can do it. But maybe there is something we learned in HubSpot, relevant to our conversation, and I can package up in a best-practice way without disclosing any proprietary info; I’d want to do that. Today, it’s hard; I’d need to switch between brains.

The model forming is a knowledge layer with scopes. Your personal context is private by default. Team context is shared within your team. Company context is available to everyone. You choose what crosses boundaries.

The analogy is how we already handle documents. You have private files, shared team drives, and company-wide resources. Same data architecture, applied to AI memory.

But there’s a real constraint. Your company’s proprietary customer data shouldn’t live in the same unscoped system as your personal career notes. Regulated industries have compliance requirements. Even in a startup, there are things the CEO’s second brain knows that shouldn’t flow freely to every team member’s agent.

Nobody has fully solved this. But I think it’s a fascinating problem to consider. Today, I’d mostly focus on how you can build a solo brain that can ingest all your intelligence in a smart way, continually enrich itself, and be plug-and-play with your AI model of choice.

![](https://substackcdn.com/image/fetch/$s_!xqNu!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fe66c770a-4561-461e-8ea8-65f101706c82_3600x1840.png)

## Five People Building Their AI Second Brain Right Now

This isn’t theoretical. Here are five examples of well-known tech thought leaders building these systems today, each with a different approach. I’ve ordered them from the most passive (a knowledge system the AI maintains) to the most active (a digital twin that acts on your behalf).

**Andrej Karpathy — The LLM Wiki**

Former Director of AI at Tesla and co-founder of OpenAI. One of the most respected AI researchers alive.

Karpathy built what he calls an “LLM Wiki.” You drop raw sources (articles, papers, book notes, podcast takeaways) into a folder. The LLM reads everything, writes summary pages, creates entity and concept pages, cross-references everything, and resolves contradictions. His vault reached roughly 100 articles and 400,000 words, all written and maintained by the agent. He rarely edits the wiki manually. That’s the domain of the LLM.

His framing is the cleanest articulation of the concept I’ve seen: “Obsidian is the IDE. The LLM is the programmer. The wiki is the codebase.”

This was the post that kicked off the AI brain craze.

Source: [X post, April 2026](https://x.com/karpathy/status/2039805659525644595) (19.6M views, 55K likes)

**Tiago Forte — The AI Second Brain**

Author of *Building a Second Brain* (500,000 copies sold), creator of the PARA method. The person who coined the “second brain” concept for knowledge work.

Forte rebuilt the entire concept for AI. His system centres on what he calls Personal Context Management: a Master Prompt that gives AI your full personal context, an AI-adapted PARA structure that feeds the right information on demand, an “AI Board of Advisors” (multiple agent perspectives for decision-making), and long-term memory with sub-agents.

His thesis is: “The bottleneck isn’t the AI model. It’s what the model knows about you before you ask.”

Source: [Forte Labs blog](https://fortelabs.com/blog/introducing-the-ai-second-brain/) + [cohort program, April-May 2026](https://www.buildingasecondbrain.com/ai-second-brain)

**Joe Inzerillo — The Salesforce Second Brain**

President of Enterprise & AI Technology at Salesforce, leading Agentforce, Slack, and the company’s “Customer Zero” strategy.

Inzerillo’s approach is surprisingly simple for someone running AI at a Fortune 500 company. He uses a private Slack channel as a stream-of-consciousness feed: wakes up at 2am with an idea, dumps it into the channel, and Slackbot synthesises it with months of prior context. He connected his personal email to Claude. No Obsidian vault, no custom code. Just a Slack channel and an LLM that reasons across everything he’s ever put into it.

At Salesforce, the institutional version is running too. His team compressed a 231-day migration into 13 days using AI agents. His recommended first step for anyone: “Connect your email to an LLM. Do it in a safe way. Just go to town.”

Source: [YouTube interview with Allie K Miller, June 2026](https://www.youtube.com/watch?v=QbtBHh7sr0A)

**Jason Lemkin — The SaaStr AI Mentor**

Founder of SaaStr, one of the largest SaaS communities in the world.

Lemkin took the concept from personal to institutional. He built an AI variant at SaaStr that his team can talk to any time. It stores daily summaries to memory, creating a compounding knowledge layer. Think of it as decades of SaaS knowledge made queryable for his entire team and community, not just the things Lemkin remembers to mention.

His version sits in the “team brain” category: institutional knowledge that doesn’t depend on one person’s memory or availability.

Source: [X reply to Halligan, June 2026](https://x.com/jasonlk/status/2069907284319502506) + [saastr.ai/ai-mentor](https://saastr.ai/ai-mentor)

**Brian Halligan — “Hal,” The Digital Twin**

Co-founder and former CEO of HubSpot.

Halligan represents the furthest end of the spectrum. He built an AI agent named “Hal,” trained on his entire life. Hal runs his day, sends emails, organizes projects, collaborates with his team, and now participates in his Zoom meetings. This isn’t a knowledge wiki. It’s a digital twin that acts as him.

“He’s not just a copilot anymore. He is me.”

This is Brian’s setup (it’s dope and has given me a tonne of inspiration for V2 of mine.

![](https://substackcdn.com/image/fetch/$s_!APci!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F10f57753-b8b8-4c70-a5dd-4e9bf30d46f8_630x305.jpeg)

Halligan’s next step: Hal handling meetings and working independently. Moving from copilot to full autopilot.

Source: [X post, June 2026](https://x.com/bhalligan/status/2069857238500741310)

And, a little plug for my upcoming V2 to be published here first:)

**Kieran Flanagan — The Marketing Leader’s AI Brain**

SVP of Agentic GTM and Systems at HubSpot. (but really still a marketer and growth person lol)

I’ve been building my own AI second brain for the past three months using Claude Code, Obsidian and Git. One is a system of MCP tools that manages my content strategy, researches topics, drafts posts, tracks what’s working, and remembers every decision I’ve made about my audience, my voice, and my priorities. It runs on markdown files, custom skills I’ve built over time, and a growing vault of context that makes every conversation with AI dramatically more useful than the last. The other is my “HubSpot” brain, that captures all relevant context across my work, sets my priorities, helps solves hard problems, ensures I never miss a single piece of important data.

It’s made me a 10x better leader because it holds the full context of my work, so I never start from zero. Every session picks up where the last one left off.

I’m currently working on v2 of both (potentially merging them).

Source: [I Built an AI Second Brain](https://www.kieranflanagan.io/p/i-built-an-ai-second-brain-its-made)

---

## Where is this going?

The argument is this might be a trend for AI geeks and developers only.

Look at the range of examples I gave. Brian Halligan isn’t a developer. He’s an ex-CEO. Inzerillo uses a private Slack channel and connected email. Forte built a system around master prompts and organised folders. The spectrum runs from “point Claude Code at a folder” to “just connect your email to an LLM.” The entry point is lower than it looks from the outside. And the tools are moving toward the user, not the other way around. Claude’s Cowork mode, Notion AI, Slack’s native AI layer, connecting to Git: these are getting simpler every quarter, not more complex.

The people building these systems now are creating an asset that compounds daily. Every conversation, every meeting, every decision feeds the system and makes it smarter. Everyone else is starting from zero every time they open a new chat window.

The gap between those two groups widens every week.

Until Next Time,

Happy AI’fying,

Kieran