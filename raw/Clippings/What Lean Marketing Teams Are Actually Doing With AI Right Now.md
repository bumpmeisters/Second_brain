There’s no shortage of AI content out there – but most of it stays comfortably vague. Big predictions, theoretical frameworks, vendor pitches dressed up as advice. And even the more practical stuff often comes from enterprise teams with dedicated AI functions, engineering resources, and the luxury of running 6-month pilots.

Lean teams are working with a different set of constraints. When your marketing org is two or three people, you’re not debating governance frameworks or change management – you’re trying to find something that works, get it live, and move on to the next problem. Budget is limited, time is more limited, and there’s no IT team to hand things off to.

That’s what we set out to capture in our [most recent webinar](https://nurturenow.pathfactory.com/webinar/ai-for-lean-teams). We brought together three B2B marketing leaders – all running lean teams, all actively building with AI — and asked them to walk through exactly what they’re doing, what’s working, and what isn’t. Here’s what they shared.

### Meet the Panelists

All three panelists are on teams of four people or fewer:

**Chris Shuptrine**, VP of Marketing at Torii

**Emily Maxie**, Chief Growth Officer at Firm360

**Kristin McLaughlan**, VP of Marketing at HSO Canada

### The Use Cases

#### 1\. Automating Programmatic SEO Content – Chris Shuptrine

Chris thinks about content in three buckets: product announcements, thought leadership, and the listicles and comparison pages that some consider “marketing slop.” The third bucket existed long before AI, but AI makes a strong case for automating it.

**What he built:**

An orchestration workflow in Claude Code that takes a single prompt – something like “build a listicle about access review tools for HubSpot” – and does the rest. It researches relevant vendors, visits their websites to take real screenshots (not just homepage grabs), writes the article following a detailed style guide, runs it through a separate editing pass to strip AI markers, generates FAQ schema and metadata, and pulls a cover image. Total time: about 20–25 minutes. Chris’s input: roughly 30 seconds.

**What makes it work:**

Chris spent 2–3 months refining the prompts before he felt comfortable removing himself from the review process entirely. The iterative loop – reviewing outputs, identifying what wasn’t working, and updating the instructions accordingly – is what got it to the point where the workflow runs reliably on its own.

**The result:**

Roughly 5x increase in non-branded search traffic from Google over nine months, alongside meaningful growth in early-funnel leads. He publishes 5–10 articles per week – not a firehose, but consistent enough to compound.

#### 2\. A Simulated Focus Group – Emily Maxie

Firm360 sells to accounting firms. Which means from January through April, Emily loses access to basically her entire customer base – they’re heads-down in tax season. That constraint, combined with the limits of a one-and-a-half-person marketing team, pushed her to find a different way to get customer feedback.

**What she built:**

Emily started by using deep research to build out a 40-page persona document – not a one-pager, but a genuinely thorough breakdown of each buyer persona’s habits, buying behaviors, and decision criteria. That document was validated by Firm360’s product team and customer advisors before she used it to build a custom GPT that acts as a focus group facilitator. Its job: run conversations between Emily and one or more of her simulated personas, and specifically draw out disagreement, not consensus.

**What makes it work:**

She explicitly prompts for contrarian views – the personas are instructed to disagree with her and with each other. Before committing to any output, she takes it to her customer advisory board for a final gut check. The AI gets her to a more polished starting point; the humans validate it.

**The result:**

She uses it weekly – sometimes daily. The persona deep dives now serve as the source material for most of Firm360’s custom GPTs across marketing, sales, and product. The whole company is working from the same model of who their customer is.

#### 3\. An AI-Powered Case Study Generator – Kristin McLaughlan

HSO delivers complex enterprise implementations. Turning those projects into case studies should be straightforward – they have all the data – but in practice, it meant chasing down delivery managers, sales reps, and customers, then stitching everything together by hand. With a three-person marketing team and competing priorities, each one could take weeks.

**What she built:**

An agent that connects to the data that already exists across the customer lifecycle: sales call recordings, Teams meeting transcripts, CRM history, internal notes, and DevOps project logs. The agent generates a structured first draft of the case study – covering how the customer found HSO, their pain points, what alternatives they considered, what was delivered, and whether it came in on time and on budget. It starts the team at 70% rather than zero.

**What makes it work:**

Heavy prompt engineering was the real work here. Kristin spent a lot of time testing and refining the questions the agent asks to make sure the output is genuinely useful, not just plausible-sounding. Plus, a human reviews every draft before it goes anywhere near the customer.

**The result:**

More case studies, produced faster, with better storytelling. Sales has easier access to customer references. And as a side effect, the delivery team now writes cleaner DevOps notes – because they know that data is going to be used to tell the story of what they built.

One thing Kristin mentioned that’s worth flagging: in early testing, the agent occasionally hallucinated – filling in gaps with things that sounded right but weren’t. That’s exactly why the delivery team validation step isn’t optional. You don’t want a customer reading a case study that credits you with work you didn’t actually do.

### What Didn’t Work

One of Emily’s lessons learned: know when to stop building and just buy the thing. She spent a significant amount of nights-and-weekends time trying to build her own deal health and forecasting tool – pulling transcripts from Fireflies.ai, connecting to Salesforce data, trying to tie it all together. It never quite got there. She eventually bought Gong, which solved the problem well and came with capabilities she wouldn’t have built on her own.

Chris ran into AI agreeability – specifically, asking his company’s ChatGPT account to rank competitors in a new-to-Torii industry and getting back a response that put Torii at number one. When he pressed it, the AI admitted it had effectively just told him what it thought he wanted to hear. His takeaway: if your AI tools are connected to company accounts or data, they’re going to be biased toward it. Don’t trust outputs that tell you what you want to hear without checking.

The broader lesson all three agreed on: AI will fill in gaps with confident-sounding fiction if you let it. The human in the loop – the review step, the validation with a real customer or colleague – is what keeps the whole thing from going sideways.

They also flagged highly personalized AI outbound as a use case that sounds compelling but rarely pays off for small teams – lots of setup, limited scale, and a high cost when the personalization gets it wrong and erodes trust with the exact people you’re trying to sell.

### Advice for Teams Just Getting Started

The panel’s closing conversation surfaced some practical advice worth repeating:

**Start with what’s taking the most time, not what seems most impressive.** Emily tracks hours saved for every custom GPT she builds. That discipline – measuring before and after – keeps her focused on what actually matters instead of what’s interesting.

**Small wins compound.** Chris’s advice: get a Lovable account, play with it for twenty minutes, and you’ll immediately see the shape of what’s possible. From there, automate one small thing – and use the time you get back to build the next one.

**You don’t have to invent use cases from scratch.** Kristin’s team maintains an internal “book of prompts” – tried-and-tested prompts from across the company that anyone can use. Plus, she encouraged the audience to lean on communities, webinars, and peers to get started – someone has likely already figured out the use case you’re thinking about.

### Watch the Full Conversation

The use cases above are summaries – the full conversation goes deeper on the how, including a lot of back-and-forth on what to try first if you’re just getting started.

<iframe src="https://player.vimeo.com/video/1170392546?badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479" frameborder="0" allow="autoplay; fullscreen; picture-in-picture; clipboard-write; encrypted-media" title="AI for Lean Marketing Teams"></iframe>

You can also [watch the guided experience on PathFactory](https://nurturenow.pathfactory.com/webinar/ai-for-lean-teams).