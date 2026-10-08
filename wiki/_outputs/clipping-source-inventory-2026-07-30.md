---
type: analysis-output
status: active
created: 2026-07-30
updated: 2026-07-30
sources:
  - raw/Clippings/
---

# Clipping Source Inventory - 2026-07-30

**Summary**: Reproducible inventory of the services, websites, authors, channels, source identities, and metadata quality represented in `raw/Clippings/`. Source files were read only.

## Scope and method

- Snapshot root: `raw/Clippings/`
- Files are grouped by normalized source URL; YouTube URLs are grouped by video ID.
- URL query strings are ignored for identity grouping, so tracking and timestamp variants collapse.
- Exact duplicates are grouped by SHA-256.
- Service labels are inferred from the source URL. The single EML export is classified from its email headers.
- The inventory describes captured material, not all subscriptions, followed accounts, bookmarks, or feeds.

## Headline results

- Files: 465
- Markdown clippings: 464
- Email exports: 1
- Files with a source URL: 307
- Source URLs declared in frontmatter: 223
- Source URLs preserved in a body source line: 0
- YouTube URLs inferred from a leading embed: 84
- Files without a resolvable source URL: 158
- Unique normalized source identities: 225
- Additional files sharing an existing source identity: 83
- Additional byte-identical files: 98
- Unique source domains: 12
- Files without author/channel metadata: 280

## Services

| Service | Files | Unique sources | Share |
| --- | --- | --- | --- |
| youtube | 219 | 167 | 47.1% |
| missing-source-url | 157 | 0 | 33.8% |
| website | 84 | 53 | 18.1% |
| x-twitter | 2 | 2 | 0.4% |
| substack-web | 2 | 2 | 0.4% |
| substack-email | 1 | 1 | 0.2% |

## Most represented domains

| Domain | Files | Unique sources |
| --- | --- | --- |
| youtube.com | 213 | 163 |
| (missing) | 157 | 0 |
| demandbase.com | 36 | 20 |
| heinzmarketing.com | 32 | 20 |
| viableedge.com | 13 | 10 |
| youtu.be | 6 | 5 |
| x.com | 2 | 2 |
| sciencedirect.com | 1 | 1 |
| mattheinz.substack.com | 1 | 1 |
| pedowitzgroup.com | 1 | 1 |
| skool.com | 1 | 1 |
| lilyraynyc.substack.com | 1 | 1 |
| substack.com | 1 | 1 |

## Most represented YouTube authors or channels

