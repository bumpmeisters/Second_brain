I sit down with Alex Finn to demystify his five-computer local AI setup and break down his incredible Claude Code software factory that goes from idea to merged code with a single rocket emoji.

![How I AI: Alex Finn's Local AI Fleet and Automated Software Factory](https://www.chatprd.ai/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fng65ow1q%2Fproduction%2F297a4ab9d1d3ab0974387db0458111f19b5d458f-960x540.png&w=3840&q=75)

When I first heard about [Alex Finn](https://www.linkedin.com/in/alex-finn-1848684a) 's home office, I knew I had to have him on the show. We’re talking three Mac Studios, a DGX Spark, and a custom-built RTX 5090 machine, all humming away and, in his words, making his office feel like a sauna. But this isn't just about collecting expensive hardware; it's about a fundamental shift in how we can use AI.

Alex is one of the most forward-thinking builders I've met, and in this episode, he completely demystifies the world of local models. He argues that the real reason to invest in local hardware isn't about saving money on a [$20 ChatGPT subscription](https://openai.com/chatgpt) — it's about unlocking the ability to run unlimited intelligence, 24/7. This concept of “ambient AI” enables workflows that would be outrageously expensive with cloud-based APIs.

I was so excited to get into the details with Alex, the creator of the [Vibe Code Academy](https://www.youtube.com/@AlexFinnOfficial) community and a fellow AI obsessive. He walked me through his entire stack, from choosing the right machine for the right job to building a fully automated software factory that ships code while he sleeps. We're going to cover how to set up your own local AI fleet, how to put it to work with continuous security scans and market research, and the build-and-review loop that is one of the coolest workflows I’ve seen.

## Workflow 1: Assembling Your Local AI Fleet

The first hurdle for many is the hardware itself. The number one pushback Alex gets is about the cost. But as he explained, the point isn't pure ROI; it's about the use cases it unlocks. Having unlimited, around-the-clock inference running locally is something you simply can't do with pay-per-token cloud models. So, how do you get started?

### \### The Hardware Breakdown: Mac vs. DGX vs. Nvidia

Alex has experimented with pretty much everything and breaks down the main options into three tiers. He was kind enough to share his mental model for what each is good for.

![Alex's chart comparing the four hardware options](https://cdn.sanity.io/images/ng65ow1q/production/282d465831c317e1892ea72a0e10842e02077deb-1920x1080.jpg)

Alex's chart comparing the four hardware options

1. **\[Mac Studio\](https://www.apple.com/mac-studio/): High Intelligence, Low Speed.** The magic of the Mac Studio is its high unified memory. Alex’s 512GB machines can load massive, frontier-level models like [GLM 5.2](https://huggingface.co/zai-org/GLM-5.2), which he says is at an “Opus 4.8 level” of intelligence. The downside? Slow processing speeds. A single prompt might take five minutes to get a response. It’s perfect for deep, complex tasks that aren't time-sensitive.
2. **\[DGX Spark\](https://www.nvidia.com/en-us/products/workstations/dgx-spark/): The Sweet Spot.** These are plug-and-play AI workstations from Nvidia. You get a solid 128GB of unified memory plus the speed of Nvidia’s CUDA architecture. It's the best of both worlds: you can run powerful mid-size models like [Qwen 3.6](https://huggingface.co/Qwen/Qwen3.6-35B-A3B) or [Ornith 1.0](https://github.com/deepreinforce-ai/Ornith-1) very quickly. It's a fantastic middle ground.
3. **Custom Nvidia Builds (RTX 5090): Low Memory, Blazing Speed.** Building a computer around a high-end GPU like the RTX 5090 gives you lightning-fast performance that feels like using a cloud API. The tradeoff is lower VRAM (the 5090 has 32GB), which limits the size of the models you can run. This is ideal for tasks that need rapid responses.

### \### The Setup: Your AI IT Guy

Here’s the part that really surprised me. Alex insists that with the right tools, you need almost no technical knowledge to get these models running.

The secret is a two-part combo:

- **\[Tailscale\](https://tailscale.com/):** This tool creates a private, virtual network across all your devices. Alex says it's worth installing even if you only have one computer because it lets you do things like test local web apps on your phone. For a multi-machine setup, it’s the essential connective tissue.
- **\[OpenClaw\](https://openclaw.ai/) or \[Hermes\](https://hermes-agent.nousresearch.com/):** Once your machines are on a Tailscale network, you can use a single agent as your “IT guy.” You can literally tell it, “Hey, OpenClaw, check out the new Mac Studio I just bought. See what the hardware is, find an appropriate model for my use cases, and load it up.” The agent will hop across the network and do the complete setup for you.

> “It will jump between all your devices, no technical knowledge needed, and load up and run anything you want.”

## Workflow 2: Ambient AI, Your 24/7 Workforce

Once the fleet is operational, Alex uses a custom “Fleet Control” dashboard to manage it. This is where the concept of “ambient AI” comes to life. Instead of waiting for a prompt, his local models are constantly working for him.

![The Fleet Control dashboard showing machines, models, and tasks](https://cdn.sanity.io/images/ng65ow1q/production/d341b229a14623772d33bee415a371ae2e770f05-1920x1080.jpg)

The Fleet Control dashboard showing machines, models, and tasks

### \### The BDR and the Closer: A Hybrid Approach

Alex has a brilliant system for combining the strengths of local and frontier models. He calls it the “BDR and the closer” model, an analogy we former SaaS people can appreciate.

1. **The BDR (Business Development Rep):** A local model, like the powerful but slow [GLM 5.2](https://huggingface.co/zai-org/GLM-5.2), runs on a Mac Studio and performs a security scan on his SaaS codebase every 30 minutes. It does the high-volume, low-cost work of finding potential issues.
2. **The Findings:** The local model generates a Markdown report with all its findings. On one day, it had found 374 potential issues.
3. **The Closer:** Once a day, a loop running in [Claude Code](https://claude.ai/code) (`/loop 24 hours`) acts as the expert closer. It reads the report from the local model, reviews the code snippets, and determines which findings are real and how to fix them.

This hybrid workflow is incredibly efficient. The local model does the grunt work for free, while the expensive, high-intelligence frontier model is used only for the final, critical judgment. Trying to run Claude Code every 30 minutes would cost thousands.

### \### Automated Market Research

Another local model, a faster one like [Qwen 3.6](https://huggingface.co/Qwen/Qwen3.6-35B-A3B) running on his DGX Spark, has a different job: market research. It spends all day reading Twitter, Reddit, Product Hunt, and Hacker News, looking for “signal.” It identifies challenges people are facing or wishes they had software for, and it adds those insights to a queue for Alex to review as potential SaaS ideas.

## Workflow 3: The Automated Software Factory

This was my favorite part of our conversation. Frustrated by people on X being vague about their AI agent “loops,” Alex decided to build his own fully autonomous software factory. This workflow takes his SaaS, [Henry Intelligent Machines](https://www.youtube.com/@AlexFinnOfficial), from idea to merged code with minimal human intervention. If you're curious about loops, I also did an episode breaking down [how to design AI agent loops](https://www.lennysnewsletter.com/p/how-to-design-ai-agent-loops-schedules) you can check out!

### \### Step 1: The Morning Brief

Alex’s day starts with a conversation in Claude using a prompt like `morning build`. The AI asks him what he's thinking about and collaborates with him to generate a list of tasks to build for his SaaS that day.

### \### Step 2: The Build & Review Loops

This is where the automation kicks in. Alex has two separate loops running in [Claude Code](https://claude.ai/code):

- **Build Loop:** This agent takes the task list from the morning brief and starts building out the features, one by one.
- **Review Loop:** As the build loop finishes tasks, a second agent picks them up, reviews the code, and makes corrections.
![Alex showing the build and review loops in the Claude Code UI](https://cdn.sanity.io/images/ng65ow1q/production/58617f0624aa1bb9c3e9a616d8971e59f228e0ff-1920x1080.jpg)

Alex showing the build and review loops in the Claude Code UI

### \### Step 3: Ship with a Rocket Emoji

Once a feature is built and reviewed, the system sends Alex a notification in Slack. The message includes a link to a preview deployment on [Vercel](https://vercel.com/) so he can test the new feature live.

If everything looks good, he doesn't write a comment or run a command. He just reacts to the Slack message with a 🚀 emoji.

![The Slack message showing the merge-ready feature and the rocket emoji reaction](https://cdn.sanity.io/images/ng65ow1q/production/bf3346e73a5322fb44e0b1caeb51d4a75e6b30d5-1920x1080.jpg)

The Slack message showing the merge-ready feature and the rocket emoji reaction

That rocket emoji is the trigger. A final agent, the “Henry Loop,” sees the emoji, automatically merges the code into the main branch, and the feature is shipped. It’s a complete, end-to-end software development lifecycle, managed by AI agents and approved with a single click.

## The Future is Autonomous

Talking with Alex was a glimpse into a future where we are not just users of AI, but managers of intelligent, autonomous systems. His workflows show how to thoughtfully combine the raw power of local models for scale with the sharp intelligence of frontier models for precision. He’s moved beyond just prompting an AI to get a task done; he's building factories that complete entire projects on their own.

What I love most is that these workflows aren't just theoretical. Alex is using them every day to build real software. It's a powerful demonstration of what's possible when you stop thinking about AI as just a chatbot and start thinking of it as an infinite, 24/7 workforce. I hope this inspires you to think about what you could automate in your own life and work. What tasks could you offload to an ambient AI agent running on a dedicated machine?

### Thank you to our sponsors

Thank you to our amazing sponsors for supporting How I AI:

- **\[Runway\](https://runwayml.com/):** The creative AI platform for images, video and more
- **\[Jira Product Discovery\](https://www.atlassian.com/software/jira/product-discovery):** Prioritize with insights, build with confidence

### Episode Links

- Find [Alex Finn](https://www.linkedin.com/in/alex-finn-1848684a) on [YouTube](https://www.youtube.com/@AlexFinnOfficial) and [X](https://x.com/AlexFinn)
- Find me, [Claire Vo](https://www.linkedin.com/in/clairevo/), on my [website](https://clairevo.com/) or on [X](https://x.com/clairevo)
- This episode was produced and marketed by [Penname](https://penname.co/)