## Post

## Conversation

the four types of agent loops. loop engineering keeps getting talked about as one thing. it's actually a choice between four structures, and each one fits a different kind of task. it means designing the system that steers the agent, instead of steering it yourself move by move. that system always answers two questions. what starts a run, and what decides the work is done. in a hand-run session you answer both yourself, every single time. each loop type moves more of that into the system. here's each type, what triggers it, and when to reach for it. 1) turn-based. triggered by a user prompt. the agent gathers context, acts, and checks its work inside a single turn, then a human reviews the output and writes the next prompt. use this when requirements are still forming and every output changes what you'd ask for next. 2) goal-based. triggered by a /goal command carrying success criteria and a budget, like "get the homepage Lighthouse score to 90, stop after 5 tries." when the agent tries to stop, an evaluator model checks whether the goal is met, and a no sends it back to work. use this when the outcome is measurable but the path there isn't worth your attention. 3) time-based. triggered by a clock. an interval fires, the agent runs a fixed prompt like "check the PR, fix CI," then waits for the next tick. /loop runs on your machine, /schedule moves it to the cloud so it survives a closed laptop. use this for recurring work where the task is known in advance and only the timing repeats. 4) proactive. triggered by an event or schedule with no human present. a routine watches a channel, and when something needs handling it spawns a workflow with a triage agent, a fix agent, and a reviewer that adversarially judges the work before the task closes. use this for standing responsibilities where you can't predict what will come in, only that something will. each type hands off one more job than the last. turn-based keeps both with the human, goal-based automates the checking, time-based automates the trigger, and proactive automates both while deciding the workflow shape at runtime. so the mapping question isn't which loop is most advanced. it's whether your task is exploratory, measurable, recurring, or standing. the more you hand off, the less you babysit. I wrote the full breakdown on loop engineering. the article is quoted below.

<video aria-label="Embedded video" src="https://video.twimg.com/tweet_video/HNIXh5_bgAA4fi5.mp4" type="video/mp4" controls=""></video>

GIF

Quote

Akshay

@akshay\_pachaar

Jun 22

Loop Engineering Clearly Explained

Half your feed is suddenly saying the same thing. Stop prompting your agents, start engineering loops. Boris Cherny, the person who built Claude Code, said it plainly: "I don't prompt Claude anymore....

Post your reply[Harry Tandy](https://x.com/HarryTandy)[@HarryTandy](https://x.com/HarryTandy)

[2h](https://x.com/HarryTandy/status/2076750289453920418)

this is the clearest breakdown of agent loops yet[59](https://x.com/HarryTandy/status/2076750289453920418/analytics)[Blum](https://x.com/Blum_OG)[@Blum\_OG](https://x.com/Blum_OG)

[2h](https://x.com/Blum_OG/status/2076748715012870585)

this is a really clean way to frame it the mapping to task type makes it click[58](https://x.com/Blum_OG/status/2076748715012870585/analytics)[Stats Wire](https://x.com/StatsWire)[@StatsWire](https://x.com/StatsWire)

[2h](https://x.com/StatsWire/status/2076752096922362110)

There are more loops like manager and orchestrator?[29](https://x.com/StatsWire/status/2076752096922362110/analytics)

## Discover more

Sourced from across X[Charly Wargnier](https://x.com/DataChaz)[@DataChaz](https://x.com/DataChaz)

[13h](https://x.com/DataChaz/status/2076571482201997476)

Want to run a 70B+ model but don't have an 80GB GPU? Mesh LLM distributes inference across the devices you actually have. The architecture is incredibly smart: → If a node can fit the model, it runs locally → If not, it routes to a peer that can → If the model is too big for

[![Image](https://pbs.twimg.com/media/HNF2wi6bkAABQb4?format=jpg&name=900x900)](https://x.com/DataChaz/status/2076571482201997476/photo/1)

An 82K-star GitHub repo is built around one painfully obvious idea: Your coding agent should map the codebase once, not grep it forever. Graphify turns an entire project into a queryable knowledge graph. Functions, classes, files, SQL schemas, infrastructure, docs, PDFs,

[![Image](https://pbs.twimg.com/media/HM_DS19bkAAgKsp?format=jpg&name=900x900)](https://x.com/techNmak/status/2076092909372453048/photo/1)