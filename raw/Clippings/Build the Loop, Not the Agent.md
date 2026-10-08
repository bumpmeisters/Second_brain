<sub><i>Guest contributors:</i></sub> **<sub><i>Ethan Wang</i></sub>** <sub><i>is founding member of Google DeepMind Spark agent and founding member of Google DeepMind Mariner Agent.</i></sub> **<sub><i>Namrata Ganatra</i></sub>** <sub><i>is VP of Product &amp; Engineering at Intuit, founder of AI-Native Builders, former AI startup founder, and ex-leader at Meta, Coinbase, Xero, and Microsoft.</i></sub>

Most teams treat agent modernization as a project with a finish line: re-architect around today's frontier model, ship, declare victory. But model capability advances faster than any single modernization effort can complete. By the time you finish re-architecting around today's frontier model, the next one has already shifted the ground beneath you. Plan around a fixed end state and you will perpetually ship an architecture tuned to a model generation that is already obsolete.

The better bet is simple: **the team that can iterate fastest against the newest models will win.**

Almost every architectural decision should be judged by one test — ***does it shorten the iteration loop or lengthen it***? Three principles follow: make rapid iteration the primary objective, concentrate evaluation taste in a small elite team, and resist premature abstraction in favor of closing the end-to-end loop first.

## 1\. Modernization Is a Continuous Process, Not a One-Time Project. Fund This Loop, Not the Artifact

“You are not building an agent. You are building the loop that rebuilds it.”

If model capability keeps moving, your primary investment should not be any one modernized agent — it should be the *infrastructure and practices that make each modernization cycle cheap and fast*. When a new model arrives, the question you want to answer is “how quickly can we re-tune, re-evaluate, and ship?” — measured in days, not quarters.

What to fund: evaluation and CI infrastructure for agents, fast offline and online experiment tooling, and observability that makes failure modes legible. A useful rule of thumb is that the eval team should be at least as large as the agent-building team, because the loop — not the agent — is the asset, and the loop is gated by how fast and how trustworthy your evaluation is.

## 2\. Concentrate Quality “Taste” in a Small, Elite Team

The hardest part of building great agents is not the plumbing — it is judgment. The ability to look at model output and know what is genuinely good for your customers, and to have an instinct for what the data is really saying, is a **skill that compounds with repetition**. That taste is the single **most valuable AI asset** a company can own, because it transfers across model generations even as the underlying technology churns.

This argues against spreading evaluation responsibility thinly across every product team. Talent this rare should be concentrated: put your best people on a small team whose full-time job is hill-climbing agent quality. They build the instinct; they own the bar. Diffuse the judgment across many teams and communication cost rises while the signal you get back fragments into inconsistent rubrics and thresholds.

![](https://media.beehiiv.com/cdn-cgi/image/fit=scale-down,format=auto,onerror=redirect,quality=80/uploads/asset/file/2a68c991-78da-4eb9-af66-136feccc9fed/image.png?t=1782151247)

The division of labor is clean. Product teams contribute the two things only they can — *domain-specific evaluation sets and tool lists* that encode what “good” means for their surface. The central team consumes those inputs and hill-climbs across all of them. This keeps domain knowledge where it lives while concentrating evaluation judgment where it compounds. Protecting this team from being diluted or reorganized into feature work is itself a strategic decision.

## 3\. Defer Over-Engineering; Ship End-to-End First

A common over engineering example is to build an abstraction layer up front for future models — future-proofing against whatever comes next. In practice you cannot reliably predict the shape or scope of the changes coming, so abstractions designed today usually miss, and meanwhile you pay a real upfront tax in development overhead, slower iteration, and complexity for flexibility you may never use. Worse, elaborate non-AI plumbing has a way of draining the team's momentum away from the only thing that actually moves quality.

So get the feedback loop small and let the system evolve. Reach a working end-to-end path first, even an ugly one — a rough-but-complete pipeline teaches you far more, far faster, than a sophisticated system that is not yet whole. Optimize for learning velocity now; let generality earn its place later, when the recurring need for it is something you have observed rather than guessed.

## Putting It Together

The three principles are one machine viewed from three angles.

- Principle 1 builds the loop and makes it fast.
- Principle 2 supplies the human judgment that makes the loop produce quality rather than just motion.
- Principle 3 removes the architectural overhead that would otherwise slow the loop down.

Together they describe a single operating model: a small elite team hill-climbing quality, fed by product-team eval sets and tool filters, running on infrastructure built for speed, shipping end-to-end and deferring generality until it earns its place. That team — and the taste it accumulates — becomes the most valuable AI asset the organization owns, because it is the one thing that survives every model swap.

**Ethan Wang** is a member of Google DeepMind, focused on building general-purpose agents on the path to AGI. He is a founding member of two of the org's flagship agent projects: Gemini Spark, the recently released general agent; and Mariner, company's first computer use agent.

**Namrata Ganatra** is Product and Engineering Leader, VP at Intuit and founder of the AI-Native Builders community where she is also an AI instructor. She previously founded an AI e-commerce startup and has held senior product and engineering leadership roles at Meta, Coinbase, Xero, and Microsoft.