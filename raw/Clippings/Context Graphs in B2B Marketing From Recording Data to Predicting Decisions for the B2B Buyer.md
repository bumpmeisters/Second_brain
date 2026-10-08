If you’re as terminally online as I am, you’ve read a lot about ‘context graphs’ recently. Context Graphs have achieved virality and notoriety thanks to Ashu Garg and Jaya Gupta from Foundation Capital in their incredible blog: The [next trillion-dollar opportunity](https://foundationcapital.com/context-graphs-ais-trillion-dollar-opportunity/).

And there’s been lots of discussion around whether context graphs are the [cause and solution](https://www.youtube.com/watch?v=SXyrYMxa-VI&t=3s) to all of life’s problems. While they might not be the silver bullet, they are incredibly useful and practical.

Context graphs provide AI systems with rich, more structured information, so they understand not just raw facts but how they relate how & why they matter, especially in areas where decisions are made. It helps empower AI agents with more autonomy by being more explainable (maybe accountable?) and in the process, do self-learn. This is the feedback loop in probabilistic systems that we are looking for.

In B2B marketing, a context graph is simply a data structure built from familiar entities and relationships. Examples of entities include buyers, accounts, content, and industries. Relationships typically include buyer behaviour like content engagement and actions buyers take, like filling out a form or connecting to sales. You can think of this graph as a rich layer of metadata that AI agents can navigate, using relationships to reason in ways that go beyond traditional vector lookups. This structure unlocks deeper context for downstream tasks, powers adaptive personalization, and lays the groundwork for more autonomous campaign agents. It shifts us from merely tracking “what happened” to truly understanding “why it happened” and “what should happen next.”

PathFactory sits right in the middle of that context graph. We provide the *content intelligence layer*: the detailed decision trace of what buyers choose to consume, how deeply they engage with content or how they interact conversationally with our buyer agent, [ChatFactory](https://www.pathfactory.com/platform/chatfactory). Together, these inputs allow us to use AI to infer buyer intent, buying stage, and next best action, turning raw engagement into actionable context.

In this post, we’ll use a real B2B buyer scenario to show how a context graph, powered by PathFactory’s content intelligence and enriched decision history, turns raw interactions into actionable predictions: who is likely to buy, what they care about, which stakeholders matter, and how to personalize every touch.

### Core Components of the B2B Buyer Context Graph:

1. **Entities (Nodes)**: The “things” in your system
	- Buyer, Account, Industry, Product, Content, Topic
2. **Relationships (Edges)**: How entities connect
	- `:linked_to`, `:belongs_to`, `:influences`, `:related_to`
3. **Properties (Attributes)**: Facts about entities
	- Job titles, engagement scores, contract values, timestamps
4. **Context**: The situational information that gives relationships meaning
	- *When* did they engage? *How* deeply? *In what sequence?* *Compared to similar buyers?*
5. **Inference Rules**: Logic that derives new knowledge from existing data
	- “If ACV > $100K, then `:StrategicAccount` ”
		- “If consumed case study + pricing content, then `:LateStageEvaluation` ”

Explicit Data Captured: This is what we ‘know’ happened (Who, What, When, Where)

```plaintext
:Marge :placedPurchaseOrder :PO2024-445 .

:PO2024-445 :hasLineItem :LineItem001 .

:LineItem001 :productOrdered :MarketingAutomationPlatform .

:Marge :worksFor :AccentCorp .

:AccentCorp :annualContractValue "125000.00"^^xsd:decimal .

:Marge :hasJobTitle "VP of Marketing" .

:PO2024-445 :contractTerm "36 months" .

# PathFactory Content Intelligence

:Marge :ChatFactoryConversations :[15 conversations]"How best to design ABM strategy for large complex enterprises, 'What are similar customers who have used this application that I am familiar with and in my industry', 'What is the average pricing model for large enteprise' .

:Marge :consumedContent :Whitepaper_ABM_Strategy .

:Marge :consumedContent :Video_MarketingOps_Demo .

:Marge :consumedContent :Case_Study_Enterprise_Implementation .

:Whitepaper_ABM_Strategy :hasTopicTag :AccountBasedMarketing, DemandGeneration .

:Video_MarketingOps_Demo :hasTopicTag :MarketingAutomation .

:Video_MarketingOps_Demo :hasTopicTag :LeadScoring .

:Case_Study_Enterprise_Implementation :hasTopicTag :EnterpriseDeployment .

:Marge :engagementScore "85"^^xsd:integer .

:Marge :timeOnContent "47 minutes"^^xsd:duration .

:Marge :contentSessionCount "12"^^xsd:integer .
```

PathFactory provides all the ‘Content Intelligence’ as context about Marge.

Inferred Data Captured: Inferred data uses other signals and data sources on top of the explicit events to generate new facts about Marge — helping us explain why she is making certain decisions and how her buying journey is likely to unfold.

```plaintext
:AccentCorp a :StrategicAccount .

:Marge :hasBuyingAuthority :MarketingSoftware .

:MarketingAutomationPlatform :purchasedBy :AccentCorp .

:AccentCorp :likelyNeedsProduct :CRMPlatform .

:Marge :influencesDecisionMaker :TomCTO .

:AccentCorp :inBuyingCycle :Q1_2025 .

:Marge :similarBuyerProfile :VPsAtMidMarketSaaS .

# PathFactory Content Intelligence Inferences
:Marge :interestedInTopic :AccountBasedMarketing, Marketing Automation, Enterprise Deployment .  # Topic aggregation from consumed content and Agent Conversations

:Marge :buyerJourneyStage :LateStageEvaluation .   # Inferred from case study consumption and Agent Conversations

:Marge a :HighIntentBuyer .             # Engagement score + time threshold

:AccentCorp :hasContentConsumer :Marge .            # Inverse relationship

:Marge :nextBestContent :ROI_Calculator  # Content recommendation based on journey

:Marge :contentPersona :TechnicalEvaluator .        # Persona inference from content mix

:AccentCorp :contentEngagementTrend :Increasing .   # Velocity pattern across sessions

:Marge :sharedContent :Video_MarketingOps_Demo .    # Inferred from forwarding/share behavior

:AccentCorp :evaluatingCompetitor :CompetitorX .    # Comparison content consumption pattern
```

Now let’s layer in the decisions that our B2B Buyer and their buying committee have made. And we can look at the company’s previous purchase of CRM as an example.

Decisions aren’t just outcomes that we capture. They’re rich entities with their own properties, participants, criteria, and consequences that shape future behavior.

### EXPLICIT (Captured decision data):

```plaintext
:Marge :madeDecision :Decision_MA_Platform_2024 .

:Decision_MA_Platform_2024 :decisionType :SoftwarePurchase .

:Decision_MA_Platform_2024 :selectedVendor :YourCompany .

:Decision_MA_Platform_2024 :rejectedVendor :CompetitorA .

:Decision_MA_Platform_2024 :rejectedVendor :CompetitorB .

:Decision_MA_Platform_2024 :decisionDate "2024-11-15"^^xsd:date .

:Decision_MA_Platform_2024 :evaluationDuration "120 days" .

:Decision_MA_Platform_2024 :involvedStakeholder :TomCTO .

:Decision_MA_Platform_2024 :involvedStakeholder :JaneCSO .

:Decision_MA_Platform_2024 :primaryCriteria :EnterpriseIntegration .

:Decision_MA_Platform_2024 :primaryCriteria :ROI .

:Decision_MA_Platform_2024 :budgetApproved "125000.00"^^xsd:decimal .

:Decision_MA_Platform_2024 :replacedProduct :LegacyMarketingTool .

# Historical decisions
:Marge :madeDecision :Decision_CRM_2022 .

:Decision_CRM_2022 :selectedVendor :Salesforce .

:Decision_CRM_2022 :decisionDate "2022-03-20"^^xsd:date .

:Decision_CRM_2022 :primaryCriteria :SalesTeamAdoption .
```

### INFERRED (Intelligence from decision history):

```plaintext
# Buyer behavior patterns
:Marge :preferredDecisionStyle :ConsensusBuilder .      # Inferred from stakeholder count

:Marge :averageEvaluationCycle "105 days" .             # Pattern from past decisions

:Marge :buyingCriteriaPreference :IntegrationOverPrice . # Weighted from decision criteria

:AccentCorp :preferredVendorProfile :EstablishedEnterprise . # Pattern from vendor selections

:Marge :decisionInfluencer :TomCTO .                    # Tom appears in multiple decisions

# Tech stack and dependencies
:AccentCorp :hasIncumbentStack :Salesforce .            # From past CRM decision

:YourCompany :integratesWith :Salesforce .              # Match increases likelihood

:Decision_MA_Platform_2024 :enabledBy :Decision_CRM_2022 . # Decision dependency chain

# Predictive signals
:AccentCorp :likelyNextDecision :DataWarehousePurchase . # Solution stack progression

:Marge :renewalDecision :Decision_MA_Platform_2024 .     # 36-month contract expires 2027

:AccentCorp :decisionVelocity :Accelerating .            # Time between decisions decreasing

# Risk factors
:Marge :hasVendorChurnHistory :HighChurn .              # Switched tools twice in 3 years

:Decision_MA_Platform_2024 :churnRisk :Medium .         # Based on past behavior patterns

# Stakeholder network
:TomCTO :frequentDecisionPartner :Marge .               # Co-occurred in 3+ decisions

:AccentCorp :decisionCommitteeSize "4-6 people" .       # Pattern from past purchases
```

---

Here’s what we have so far:

1. Who Marge is (buyer and account profile)
	- Role, authority, company, ACV, strategic account status, similar-buyer profile, committee size, incumbent stack.
2. What Marge does and cares about (intent and journey)
	- Content consumed, topics of interest, engagement level, journey stage, persona, competitive evaluation, and next-best content.
3. How Marge and her company make decisions (decision behavior and risk)
	- Past decisions and vendors, criteria, timing, and cycle length, stakeholders involved, preferred decision style, tech dependencies, predicted next decisions, churn history, and risk.

Here’s our Hypothesis about Marge:

- Marge has a 105-day average evaluation cycle
- She’s 90 days into current research (based on first content engagement)
- She requires enterprise integration (past criterion)
- She has Salesforce + your marketing automation platform already (integration requirement)
- Tom (CTO) was in her last 2 purchase committees
- **Action**: Alert sales that deal is likely in final 2 weeks; involve Tom proactively; lead with Salesforce/MA integration story; prepare enterprise implementation resources

Now let’s see how we can use this to drive a variety of personalized actions that can be delivered by an agent or a human (a carbon-based agent).

### 2\. Personalization at Scale

```plaintext
If :Marge :preferredDecisionStyle :ConsensusBuilder
→ Send multi-stakeholder content packages
→ Offer executive briefing sessions
→ Surface peer validation content

If :Marge :buyingCriteriaPreference :IntegrationOverPrice
→ Lead with integration stories
→ Deprioritize discount messaging
→ Connect with technical pre-sales early
```

### 3\. Competitive Intelligence

```plaintext
:Decision_MA_Platform_2024 :rejectedVendor :CompetitorA .
+ :CompetitorA :weakness :PoorEnterpriseSupport .

→ Inference: Emphasize white-glove support in future campaigns
```

### 4\. Relationship Intelligence

```plaintext
:TomCTO :frequentDecisionPartner :Marge .
→ If Tom engages with content, alert Marge's account rep
→ Multi-thread the account proactively
```

### 5\. Renewal Risk & Expansion

```plaintext
:Marge :hasVendorChurnHistory :HighChurn .
+ :Decision_MA_Platform_2024 :contractTerm "36 months" .

→ Flag for proactive customer success intervention
→ Trigger executive relationship program
→ Monitor engagement scores closely in months 24-36
```

---

Context graphs aren’t just another new AI thing; they’re the missing bridge between the data we’ve been hoarding and the decisions we actually need to influence. When you model buyers like Marge through their content journeys, decision history, tech stack, and stakeholder network, you stop *guessing* and start *predicting* who’s going to buy, when, why, and what moves them along.

This is exactly where PathFactory fits. We feed the context graph with high-fidelity content intelligence, agent conversations, and AI-driven inferences so every system around it — your CRM, MAP, ABM, sales plays, and customer success motions can act on richer, more precise buyer context.

And that allows us to deliver a better B2B buying experience. That’s ultimately what will drive the fastest purchasing experience in your favor.

## TL;DR

- A context graph turns a buyer like Marge from “a contact with activities” into a connected network of entities, behaviors, and decisions that explain why she buys and what she’ll do next.
- PathFactory supplies the high-fidelity content intelligence and AI-driven inferences that feed this graph: what she consumes, how deeply, in what sequence, and which topics signal intent and stage.
- By combining that content data with inferred signals and decision history, you can predict intent, timing, stakeholders, risk, and next best actions — then operationalize that context across CRM, MAP, ABM, sales, and CS to run more precise, profitable motions.

## Appendix

## Decision Chains: The Compounding Value

One of the most powerful aspects is modelling decision dependencies:

```plaintext
:Decision_CRM_2022 :enabledDecision :Decision_MA_Platform_2024 .

:Decision_MA_Platform_2024 :likelyEnablesDecision :FutureDataWarehouse .

# Chain reasoning
If they chose Salesforce CRM (2022)
→ They chose a MA platform that integrates with Salesforce (2024)
→ They'll likely choose a data warehouse that works with both (2025-26)
```