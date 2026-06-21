*Alex Strick van Linschoten, founding AI/ML engineer at ZenML, joined the [Vanishing Gradients podcast](https://hugobowne.substack.com/p/episode-70-1400-production-ai-deployments) from the Netherlands to discuss the rapid evolution of the [LLMOps Database](https://www.zenml.io/llmops-database), the most comprehensive collection of **production AI case studies** available.*

In episode 70, I spoke with Alex Strick van Linschoten about the LLMOps Database he is curating at ZenML. This was our third conversation in a series tracking the explosive growth of production AI. The LLMOps Database is growing exponentially, **doubling every six months** in deployments:

- **~1 year ago,** the database contained **400 deployments**.
- **~6 months ago,** it had grown to **750**.
- **Today,** it exceeds **1,400** deployments.

[In my second episode](https://hugobowne.substack.com/p/episode-61-the-ai-agent-reliability-2a3) with Alex (ep 61), the discussion centered on the “agent reliability cliff” and managing the risk of autonomous failures. At that time, successful teams navigated limitations by **deploying internally** first, maintaining strict **human-in-the-loop protocols**, and tightly coupling LLMs with **business logic**.

Since then, **step-function improvements** in model performance, specifically Opus 4.5 and Gemini 3, have fundamentally altered the landscape (now we have Opus 4.6 and Gemini 3.1!).

We wrote this article for those who want to know more about this topic and don’t have 80 minutes to listen to the podcast. It captures some of our favourite parts of the conversation:

- Why the most successful teams are **ripping out and rebuilding their agent systems every few weeks** as models improve, and why over-engineering now creates technical debt you can’t afford later;
- The **$50,000 infinite loop disaster** and why “silent failures” are the biggest risk in production: agents confidently report success while spiraling into expensive mistakes;
- How **Elyos AI built emergency voice agents** with sub-400ms response times by aggressively throwing away context every few seconds, and why these extreme patterns are becoming standard practice;
- Why **DoorDash uses a three-tier agent architecture** (manager, progress tracker, and specialists) with a persistent workspace that lets agents collaborate across hours or days;
- Why simple **text files and markdown** are emerging as the best “continual learning” layer: human-readable memory that persists across sessions without fine-tuning models;
- The **100-to-1 problem**: for every useful output, tool-calling agents generate 100 tokens of noise, and the three tactics (reduce, offload, isolate) teams use to manage it;
- Why companies are choosing **Gemini Flash for document processing and Opus for long reasoning chains**, and how to match models to your actual usage patterns;
- The **debate over vector databases versus simple grep and cat**, and why giving agents standard command-line tools often beats complex APIs;
- What **“re-architect” as a job title** reveals about the shift from 70% scaffolding / 30% model to 90% model / 10% scaffolding, and why knowing when to rip things out is the may be the most important skill today.

Find the full episode on [Spotify](https://open.spotify.com/episode/3lBZv7BBAF93tRr6IxyX7P), [Apple Podcasts](https://podcasts.apple.com/us/podcast/episode-70-1-400-production-ai-deployments/id1610318868?i=1000749373335), and [YouTube](https://www.youtube.com/live/uf80BfD70Lw), or the full show notes here. You also can interact directly with the transcript [here in NotebookLM](https://notebooklm.google.com/notebook/ceef53be-ffe8-47d5-8850-07335c434100).

![](https://www.youtube.com/watch?v=uf80BfD70Lw)

*Our flagship course **[Building AI Applications](https://maven.com/hugo-stefan/building-ai-apps-ds-and-swe-from-first-principles)** just wrapped its final cohort but **we’re cooking** up something new. **[If you want to be first to hear about it (and help shape what we build), drop your thoughts here](https://tally.so/r/EkLjyA)**.*

## The Decade of the Agent: Gemini, Opus, and GPT-Family Models Used for Vastly Different Use Cases

[00:05:00](https://www.youtube.com/live/uf80BfD70Lw?t=300)

The experimentation phase has ended for many enterprises, and 2026 is shaping up to be the decade of agents (and we all thought it would be only the year!). The database reflects a shift from simple RAG implementations to autonomous systems, driven by models that are super-fast and optimized for agentic applications.

A clear split in model application has emerged:

- **High-intelligence agents:** Models like Anthropic’s Claude Opus 4.5 (now 4.6) and OpenAI’s GPT-5.2 (now 5.3 & 5.4) are preferred for long-trajectory tasks requiring reliable, multi-step tool calling.
- **High-volume processors:** Google’s Gemini 3 Flash has become the enterprise workhorse for document processing, captioning, and transcription. It is used less for agents and more for rapid, cost-effective multimodal throughput.

> [Gemini isn’t being used as agentically. And if anyone has tried to use Gemini CLI or Antigravity, you’ll often end in some kind of dead end of tool-call failure. \[I added that Antigravity is fascinating to use, but in space, no one can hear you scream.\]](https://www.youtube.com/live/uf80BfD70Lw?si=2ZdvHHA1f6j35pCX&t=530)

## What’s in the Database: Agents, Agents, and, well, more Agents!

Almost all of the use cases being published in the database these days are agents. Alex shared design choices for the database, where projects included are:

1. **Serious agentic use cases**, rather than internal proof of concept or personal projects;
2. **Built for real customers or real users**, whether it’s internal or external; ***and***

Somewhat **complex applications of AI**

> [There are a lot of YouTube videos and talks that we include in the (write-up) for the database. People should be learning lessons as they build things. It’s not so interesting to hear that someone spun up a hello-world LangChain Q&A over documentation for their users. But if they had some real problems around context or were debugging something with some new model, that’s what we go for.](https://www.youtube.com/live/uf80BfD70Lw?si=dDVR97oQZlINFOcu&t=672)

The frontier of agent design at the moment is centered around context engineering, and new developments are happening every week with techniques and applications of agents.

## Context Engineering and ’Context Rot’

[00:19:40](https://www.youtube.com/live/uf80BfD70Lw?t=1180)

As agents execute more tools, context windows fill with intermediate outputs, leading to what Kelly Hong, Anton Troynikov, and Jeff Huber (builders/researchers at Chroma) have termed **[context rot](https://www.trychroma.com/research/context-rot)**, or a degradation in model reasoning capabilities as input length changes, even within the advertised context limits. This has birthed the discipline of **context engineering**.

In another article, I outlined LangChain’s Lance Martin’s [t](https://hugobowne.substack.com/p/ai-agent-harness-3-principles-for) **[hree principles for effective context engineering:](https://hugobowne.substack.com/p/ai-agent-harness-3-principles-for)**

1. **Reduce:** Actively shrink context by summarizing past trajectories.
2. **Offload:** Move data to external file systems rather than keeping it in the prompt (e.g., creating a text file artifact).
3. **Isolate:** Delegate token-heavy sub-tasks to specialized agents that return only concise results.

![](https://substackcdn.com/image/fetch/$s_!h5A6!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ff6e25504-a9ec-489b-9590-62c30d9d2185_1456x518.png)

We see context engineering for agents whose builders want them to respond in real time, such as Elyos AI’s emergency-response voice agent targeting 400-500 millisecond response times. Interestingly, this discipline does not strictly require a traditional software engineering background. **Domain expertise** is more valuable than coding skills.

> [Four years ago, I was working as a historian, and I made a complete career pivot. People with a humanities background who’ve worked in research are actually in a really great place to be thinking about these kinds of things... Someone coming from a non-traditional background often is able to think about these things in a way where they don’t assume that things are meant to be done in a certain way.](https://www.youtube.com/live/uf80BfD70Lw?t=1920)

There is a gap in the market for no-code or low-code interfaces that allow domain experts like lawyers, doctors, and researchers to design context flows without writing Python, essentially a Claude Cowork for context engineering.

## The Agent Harness’ and the Bitter Lesson

[00:48:30](https://www.youtube.com/live/uf80BfD70Lw?t=2910)

[An](https://hugobowne.substack.com/p/what-300-engineers-from-netflix-amazon?open=false#%C2%A7q3-what-is-an-agent-harness) **[agent harness](https://hugobowne.substack.com/p/what-300-engineers-from-netflix-amazon?open=false#%C2%A7q3-what-is-an-agent-harness)** [is the software scaffolding that manages the LLM, tool execution, and memory](https://hugobowne.substack.com/p/what-300-engineers-from-netflix-amazon?open=false#%C2%A7q3-what-is-an-agent-harness). Claude Code is an example of an agent harness. A major tension exists between building complex harnesses (as planners, critics, sub-agents) and relying on raw model intelligence. Later in the episode, Alex said enterprises are learning to keep their harnesses light, without locking in and building extensive tooling around them. When other models get better for their use case, it’s easier to remove and replace existing harnesses.

**The Windsurf lesson:** [Nick Moy (DeepMind, formerly Windsurf/Codeium) noted that complex harnesses often become technical debt](https://hugobowne.substack.com/p/the-post-coding-era-what-happens?utm_source=publication-search). Windsurf built sophisticated agentic workflows that struggled with older models. When superior models were released, the heavy scaffolding actually hindered performance.

> [Dream big... the models are getting so good, you got to let them be free and you’ve got to unfetter them. And harnesses get in the way.](https://www.youtube.com/live/uf80BfD70Lw?t=3120)

Teams must be prepared to “rip out the harness” every few months. The best agent architecture is often the one simple enough to be rewritten when a new model checkpoint drops. Over-engineering for current model limitations is a specific form of fragility.

*If you want to learn how to build production Agent Harnesses, check out my recent workhops with Ivan Leo (DeepMind, used to build agents at Manus) on:*

- [Building Your Own Deep Research Agent](http://build%20your%20own%20deep%20research%20agent/), and
- [Building Agents That Build Themselves](https://hugobowne.substack.com/p/building-agents-that-build-themselves).

## Production Realities: Cost, Latency, and Infinite Loops

[00:34:40](https://www.youtube.com/live/uf80BfD70Lw?t=2080)

The shift to production brings severe financial risks. Infinite loops in agentic systems are a solvable but expensive problem. Alex mentioned the LLMOps Database has become a great place for builders to learn from the mistakes of other builders and see their retrospectives on what they learned.

**The $50,000 Infinite Loop**

In one example, the mistake was quite costly, Alex said.

> [One company spent almost $50,000 because an agent went into an infinite loop and they kind of forgot about it for a month, and I guess no one was monitoring these costs.](https://www.youtube.com/live/uf80BfD70Lw?t=2175)

**Silent Failures**

A dangerous failure mode in production is the “truthy” text response. A tool call may fail deeply within the stack, but the LLM, receiving an error string, interprets it as text and hallucinates a successful confirmation to the user.

**Latency vs. Context**

For real-time voice agents (like the Elyos AI example we mentioned earlier), context engineering is a latency constraint. To maintain sub-500 millisecond response times, the system aggressively dumps context. For example, once the system determines if a call is an emergency, it immediately discards the diagnostic tree and starts fresh for the resolution phase.

**Cascading Tool Failures**

One of the most frequent “agent smells” in production is the risk of cascading tool failures in systems attempting long trajectories. While modern models have improved, even a high tool-calling accuracy of 85% can quickly degrade into a “coin flip” of reliability if an agent is forced to make six or more sequential call. To mitigate this, companies like Door Dash have transitioned from single agents to sophisticated three-tier system. By delegating tasks specialist sub-agents and using a shared memory layer, they prevent the “context pollution” of intermediate failed thoughts from derailing the entire reasoning chain.

![](https://substackcdn.com/image/fetch/$s_!R7eb!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F1a9abd85-9a7f-4655-92a3-963e5385c049_1052x554.png)

Image from Beyond Single Agents: How DoorDash is building a collaborative AI ecosystem

## The Evolution of Interfaces: MCP, Skills, and Just-in-Time Apps

[00:58:00](https://www.youtube.com/live/uf80BfD70Lw?t=3480)

The way agents interact with systems is standardizing around the **Model Context Protocol (MCP)** and **Skills** (markdown-based instructions).

- **Skills:** Text files (markdown with YAML frontmatter) act as “living documentation” for agents. They allow for progressive disclosure, loading only the skill description initially and reading the full instruction set only when needed.
- **Just-in-time interfaces:** The future of user interface (UI) is ephemeral. Anthropic’s “MCP Apps” suggest a move toward interfaces generated on-the-fly for specific tasks, rather than static dashboards.
- **Files as context:** The industry is moving away from the knee-jerk usage of vector databases for everything. Simple lexical search (grep) and file system navigation are often more effective for coding agents than semantic search.

## The Shifting MLOps Landscape

[00:35:00](https://www.youtube.com/live/uf80BfD70Lw?t=2100)

Budgets are moving, and enterprises that weren’t ready last year are making big investments in agents this year. Resources previously allocated to traditional MLOps (e.g., training, serving, feature stores) are being shifted to genAI and agentic teams.

> [It’s kind of funny how many people assume that MLOps, training models... is a solved problem... because it’s in some ways easier \[to use APIs\].](https://www.youtube.com/live/uf80BfD70Lw?t=2124)

While API-based development is faster, the complexity of managing deep agents, which may run for hours, requires a new breed of operations infrastructure.

## Key Takeaways

- **Model specialization:** A clear split in model application has emerged with Claude Opus and GPT-family models preferred for long-trajectory tasks requiring reliable, multi-step tool calling while Gemini has become the enterprise workhorse for document processing, captioning, and transcription.
- **Discount the context window:** The advertised context window is a fiction. Effective context is much smaller; budget accordingly.
- **Disposable architecture:** The best agent harness is one you are willing to delete. If you over-engineer the scaffolding, you cannot leverage the next model’s native capabilities.
- **Monitor logic, not just uptime:** Agents can fail silently while producing fluent text. Infinite loops can bankrupt a project budget in weeks without triggering standard error rate alarms.
- **Context engineering is a role:** This is a job to be done and requires a skillset that is distinct from software engineering, favoring those who can structure information and instructions clearly (often humanities backgrounds).

## How You Can Support Vanishing Gradients

Vanishing Gradients is a podcast, workshop series, blog, and newsletter focused on what you can build with AI right now. Over 70 episodes with expert practitioners from Google DeepMind, Netflix, Stanford, and elsewhere. Hundreds of hours of free, hands-on workshops. All independent, all free.

If you want to help keep it going:

- [Become a paid subscriber, from $8/month](https://hugobowne.substack.com/subscribe)
- Share this with a builder who’d find it useful
- [Subscribe to our YouTube channel.](https://www.youtube.com/@vanishinggradients)