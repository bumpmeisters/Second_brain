I demystify the term 'AI harness' and show you my exact workflow for building one to automate Sentry bug triage using the Claude Agent SDK, a custom terminal UI, and opinionated tool adapters.

![How I Built a Custom AI Harness with the Claude Agent SDK for Bug Triage](https://www.chatprd.ai/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fng65ow1q%2Fproduction%2Fef21ca3c4816b6446860e21a3f3a518cec8dacae-960x540.png&w=3840&q=75)

Everybody’s saying “it’s not the model, it’s the harness.” But you know what? Not everybody is saying what a harness is. In this episode of How I AI, I decided to pull back the curtain, demystify the idea of a harness, and show you exactly how I built my own—and how you can do it, too.

A harness is just code around an AI agent. That’s it. It’s not some mythical, complex thing. It’s code you write to make an AI agent more effective at a very specific, repeatable job. You’ve seen complex harnesses like Cursor, or even the general-purpose coding assistants like Claude Code and Codex. My goal was to show that you don’t need to be a massive company to build one. Sometimes, a few files and a simple interface are all you need to create something incredibly useful.

I looked at my own business, [ChatPRD](https://www.chatprd.ai/), and asked myself what repetitive task I could automate. The answer was clear: fixing bugs. I ship code, so I ship bugs. Triaging them from our error monitoring tool, [Sentry](https://sentry.io/), is a consistent process that felt perfect for this experiment. It requires specific context, a defined set of actions, and a clear goal. So, I set out to build a harness that could investigate [Sentry](https://sentry.io/) bugs, use our internal tools, and handle all the follow-up, like creating tickets in [Linear](https://linear.app/).

This post will walk you through the entire process. We’ll cover the architecture, the tools I used (including how I got other AI agents to help me build it), and the final results. My hope is that by the end, you’ll see that building a harness is not only possible but is a practical way to get more leverage out of the AI tools we use every day.

## Workflow: Building a Custom Harness for Sentry Bug Triage

My goal was to automate the investigation of bugs reported in [Sentry](https://sentry.io/). While I could use a general-purpose tool like Claude Code, the process is always the same: get the bug report, check some internal systems, analyze the code, and document the findings. A general tool requires me to explain this context every single time. A custom harness, on the other hand, already knows the job to be done. I can just give it the [Sentry](https://sentry.io/) link and it gets to work. This is the core reason to build a harness: when you have a workflow that needs the same setup and outcomes every single time.

### Step 1: Defining the Architecture

Before writing any code, I mapped out the components. A harness isn't just one thing; it's a system of parts working together.

- **Frontend**: I wanted a simple, developer-friendly interface, so I built a terminal UI (TUI). It's a command-line application, but with interactive elements. I used a great library called [Ink](https://github.com/vadimdemedes/ink), which lets you build UIs in Node.js using React-like components.
- **Harness Core**: The brains of the operation. I built this on top of the [Claude Agent SDK](https://code.claude.com/docs/en/agent-sdk/overview) from [Anthropic](https://www.anthropic.com/). This SDK provides the primitives for agentic behavior—planning, tool use, and file system access—which saved me from having to build that from scratch.
- **Tool Adapters**: This is a key part. Instead of giving the agent broad, general access to APIs, I built what I call "opinionated adapters." These are small modules that connect to tools like [Sentry](https://sentry.io/), [Linear](https://linear.app/), [GitHub](https://github.com/), and [Vercel](https://vercel.com/) in a very specific way. For example, the Sentry adapter doesn't just let the agent browse the API; it has functions to pull only the specific data needed for a bug triage, making the process faster and more reliable.
- **Artifact Store**: Every time the harness runs, it needs to save its work. I created a simple file-based artifact store. It saves all the evidence, logs, and reports from an investigation into a dedicated folder for that run. This is crucial for creating a record and for letting the agent use past runs as context for future ones.
![High-level architecture diagram slide](https://cdn.sanity.io/images/ng65ow1q/production/3f9391c54ade602dda921d6fcf4fa301ceeb1030-1920x1080.jpg)

High-level architecture diagram slide

### Step 2: Building the Harness with AI Assistance

Here’s a fun, meta part of the project: I used AI to build my AI harness. I ran dueling sessions with Codex (powered by what was then called [GPT-5.5](https://openai.com/index/introducing-gpt-5-5/)) and Claude Opus. My prompt was essentially: "Help me build a harness. I want to use the [Claude Agent SDK](https://code.claude.com/docs/en/agent-sdk/overview) to triage Sentry bugs. Here's the workflow I want it to follow."

It wasn't a one-shot process. Both models initially resisted putting AI *inside* the harness. They wanted to build a simple, deterministic script. I had to be very specific and push them to incorporate the agentic, non-deterministic parts of the workflow. Funnily enough, Codex did the best job of scaffolding the agent, but it correctly chose to use the [Claude Agent SDK](https://code.claude.com/docs/en/agent-sdk/overview) for the implementation. A true cross-model collaboration!

The final code structure is pretty simple. It's about eight files in total:

- `index.js`: The entry point for the TUI and CLI.
- `adapters/`: A folder containing the specific adapters for [Sentry](https://sentry.io/), [Linear](https://linear.app/), etc.
- `workflows/BugHunter.js`: This file defines the main investigation workflow, outlining the steps from evidence gathering to reporting.
- `ui/`: Components for the [Ink](https://github.com/vadimdemedes/ink) terminal UI.
![Code file layout in VS Code](https://cdn.sanity.io/images/ng65ow1q/production/ea3f7b08849a947efae3bd97b5612c6e5b81a50c-1920x1080.jpg)

Code file layout in VS Code

### Step 3: Crafting the Custom Prompt

With a general-purpose agent, you're stuck with their system prompt. With your own harness, you can write your own. This allows for incredible specificity. Instead of a generic "You are a helpful assistant," my harness uses a much more targeted prompt to guide the [Claude Sonnet 4.6](https://www.anthropic.com/news/claude-sonnet-4-6) model I'm running internally.

> you are working inside the chat purity engineering harness. It's chat, be specific. It's not an open-ended coding system we wanna use. These artifacts as a source of truth. And here's the plan to attack a very specific problem. And what I want you to return is X, Y, and Z.

This prompt immediately sets the context, defines the scope, and clarifies the expected output. I don't have to copy and paste it or hope the agent remembers it from a skill. It's encoded directly into the harness, ensuring it's used every single time.

![Custom prompt slide](https://cdn.sanity.io/images/ng65ow1q/production/1d63d1e5921551cb86aaf320510bc7239e2e83e3-1920x1080.jpg)

Custom prompt slide

### Step 4: Running an Investigation

Now for the fun part. The interface I built is a simple Terminal UI. I invoke it, paste in a link to a [Sentry](https://sentry.io/) error, and kick off the investigation.

![The custom Terminal UI made with Ink](https://cdn.sanity.io/images/ng65ow1q/production/d98353d8ca62b47277727898ed71a08ad19aca50-1920x1080.jpg)

The custom Terminal UI made with Ink

For this demo, I chose an error where some operations were getting dropped by our agents. I selected the "Investigate" mode, which is a great example of harness-level permissions. This mode is not allowed to modify source files; it can only read and analyze. I don't have to remember to tell the agent "investigate only"—I just click the button.

Once started, the harness kicks off a run. It uses the [Claude Agent SDK](https://code.claude.com/docs/en/agent-sdk/overview) to start gathering evidence, forming a root cause hypothesis, and streaming its activity back to my UI.

![The harness running in the TUI, showing logs and progress](https://cdn.sanity.io/images/ng65ow1q/production/39c0c03b531e84e3cfedc29bb2c2b213d9f95e1c-1920x1080.jpg)

The harness running in the TUI, showing logs and progress

### Step 5: Analyzing the Results (The Artifacts)

The real value of the harness comes from its output. After the run completes, it generates a bundle of artifacts in a dedicated folder. This isn't just a chat log; it's a structured, repeatable report that the whole engineering team can use.

The main output is an `investigation brief`. For the bug I was investigating, the brief contained:

- **Confirmed Evidence**: It confirmed the Sentry warning was real, impacting 150 users, and still happening hourly. It also noted that Vercel logs were unavailable, which is a useful piece of information.
- **Likely Root Causes**: It identified two potential root causes related to an invalid or overlapping range in a specific function and pointed out a blind spot in our logic.
- **Verification Steps**: It told me exactly how to verify its hypothesis by fetching a raw Sentry event.
- **Next Steps**: It recommended creating a [Linear](https://linear.app/) issue to track the fix but advised against trying to auto-patch it because more information was needed.
![The final investigation brief artifact file content](https://cdn.sanity.io/images/ng65ow1q/production/2b546ec7ade78fc34e2fb8e85d0a41b78034d132-1920x1080.jpg)

The final investigation brief artifact file content

This is the perfect outcome. It's a clear, actionable summary that I can hand off to the team. The harness did the tedious work of gathering evidence and initial analysis, leaving the more complex problem-solving to a human. All of this is saved, including a beautiful HTML summary, in the `artifacts` folder for that specific run.

### Conclusion: You Should Build a Harness

Going through this process completely changed my perspective. I've gotten so used to the open chat field, thinking that was the only way to interact with these powerful models. But I now see that for many jobs, that's not enough. By constraining the work and building a purpose-built harness, we can get more consistent, efficient, and reliable results.

A harness demystified is just this: identifying a specific workflow, making opinionated choices about tools and data, defining the outputs you need, and building a simple interface to bring it all together. It's about moving from a general-purpose agent that can do anything to a specialized agent that can do one thing perfectly.

I really hope this breakdown shows that these concepts aren't as mysterious as they sound. Look at your own work. Is there a task you do over and over? A process that's mostly the same every time? That's a perfect candidate for your first harness. You can start small, use AI to help you build it, and create a tool that makes your own work—and your team's work—better.

### Thank you to our sponsors

- **\[Bolt.new\](https://bolt.new/)**: Turn your idea into a real product
- **\[Customer.io\](https://customer.io/)**: Build customer engagement campaigns from a single prompt

### Episode Links

- **YouTube**: [https://www.youtube.com/watch?v=ofS-4RRw9zw](https://www.youtube.com/watch?v=ofS-4RRw9zw)
- **Spotify**: [https://open.spotify.com/episode/3t4Osk3xFYKBefEqjy5git?si=RUTHdDqTQ3u\_So21Uw93aA](https://open.spotify.com/episode/3t4Osk3xFYKBefEqjy5git?si=RUTHdDqTQ3u_So21Uw93aA)
- **Apple Podcasts**: [https://podcasts.apple.com/us/podcast/how-i-ai/id1809663079?i=1000775947149](https://podcasts.apple.com/us/podcast/how-i-ai/id1809663079?i=1000775947149)

\---

Find me, [Claire Vo](https://www.linkedin.com/in/clairevo/), on [clairevo.com](https://clairevo.com/) and [X (formerly Twitter)](https://x.com/clairevo).