| Author/channel | Files |
| --- | --- |
| (missing) | 84 |
| Demandbase | 51 |
| Fullfunnel io | 45 |
| Heinz Marketing | 30 |
| Austin Marchese | 2 |
| The Viable Edge | 2 |
| Matthew Berman | 1 |
| [[Teacher's Tech]] | 1 |
| Growth + EXIT Podcast | 1 |
| Ryan Doser | 1 |
| Nick Saraev | 1 |

## Most represented non-YouTube authors

| Author | Files |
| --- | --- |
| (missing) | 196 |
| Adam Sandler | 13 |
| Maria Geokezas | 6 |
| Winfield Salyards | 5 |
| Tom Swanson | 4 |
| Lisa Heay | 4 |
| Sarah Threet | 4 |
| Carly Bauer | 3 |
| Michelle Voznyuk | 2 |
| Heinz Marketing | 2 |
| [[@cyrilXBT]] | 2 |
| Karla Sanders | 2 |
| Matt Heinz | 1 |
| =?utf-8?b?S2llcmFuIEZsYW5hZ2FuIGZyb20gS2llcmFu4oCZcyBTdWJzdGFjayAtIFRo?= | 1 |
| Lily Ray | 1 |

## Legacy files without a canonical source URL

For unresolved legacy files, the first linked domain is retained only as a recovery signal. It may be an image host, CDN, cited source, or social profile and is not treated as verified provenance.

| First linked domain signal | Files |
| --- | --- |
| 6sense.com | 38 |
| substackcdn.com | 25 |
| (no-url) | 23 |
| pathfactory.com | 20 |
| fullfunnel.io | 5 |
| chatprd.ai | 5 |
| fullfunnel.b-cdn.net | 4 |
| linkedin.com | 3 |
| fullfunnel.substack.com | 3 |
| kieranflanagan.io | 3 |
| demandsage.com | 3 |
| x.com | 3 |
| d21y75miwcfqoq.cloudfront.net | 2 |
| pbs.twimg.com | 2 |
| ai-agent.camp | 2 |
| nurturenow.pathfactory.com | 2 |
| influ2.com | 1 |
| dealfront.com | 1 |
| wired.com | 1 |
| zapier.com | 1 |
| grow.cleverbridge.com | 1 |
| doi.org | 1 |
| cloudedjudgement.substack.com | 1 |
| media.beehiiv.com | 1 |
| lennysnewsletter.com | 1 |

## Capture dates

| Created | Files |
| --- | --- |
| 2026-05-28 | 1 |
| 2026-05-30 | 2 |
| 2026-07-22 | 64 |
| 2026-07-23 | 138 |
| 2026-07-26 | 1 |
| 2026-07-29 | 15 |
| 2026-07-30 | 2 |
| Fri, 3 Jul 2026 11:10:07 +0000 | 1 |

## Largest duplicate source-identity groups

| Identity | Files | Paths |
| --- | --- | --- |
| https://demandbase.com/resources/case-study/ingram-micro-increases-pipeline-velocity-with-demandbase | 7 | raw/Clippings/Case IQ levels up their ABM strategy and operations with Demandbase.md<br>raw/Clippings/Coalfire transforms ABM with Demandbase, achieving 40% pipeline growth.md<br>raw/Clippings/How Palo Alto Networks achieved greater marketing efficiency with buying groups.md<br>raw/Clippings/How Palo Alto Networks transformed lead management with Demandbase.md<br>raw/Clippings/How Zuora transformed their go-to-market strategy with Demandbase.md<br>raw/Clippings/Ingram Micro and CloudBlue increases pipeline velocity by 83%.md<br>raw/Clippings/SAP Concur increases funnel velocity by 4X using journey stages to personalize web experiences.md |
| https://demandbase.com/resources/case-study/hexagon-takes-the-guessing-game-out-of-abm-with-insights-from-demandbase | 7 | raw/Clippings/Accela propels sales to success by implementing Demandbase One.md<br>raw/Clippings/Deep Instinct dives deep into the data and sees exponential growth.md<br>raw/Clippings/Diebold Nixdorf eclipses campaign benchmarks with a combo of process, data & technology.md<br>raw/Clippings/Hexagon takes the guessing game out of ABM with insights from Demandbase.md<br>raw/Clippings/IBM uses Demandbase personalization to launch successful US Open campaign.md<br>raw/Clippings/MarketSource builds brand awareness and exceeds all advertising benchmarks using Demandbase One™.md<br>raw/Clippings/Procore partners with Inverta to launch best-in-class ABM program powered by Demandbase.md |
| youtube:rUcmq6CdaF0 | 4 | raw/Clippings/Leadership Strategies for Sales Managers Under Pressure.md<br>raw/Clippings/Sales Pipeline Radio - Matt Heinz and Steven Rosen.md<br>raw/Clippings/The Anti Social Buyer How CMOs are Leaning into Self-Service 1.md<br>raw/Clippings/The Anti Social Buyer How CMOs are Leaning into Self-Service.md |
| https://heinzmarketing.com/blog/does-your-ai-output-feel-generic-heres-why | 4 | raw/Clippings/AI Changed Lead Qualification. Has Your MQL Model Caught Up.md<br>raw/Clippings/Does Your AI Output Feel Generic Here’s Why 1.md<br>raw/Clippings/Does Your AI Output Feel Generic Here’s Why 2.md<br>raw/Clippings/Does Your AI Output Feel Generic Here’s Why.md |
| https://demandbase.com/resources/case-study/baker-tilly-crm-adoption | 4 | raw/Clippings/Driving data-driven growth How DISCO built a cross-functional ABM engine with Demandbase.md<br>raw/Clippings/How Moss Adams improved CRM adoption with Demandbase.md<br>raw/Clippings/How Tenable aligned its tactical priorities to its marketing goals.md<br>raw/Clippings/SEI Services drives complex sales rollout with Demandbase + Agency Partner.md |
| youtube:giSSemL1-BA | 4 | raw/Clippings/How to build a global, AI-native ABM function 1.md<br>raw/Clippings/How to create awareness among strategic accounts 2.md<br>raw/Clippings/How to create awareness among strategic accounts.md<br>raw/Clippings/Lifecycle marketing in 2026 How to engage with buyers in AI era.md |
| youtube:8hr_BKgWHQA | 3 | raw/Clippings/Kyle Lacy on Crafting your Path to CMO.md<br>raw/Clippings/Mary Gilbert on Implementing Systems Thinking in Marketing.md<br>raw/Clippings/Sara Whitwer on Lessons in Leadership, Culture, and Marketing Agility.md |
| https://heinzmarketing.com/blog/can-ai-content-break-through | 3 | raw/Clippings/Can AI content break through 1.md<br>raw/Clippings/Can AI content break through 2.md<br>raw/Clippings/Can AI content break through.md |
| https://viableedge.com/blog/hermes-agent-claude-code-orchestration | 3 | raw/Clippings/Hermes as an Orchestrator for Claude Code The Operator’s Guide.md<br>raw/Clippings/How to Scope AI Projects (Without Getting Burned).md<br>raw/Clippings/Viable Edge vs ChatGPT + a Doc When Copy-Paste Brand Voice Stops Working.md |
| youtube:52nf9vp08u4 | 3 | raw/Clippings/B2B ads masterclass 1.md<br>raw/Clippings/How to implement ABM strategy 3.0 1.md<br>raw/Clippings/How to implement ABM strategy 3.0.md |
| youtube:A5pjZwMJIRI | 3 | raw/Clippings/From ABM to PBM How ServiceNow Runs Deal-Based Marketing at Sprint Speed (Episode 66) 1.md<br>raw/Clippings/From ABM to PBM How ServiceNow Runs Deal-Based Marketing at Sprint Speed (Episode 66) 2.md<br>raw/Clippings/From ABM to PBM How ServiceNow Runs Deal-Based Marketing at Sprint Speed (Episode 66).md |
| youtube:F6rhLnrM7KQ | 3 | raw/Clippings/Client-led GTM How CMOs can drive sustainable, aligned growth  OnBase podcast.md<br>raw/Clippings/How AI is collapsing traditional GTM funnels and reshaping product marketing  OnBase podcast.md<br>raw/Clippings/Zero-click SEO How AI is disrupting the B2B buyer’s journey  OnBase podcast.md |
| youtube:wCWlQ1uEnlQ | 3 | raw/Clippings/Full-funnel marketing 2.0. Show marketing impact on revenue in 90 days 1.md<br>raw/Clippings/Full-funnel marketing 2.0. Show marketing impact on revenue in 90 days.md<br>raw/Clippings/How to create awareness among strategic accounts 1.md |
| youtube:KYVo7oF1qdY | 3 | raw/Clippings/Capturing demand signals.md<br>raw/Clippings/Demand generation for long sales cycle.md<br>raw/Clippings/How to handle leadership objections about demand gen & ABM.md |
| youtube:fqtzvBlUfSM | 3 | raw/Clippings/Demand generation through B2B thought leaders and sponsorships.md<br>raw/Clippings/Levels of Demand adjusting demand generation to the buyer journey.md<br>raw/Clippings/The ABM Team Structure That Actually Works  Fullfunnel & Dealfront.md |
| https://heinzmarketing.com/blog/ai-fails-in-b2b-marketing-and-sales-outreach | 3 | raw/Clippings/A Practical AI Playbook for 2026 Planning Where to Lean In—and Where to Tread Cautiously 2.md<br>raw/Clippings/When AI Goes Wrong in B2B Marketing and Sales Outreach 1.md<br>raw/Clippings/When AI Goes Wrong in B2B Marketing and Sales Outreach.md |
| https://heinzmarketing.com/blog/a-practical-ai-playbook-for-2026-planning-where-to-lean-in-and-where-to-tread-cautiously | 3 | raw/Clippings/A Practical AI Playbook for 2026 Planning Where to Lean In—and Where to Tread Cautiously 1.md<br>raw/Clippings/A Practical AI Playbook for 2026 Planning Where to Lean In—and Where to Tread Cautiously.md<br>raw/Clippings/Effectively Balancing AI and Human Touch in Marketing 1.md |
| youtube:QkmpSMfh9Vg | 2 | raw/Clippings/How to Create an Account-Based Playbook For Long Sales Cycles and Multiple Decision-Makers.md<br>raw/Clippings/How to talk with sales about ABM.md |
| youtube:V9SSusoVqZA | 2 | raw/Clippings/How to build a global, AI-native ABM function 2.md<br>raw/Clippings/How to build a global, AI-native ABM function.md |
| youtube:Rmb860RE7AI | 2 | raw/Clippings/How to Build Second Brains for Clients The AI Business I’d Start Today 1.md<br>raw/Clippings/How to Build Second Brains for Clients The AI Business I’d Start Today.md |
| https://viableedge.com/blog/viable-edge-vs-notion | 2 | raw/Clippings/Viable Edge vs Jasper Which One Do You Actually Need.md<br>raw/Clippings/Viable Edge vs Writer.com Enterprise Knowledge Graph or $29mo Knowledge Base.md |
| youtube:a2g3cL-ltZg | 2 | raw/Clippings/How SAP Built a Global ABM Playbook 138 Accounts, One Strategy (Episode 65) 1.md<br>raw/Clippings/How SAP Built a Global ABM Playbook 138 Accounts, One Strategy (Episode 65).md |
| https://demandbase.com/resources/case-study/wika-mobile-control-launches-into-new-markets-using-insights-powered-by-demandbase-one | 2 | raw/Clippings/Visier sees a 234% higher click-through rate with an ABM approach using Demandbase + LinkedIn.md<br>raw/Clippings/Why Tenable chose Demandbase.md |
| youtube:WQDkc9EUid8 | 2 | raw/Clippings/How modern ABM works From account selection to execution  OnBase podcast.md<br>raw/Clippings/The architect CMO Why operations, not ideas, unlock great creative  OnBase podcast.md |
| youtube:sBKmu_LaS5E | 2 | raw/Clippings/How Workday Tripled Deal Size with ABX - 3× Value, 2× Win Rate (Episode 75).md<br>raw/Clippings/Mastering Public Sector ABM RFP Reality, Hidden Buyers & CTV Wins (Episode 74).md |

## Automation implications

- YouTube should be treated as its own intake adapter using the video ID as the immutable identity and author metadata as the channel label.
- High-volume publisher domains are candidates for RSS or site-specific discovery; long-tail websites are better served by a one-click URL queue.
- LinkedIn and X/Twitter need a separate, session-aware or explicit-share path because normal unauthenticated scraping is less reliable.
- Newsletter email should route through the existing newsletter workflow rather than be mixed into generic web clipping.
- Missing URLs, missing authors, source-identity duplicates, and exact duplicates should block automatic admission or go to quarantine.
- Filename generation should happen only after canonical title and source identity are known.

## Generated data

- Row-level inventory: `wiki/_outputs/clipping-source-inventory-2026-07-30.csv`
- Generator: `tools/new-clipping-source-inventory.ps1`
