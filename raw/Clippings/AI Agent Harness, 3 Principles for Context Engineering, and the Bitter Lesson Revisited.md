*LangChain’s Lance Martin [recently appeared on the High Signal podcast](https://high-signal.delphina.ai/episode/context-engineering-to-ai-agent-harnesses-the-new-software-discipline), covering the shift from **model training** to **orchestration**, **agent harnesses**, **context engineering**, **agentic workflows**, and the **impact** of **rapidly improving models**.*

[In a recent episode of High Signal](https://high-signal.delphina.ai/episode/context-engineering-to-ai-agent-harnesses-the-new-software-discipline), we spoke with Lance Martin, a machine learning engineer at LangChain, about the new engineering disciplines emerging in the era of generative AI. With a background building production ML systems at Uber and now working on tooling to help developers build, test, and deploy reliable AI agents at Langchain, Lance has a wonderful perspective on what has fundamentally changed and what principles endure.

This post captures some of our favourite parts of the conversation, including the

- The ***shift from training models to orchestrating them***,
- the ***importance of agent harnesses*** and ***re-architecting them as models improve***,
- ***3 key principles*** for ***mastering context engineering***,
- Navigating the ***agentic spectrum***: ***human supervision, feedback cycles***, and ***risk tolerance.***

Find the full episode on [Spotify](https://open.spotify.com/episode/7vykT7jyhiJwcduxUpK9Rm?si=2f8fd83e52af4718), [Apple Podcasts](https://podcasts.apple.com/us/podcast/episode-28-from-context-engineering-to-ai-agent-harnesses/id1774960199?i=1000736545640), and [YouTube](https://www.youtube.com/watch?v=2Muxy3wE-E0&feature=youtu.be), or [the full show notes here](https://high-signal.delphina.ai/episode/context-engineering-to-ai-agent-harnesses-the-new-software-discipline).

![](https://www.youtube.com/watch?v=2Muxy3wE-E0)

**Timestamps:**

[00:00](https://www.youtube.com/watch?v=2Muxy3wE-E0) Introduction to the Democratization Shift in AI  
[00:39](https://www.youtube.com/watch?v=2Muxy3wE-E0&t=39s) Key Shifts in the Generative AI Era  
[03:00](https://www.youtube.com/watch?v=2Muxy3wE-E0&t=180s) From Traditional ML to Generative AI  
[05:37](https://www.youtube.com/watch?v=2Muxy3wE-E0&t=337s) Core Principles in Modern AI Systems  
[07:58](https://www.youtube.com/watch?v=2Muxy3wE-E0&t=478s) Building and Evaluating AI Agents  
[08:58](https://www.youtube.com/watch?v=2Muxy3wE-E0&t=538s) The Bitter Lesson and System Design  
[14:53](https://www.youtube.com/watch?v=2Muxy3wE-E0&t=893s) Understanding AI Workflows and Agents  
[23:49](https://www.youtube.com/watch?v=2Muxy3wE-E0&t=1429s) Ambient Agents and Their Applications  
[26:22](https://www.youtube.com/watch?v=2Muxy3wE-E0&t=1582s) Building Smarter Autonomous Agents  
[26:58](https://www.youtube.com/watch?v=2Muxy3wE-E0&t=1618s) The Importance of Context Engineering  
[28:02](https://www.youtube.com/watch?v=2Muxy3wE-E0&t=1682s) Managing Token Usage in Agents  
[29:09](https://www.youtube.com/watch?v=2Muxy3wE-E0&t=1749s) Strategies for Context Reduction  
[33:03](https://www.youtube.com/watch?v=2Muxy3wE-E0&t=1983s) Offloading and Isolating Tasks  
[36:06](https://www.youtube.com/watch?v=2Muxy3wE-E0&t=2166s) Introduction to MCP and Standardization  
[39:25](https://www.youtube.com/watch?v=2Muxy3wE-E0&t=2365s) Evaluating and Future-Proofing AI Systems  
[46:32](https://www.youtube.com/watch?v=2Muxy3wE-E0&t=2792s) Key Principles for AI and ML Leaders  
[49:52](https://www.youtube.com/watch?v=2Muxy3wE-E0&t=2992s) Conclusion and Final Thoughts

### From Training to Orchestration: A New Era in AI Engineering

> [Rather than intense focus on model architecture and training, most users now just are handed this object, this extremely powerful new computing primitive and what do I do with this?](https://youtu.be/2Muxy3wE-E0?t=9)

Three major shifts have reshaped the AI landscape over the past several years:

1. **Architectural Consolidation**: The transformer architecture has become dominant, absorbing more specialized architectures like CNNs and RNNs. This, combined with scaling laws, has led to much larger and more general-purpose models.
2. **Model APIs >> Training Models**: The industry has moved from a world where every company trained its own proprietary models to one where a few foundation model providers offer powerful primitives through APIs. This has flipped the ratio of model trainers to model users.
3. **Higher Level of Abstraction For Builders**: As a result, the core engineering challenge has shifted. This new reality has given rise to a new set of engineering disciplines focused on **orchestration**: ***prompt engineering, context engineering,** and **building agents** on top of these **powerful new primitives.***

### Applying Classic ML Principles to AI Systems

While the technology has changed, several core principles from traditional ML engineering not only apply but are more critical than ever.

- **Simplicity Remains Essential**: It’s tempting to jump to complex solutions like agents, but starting with the simplest possible approach (often just thoughtful prompt engineering or a structured workflow) is crucial for success. [Start simple and progressively add complexity only when necessary](https://youtu.be/2Muxy3wE-E0?t=346).
- **Observability and Evaluation**: With non-deterministic systems, understanding *what* is happening (tracing) and rigorously evaluating it is paramount. This requires a new kind of evaluation that goes beyond traditional unit tests to account for variability in LLM outputs.
- **Verifier’s Law**: Lance recalls [an idea from Jason Wei](https://www.jasonwei.net/blog/asymmetry-of-verification-and-verifiers-law): the ability to train an AI for a task is proportional to how easily verifiable that task is. [Establishing clear verification criteria is a foundational prerequisite for achieving high quality](https://youtu.be/2Muxy3wE-E0?t=420) and a necessary step before attempting more advanced techniques like reinforcement fine-tuning.

### Agent Harness and the Application Layer: The Bitter Lesson Revisited

![](https://substackcdn.com/image/fetch/$s_!Io6O!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F23137cdb-bfd5-460c-9419-ab8114984243_1870x1098.png)

From Learning the Bitter Lesson

One of the most disorienting challenges of building with LLMs is that the underlying platform is improving exponentially. This brings Rich Sutton’s famous essay, [“The Bitter Lesson,”](http://www.incompleteideas.net/IncIdeas/BitterLesson.html) into sharp focus: *Sutton argues that general methods leveraging computation ultimately win out over handcrafted, complex systems*.

**This lesson now applies at the application layer:** the architectural assumptions baked into an application today will likely be obsolete in six months when a new, more capable model is released.

> [Over time models get better and you’re having to strip away structure, remove assumptions and make your harness or your system simpler and adapt to the models.](https://youtu.be/2Muxy3wE-E0?t=736)

This reality demands a new mindset:

- **The “Agent Harness”**: This is the scaffolding around the LLM that manages tool execution, message history, and context. As models improve, this harness must be continually simplified, stripping away crutches that are no longer needed.
- **Embrace Re-architecture**: Teams must be willing to constantly reassess and rebuild. The popular agent [Manus has been re-architected five times since March 2024](https://youtu.be/2Muxy3wE-E0?t=693), and [LangChain’s Open Deep Research](https://blog.langchain.com/open-deep-research/) was rebuilt multiple times in a year to keep pace with model improvements. Even Anthropic rips out Claude Code’s agent harness as models improve!

### Mastering Context Engineering: Reduce, Offload, Isolate

![](https://substackcdn.com/image/fetch/$s_!fW-Q!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fcd1a0869-0562-441e-a764-1ae8826df852_1532x1038.png)

From Context Engineering for Agents

One of the most critical and overlooked disciplines, particularly with agentic systems, is **context engineering**.

Simply appending tool call results to a growing message list is expensive, slow, and degrades model performance. Even models with million-token context windows suffer from **“ [context rot](https://research.trychroma.com/context-rot),”** where instruction-following ability diminishes as the context grows.

> [Often the effective context window for these LLMs is actually quite a bit lower than the stated technical one.](https://youtu.be/2Muxy3wE-E0?t=1836) *[So something to be very careful of.](https://youtu.be/2Muxy3wE-E0?t=1836)*

Lance outlines a three-part playbook used by leading agentic systems like Manus and Claude Code to manage context effectively:

1. **Reduce**: Actively shrink the context passed to the model. This can be done by **compacting older tool calls** (keeping only a summary) or using **trajectory summarization** to compress the entire history once it reaches a certain size.
2. **Offload**: Move information and complexity out of the prompt. This includes saving full tool results to an external file system for later reference. More profoundly, it means **offloading the action space**. Instead of giving an agent 100 different tools (which bloats the prompt), [give it a few atomic tools like a bash terminal](https://youtu.be/2Muxy3wE-E0?t=2033). This allows the agent to execute a vast range of commands without cluttering the context.
3. **Isolate**: Use **multi-agent architectures** to delegate token-heavy sub-tasks. A main agent can offload a complex job to a specialized sub-agent, which performs the work in its own isolated context and returns only a concise result.

![](https://substackcdn.com/image/fetch/$s_!ktKD!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fe903d39d-6c37-463a-8ace-aad9c2ac671f_2048x729.png)

From Context Engineering for Agents

**Evaluation practices are also evolving rapidly**. Static benchmarks become saturated quickly, so the most effective teams rely on a more dynamic approach.

- **Dogfooding and User Feedback**: The primary sources of evaluation data for products like Claude Code and Manus are [aggressive internal dogfooding and direct in-app user feedback](https://youtu.be/2Muxy3wE-E0?t=2484). Capturing real-world failure cases is key.
- **Component-Level Evals**: It’s beneficial to set up separate evaluations for individual components of a system, such as the retrieval step in a RAG pipeline, to isolate and fix issues.
- **Future-Proofing**: Test your system against models of varying capabilities. If performance scales up with more powerful models, your harness is likely well-designed and not a bottleneck.

### Workflows vs. Agents: A Spectrum of Autonomy

![](https://substackcdn.com/image/fetch/$s_!nSQt!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F2fbe8b03-6c9f-41d7-9129-7661746c7f70_2468x1392.png)

From Stop Building AI Agents... And Start Building Smarter AI Workflows

It’s also important to make clear that full-blown agents are not always the solution! A common point of confusion is when to use a structured workflow versus a more autonomous agent. [The key distinction is autonomy](https://youtu.be/2Muxy3wE-E0?t=985).

- **Workflows** are systems with predefined, predictable steps. An LLM call can be one step in a fixed sequence (A → B → C). This is ideal for tasks with a known structure, like running a test suite or migrating a legacy codebase. Frameworks like LangChain’s **LangGraph** are designed for building these.
- **Agents** are systems where the LLM dynamically chooses its own tools and processes to solve a problem. They are best suited for open-ended, adaptive tasks like research or complex coding, where the path to a solution is not known in advance.

This is not a binary choice but a spectrum. You can have systems with varying degrees of agency, and it’s even common to embed an agent as one step within a larger workflow. As models become more reliable, we’re also seeing the rise of **background or “ambient” agents** that can perform long-horizon tasks asynchronously, such as managing an email inbox. [These systems require carefully designed human-in-the-loop checkpoints and memory to learn from feedback over time](https://youtu.be/2Muxy3wE-E0?t=1533).

Full-blown agentic systems thrive when there’s high supervision, rapid feedback loops, and low risk.

### Key Takeaways for AI and Engineering Leaders

Lance gave us five key principles for leaders navigating this new landscape:

1. **Start Simple**: Exhaust prompt engineering and simple workflows before moving to agents. Consider fine-tuning only as a last resort.
2. **Build for Change**: Accept that the “Bitter Lesson” is real. What you build today will need to be re-architected as models improve.
3. **Don’t Fear Rebuilding**: The cost and time required to rebuild systems are dramatically lower now, thanks to powerful code-generation models.
4. **Patience Pays Off**: An application that is not viable today may be unlocked by the next generation of models. The success of Cursor after the release of Claude 3.5 Sonnet is a prime example.
5. **Be Wary of Premature Training**: Don’t rush to fine-tune. Frontier models often quickly acquire the capabilities that teams spend months building into custom models.

Building applications with generative AI is a fundamentally new engineering discipline. It rewards ***orchestration** over architecture, **adaptation** over rigidity, and **simplicity** over complexity*.

The challenge for technical leaders is not just to build systems that work today, but to foster a culture and technical practice that can evolve with the powerful, ever-improving models at their core.