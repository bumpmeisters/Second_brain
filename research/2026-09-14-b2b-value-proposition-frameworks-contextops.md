# B2B Value Proposition Frameworks for a ContextOps / Marketing Second Brain

## Scope

This analysis focuses on **B2B Value Proposition Strategy and Design**, not copywriting. It keeps **positioning** analytically separate from the value proposition and prioritizes a small number of high-substance frameworks that are operationalizable in a ContextOps / LLM environment.

The objective is not to identify one universal “best” framework. The stronger architecture combines complementary frameworks that solve different jobs: customer-value discovery, value-driver coverage, causal value mapping, competitive and economic value analysis, proposition selection, and implementation governance.

---

# 1. Shortlist of the Strongest Frameworks

| # | Framework | Primary function | ContextOps verdict |
|---|---|---|---|
| 1 | Outcome-Driven Innovation / JTBD Needs Framework | Customer reality + unmet outcomes | **Core** |
| 2 | Anderson–Narus Customer Value Models | Customer value + quantification | **Core** |
| 3 | Anderson–Narus–van Rossum Resonating Focus | Competitive value + final VP selection | **Core** |
| 4 | Bain B2B Elements of Value | Complete value-driver taxonomy | **Core / enrichment** |
| 5 | Means–End Chain / Laddering | Capability → consequence → value | **Core mapping layer** |
| 6 | Payne–Frow–Steinhoff–Eggert B2B VP Framework | Governance, co-creation, implementation | **Operating layer** |
| 7 | Value Proposition Canvas | Jobs/pains/gains ↔ offering fit | **Useful interface, not core engine** |
| 8 | Economic Value to the Customer (EVC) | Relative economic value / pricing | **Specialist module** |

The shortlist is deliberately functional rather than simply ranked. ODI solves a different problem from Bain; Bain solves a different problem from Resonating Focus; Payne orchestrates the overall process. Treating all of them as interchangeable “value proposition frameworks” would create methodological duplication.

---

# 2. Outcome-Driven Innovation / JTBD Needs Framework

**Origin:** Anthony W. Ulwick; early methodological publication in *Harvard Business Review* (2002), later developed into Outcome-Driven Innovation (ODI).

## Core problem

The framework asks:

> **What progress is the customer trying to make, by which outcomes do they judge success, and which important outcomes are currently underserved?**

It shifts discovery away from requested features and toward stable customer jobs and measurable desired outcomes.

## Core logic

**Job → Job Steps → Desired Outcomes → Importance → Current Satisfaction → Unmet Outcomes → Opportunity Priorities → Segment / Value Proposition Opportunity**

Its central ContextOps strength is the separation of **need** from **solution**. A product feature must not be reverse-engineered into a customer need and then stored as if it were an observed fact.

## Required inputs

**Mandatory:**
- Job executor
- Job-to-be-Done
- Job process / job steps
- Desired outcomes
- Importance
- Current satisfaction

**Optional:**
- Stakeholders / roles
- Situation / trigger
- Alternatives
- Outcome-based segments

**Primary research dependence:** High. Secondary context can create outcome hypotheses, but validated ODI conclusions normally require direct Voice-of-Customer and quantitative validation.

## Outputs

- Core job
- Job map
- Desired outcome inventory
- Importance scores
- Satisfaction scores
- Underserved outcomes
- Opportunity ranking
- Outcome-based segments
- Value proposition opportunity space

## ContextOps questions

| ID | Question | Expected output |
|---|---|---|
| ODI-01 | Who actually executes the relevant job? | Job executor |
| ODI-02 | What stable, solution-independent job is this actor trying to accomplish? | Core job |
| ODI-03 | What steps constitute successful execution of this job? | Job map |
| ODI-04 | By which measurable criteria does the customer judge success at each job step? | Desired outcomes |
| ODI-05 | How important is each outcome? | Importance |
| ODI-06 | How well do current alternatives satisfy each outcome? | Satisfaction |
| ODI-07 | Which outcomes are both important and insufficiently satisfied? | Unmet outcomes |
| ODI-08 | Are there customer groups with materially different patterns of underserved outcomes? | Outcome segments |
| ODI-09 | Which 3–5 outcomes deserve strategic priority? | Target outcomes |

## Capability → Value mapping

**Weak to medium.** ODI is excellent at defining the customer outcome but says less about the concrete company capability that produces it. It should therefore sit **upstream** of capability-to-value mapping.

## Buying committee / multi-stakeholder value

**Medium.** Different job executors and stakeholders can be analyzed, but buying-committee conflicts are not native to the method.

## Competitive value

**Good.** Satisfaction with current solutions can reveal opportunity, but ODI does not distinguish point of parity vs. point of difference as explicitly as Anderson/Narus.

## Quantification

**Very strong for need-opportunity quantification; medium for economic value.**

## Proof orientation

Outcome scores constitute research evidence, but they do not prove that the vendor’s solution will deliver the desired outcome.

## Main strength

One of the strongest methods for identifying **which customer outcomes actually deserve strategic attention**.

## Main risk / misuse

An LLM may infer plausible desired outcomes from marketing material and accidentally promote them to validated customer truths.

**ContextOps guardrail:** Desired outcomes inferred only from secondary sources must remain `HYPOTHESIS` until supported by customer evidence.

---

# 3. Anderson–Narus Customer Value Models

**Origin:** James C. Anderson & James A. Narus, especially “Business Marketing: Understand What Customers Value,” *Harvard Business Review* (1998).

## Core problem

> **What is our offering actually worth to the customer relative to the customer’s alternative?**

The method is designed to move B2B marketing away from generic benefit claims toward empirically grounded customer value models.

## Core logic

**Customer Process → Value Elements → Baseline / Alternative → Performance Difference → Customer Consequence → Monetary Value → Customer Value Model → Proof**

Value is explicitly relative to a reference alternative rather than assessed in isolation.

## Required inputs

- Customer processes
- Customer cost structure
- Current solution / baseline
- Next-best alternative
- Performance data
- Operational data
- Customer economics
- Implementation costs
- Usage data
- Customer-specific assumptions

**Primary research dependence:** Strongly preferred. Secondary information can support an initial hypothesis model, but monetary claims should not be treated as validated without customer-specific evidence.

## Outputs

- Value elements
- Customer value model
- Monetary value per element
- Customer-specific value estimate
- Segment-level value model
- Value calculator
- Baseline
- Post-implementation value evidence

## ContextOps questions

| ID | Question | Expected output |
|---|---|---|
| CVM-01 | Which alternative does the customer use today? | Baseline |
| CVM-02 | Which activities, costs, risks or results does our offering affect? | Value elements |
| CVM-03 | How does our performance differ from the baseline alternative? | Performance delta |
| CVM-04 | What operational consequence follows from that delta? | Customer consequence |
| CVM-05 | What cost, revenue, time or risk impact follows? | Business impact |
| CVM-06 | How can this impact be quantified with customer data? | Monetary value |
| CVM-07 | Which assumptions underpin every calculation? | Assumption ledger |
| CVM-08 | Which values come directly from the customer and which are estimates? | Evidence quality |
| CVM-09 | What value was actually realized after implementation? | Verified value |

## Capability → Value mapping

**Very strong.** A practical B2B chain is:

**Capability → Performance Difference → Operational Consequence → Business Outcome → Economic Value → Evidence**

This makes Anderson/Narus one of the strongest building blocks for the target ContextOps object.

## Multi-stakeholder capability

**Medium.** The model primarily focuses on economic customer value. Stakeholders can be modeled separately but are not native objects.

## Competitive value

**Very strong.** Value is explicitly assessed relative to the alternative.

## Value quantification

**5/5.**

## Proof orientation

**5/5.** The method pushes marketing and sales from claims toward auditable value models.

## Typical misuse

False precision, for example claiming “37% time savings” when the figure is based on a generic internal benchmark rather than verified customer data.

**ContextOps implication:** Every variable in the value model should carry provenance and confidence metadata.

---

# 4. Anderson–Narus–van Rossum: Resonating Focus

**Origin:** James C. Anderson, James A. Narus & Wouter van Rossum, “Customer Value Propositions in Business Markets,” *Harvard Business Review* (2006).

The authors distinguish three approaches:

1. All Benefits
2. Favorable Points of Difference
3. **Resonating Focus**

Resonating Focus concentrates the proposition on the one or two differences that create the greatest relevant customer value versus the next-best alternative.

## Core problem

> **Of all the things we can claim, which one or two differences genuinely matter enough to drive preference?**

## Core logic

**Customer Priority + Next-Best Alternative → Value Elements → Parity / Difference / Contention → Customer Value → Prioritization → Proof → Resonating Value Proposition**

The framework’s key classifications are:

- **Point of Parity**
- **Point of Difference**
- **Point of Contention**

## Required inputs

- Target segment
- Customer priorities
- Next-best alternative
- Own offering
- Competitor performance
- Customer-value research
- Customer economics
- Proof

## Outputs

- Competitive value map
- Points of parity
- Points of difference
- Points of contention
- Resonating value drivers
- Supporting proof
- Core value proposition

## ContextOps questions

| ID | Question | Expected output |
|---|---|---|
| RF-01 | What is the customer’s real next-best alternative? | Next-best alternative |
| RF-02 | Which value elements affect the decision? | Value elements |
| RF-03 | On which elements is there factual parity? | Points of parity |
| RF-04 | On which elements are we demonstrably better or worse? | Points of difference |
| RF-05 | Where does customer perception differ from our own assessment? | Points of contention |
| RF-06 | Which differences affect outcomes the customer considers highly important? | Relevant PODs |
| RF-07 | What value does each relevant difference create? | Relative value |
| RF-08 | Which one or two differences create the greatest sustainable customer value? | Resonating focus |
| RF-09 | What evidence proves each selected difference? | Proof |

## Capability → Value mapping

**Very good when combined with a Customer Value Model.** Resonating Focus provides the selection logic more than the full causal chain.

## Multi-stakeholder capability

**Weak to medium.** Not native. ContextOps should therefore force the question: **Relevant for which stakeholder?**

## Competitive value

**5/5.** This is where the framework is superior to many popular workshop canvases.

## Quantification

**Good to very good**, especially when paired with Customer Value Models.

## Proof orientation

**5/5.** Unsubstantiated differentiation is methodologically weak under this approach.

## Strategic implication

A useful ContextOps rule is:

> **A benefit is not yet a value proposition. A relevant benefit is not yet differentiation. Differentiation is not yet a strong value proposition until its relative customer value is supported by evidence.**

---

# 5. Bain B2B Elements of Value

**Origin:** Eric Almquist, Jamie Cleghorn & Lori Sherer, Bain / *Harvard Business Review* (2018).

The model identifies **40 B2B Elements of Value** across five levels:

- Table Stakes
- Functional
- Ease of Doing Business
- Individual
- Inspirational

Its importance for complex B2B is that customer value is explicitly broader than price, cost and product performance. The taxonomy includes personal and career-oriented factors such as reduced anxiety, reputational assurance and marketability alongside strategic and functional factors.

## Core problem

> **Which forms of value might we miss if we look only at functional and economic benefits?**

## Core logic

**Customer Situation → Candidate Value Elements → Importance → Current Performance → Stakeholder Differences → Prioritization → Value Portfolio**

Bain is better understood as a **value taxonomy and diagnostic library** than as a complete value-proposition development system.

## Required inputs

- Customer interviews
- Surveys
- Satisfaction / NPS
- Win/Loss data
- Stakeholder roles
- Competitor perception
- Relationship data
- Market context

## Outputs

- Value-driver inventory
- Stakeholder value profiles
- Value gaps
- Table stakes
- Functional drivers
- Ease-of-business drivers
- Individual drivers
- Inspirational drivers

## ContextOps questions

| ID | Question | Expected output |
|---|---|---|
| BEO-01 | Which table stakes must every acceptable solution meet? | Table stakes |
| BEO-02 | Which economic and performance values matter? | Functional value |
| BEO-03 | Which factors make collaboration and operation easier? | Ease-of-business value |
| BEO-04 | Which strategic risks or opportunities does the provider influence? | Strategic value |
| BEO-05 | Which personal risks, anxieties or career interests exist? | Individual value |
| BEO-06 | Which reputational or social effects matter? | Personal / career value |
| BEO-07 | Which value elements differ by stakeholder? | Stakeholder value map |
| BEO-08 | Which important value elements are currently delivered poorly? | Value gaps |
| BEO-09 | Which elements can competitors deliver equally well? | Parity candidates |

## Capability → Value mapping

**Weak.** The taxonomy helps identify *what* customers may value, but it does not explain *why the vendor’s capability creates that value*.

## Multi-stakeholder capability

**Good.** Not a buying-committee workflow, but conceptually much richer than most VP frameworks.

## Competitive value

**Medium.** Competitive benchmarking is possible but not structurally mandatory.

## Quantification

Primarily importance and perception; weaker for direct economic value.

## Proof orientation

**Weak.**

## Best role in ContextOps

Bain is an excellent **coverage check**:

> “Are we missing relevant dimensions of value?”

It should not be used as the sole answer to:

> “Which value dimensions are actually purchase-driving?”

That requires customer evidence.

---

# 6. Means–End Chain / Laddering

**Origin:** Jonathan Gutman, *Journal of Marketing* (1982); later operationalized through Laddering by Reynolds & Gutman.

The model links perceived product attributes to consequences and ultimately to higher-order values.

## Core problem

> **Why is a particular product, service or capability attribute valuable to the customer at all?**

## Core logic

**Attribute / Capability → Consequence → Higher-Order Consequence → Personal / Organizational Value**

Laddering repeatedly asks a variant of “Why is that important?” so the analysis does not stop at a feature or superficial benefit.

## Required inputs

- Attributes
- Features
- Capabilities
- Customer interviews
- Usage context
- Stakeholder role
- Consequences

## Outputs

- Attribute–consequence–value chains
- Hierarchical value maps
- Underlying motivations
- Stakeholder-specific value chains

## ContextOps questions

| ID | Question | Expected output |
|---|---|---|
| MEC-01 | Which concrete capability or attribute is relevant? | Attribute / capability |
| MEC-02 | What does this capability immediately change for the customer? | Functional consequence |
| MEC-03 | Why is that consequence important? | Higher-order consequence |
| MEC-04 | Which business outcome follows from it? | Business outcome |
| MEC-05 | Why is that outcome valuable to this stakeholder? | Stakeholder value |
| MEC-06 | Which personal, strategic or organizational motivation sits underneath it? | End value |
| MEC-07 | Are there alternative capability-to-value paths? | Competing chains |
| MEC-08 | Which parts of the chain are evidenced and which are assumptions? | Evidence gaps |

## Capability → Value mapping

**5/5 as a structural logic.** For B2B, the model should be extended to:

**Capability → Operational Consequence → Business Outcome → Organizational Value → Stakeholder Value → Evidence**

The evidence element is a ContextOps extension rather than part of the original model.

## Multi-stakeholder capability

**Very good when extended.** The same operational consequence can create different forms of value for different stakeholders.

Example:

`Automation → less manual work`

may create:
- COO → lower operating cost
- User → less repetitive work
- CIO → cleaner integration / architecture
- CFO → lower TCO
- Line manager → lower error and reputation risk

## Competitive value

Not native.

## Quantification

Not native.

## Proof orientation

Not native.

## Main limitation

Means–End theory originates in consumer research. Complex B2B use therefore requires extension beyond individual values toward organizational, departmental, strategic and economic value.

## Why it remains important

Among the reviewed frameworks, it offers the cleanest base logic for:

> **Capability → Consequence → Outcome → Value**

---

# 7. Payne–Frow–Steinhoff–Eggert: Comprehensive B2B Value Proposition Development Framework

**Origin:** Payne, Frow, Steinhoff & Eggert, *Industrial Marketing Management* (2020).

The framework treats B2B value proposition development as a broader strategic and organizational process rather than merely the creation of a proposition statement. It links business model, customer needs, value co-creation, implementation, documentation and learning.

A useful process view is:

**Value Design & Assessment → Value Quantification → Value Communication → Value Documentation → Value Verification / Review**

## Core problem

> **How is a value proposition developed, implemented, learned from and continuously improved as a strategic B2B system?**

## Core logic

**Business Model + Customer Value Dimensions + Co-Creation + Ecosystem → VP Design → Quantification → Communication → Documentation → Verification → Learning / Adaptation**

## Required inputs

- Strategic choices
- Business model
- Segments
- Customer needs
- Value dimensions
- Resources
- Competencies
- Value network
- Customer interaction
- Ecosystem actors
- Competitive context
- Realized value

## Outputs

Rather than one canvas, the framework supports:

- VP strategy
- Business-model alignment
- Segment-specific VP
- Quantified value
- Communication
- Value documentation
- Verified value
- Learning loop

## ContextOps questions

| ID | Question | Expected output |
|---|---|---|
| PAY-01 | Which strategic choices and business model must the VP support? | Strategic context |
| PAY-02 | For which segment and at what level of granularity is the VP being developed? | VP scope |
| PAY-03 | Which customer-value dimensions matter? | Customer value |
| PAY-04 | Which resources and capabilities enable value creation? | Firm value system |
| PAY-05 | Which customer and ecosystem actors participate in value creation? | Co-creation map |
| PAY-06 | What value do we specifically promise? | Value design |
| PAY-07 | How can this value be quantified? | Quantified value |
| PAY-08 | How is the VP operationalized internally and externally? | Communication |
| PAY-09 | How is actually created value documented? | Documentation |
| PAY-10 | Does realized value match promised value? | Verification |
| PAY-11 | Which insights should change the VP, offering or delivery model? | Learning loop |

## Capability → Value mapping

Conceptually strong, although less mechanically precise than Means–End or Customer Value Models.

## Multi-stakeholder capability

**Good.** Customer interaction, co-creation and broader ecosystem actors fit complex B2B reality well.

## Competitive value

**Good**, but Resonating Focus provides more precise relative-value selection logic.

## Quantification

**Good.**

## Proof orientation

**Very good**, especially because of documentation and verification.

## Best role in ContextOps

Payne is best used as the **orchestration / governance framework**, not as the single reasoning engine for customer discovery.

---

# 8. Value Proposition Canvas

**Origin:** Alexander Osterwalder, Yves Pigneur, Greg Bernarda & Alan Smith, *Value Proposition Design* (2014).

The canvas connects:

**Customer Profile**
- Jobs
- Pains
- Gains

with:

**Value Map**
- Products & Services
- Pain Relievers
- Gain Creators

The purpose is to assess and test “fit” between the customer profile and the value map.

## Core problem

> **Does our offering meaningfully address the jobs, pains and gains that matter to this customer?**

## Core logic

**Customer Jobs / Pains / Gains → Prioritization → Products & Services → Pain Relievers / Gain Creators → Fit → Testing**

## Required inputs

- Segment
- Jobs
- Pains
- Gains
- Offering
- Product / service features
- Validation evidence

## Outputs

- Customer profile
- Value map
- Fit hypothesis
- Value proposition hypothesis

## ContextOps questions

| ID | Question | Expected output |
|---|---|---|
| VPC-01 | For which specific customer and situation are we analyzing value? | Customer context |
| VPC-02 | Which functional, social and emotional jobs exist? | Jobs |
| VPC-03 | Which obstacles, risks and negative outcomes occur? | Pains |
| VPC-04 | Which outcomes or positive effects are desired? | Gains |
| VPC-05 | Which jobs, pains and gains matter most? | Priority profile |
| VPC-06 | Which products and services address these priorities? | Offering map |
| VPC-07 | How does each offering element reduce a pain? | Pain relievers |
| VPC-08 | How does each offering element create a gain? | Gain creators |
| VPC-09 | Which links are evidenced and which are assumptions? | Fit evidence |

## Capability → Value mapping

**Medium.** Products/services → pain relievers/gain creators is useful but too coarse for the full causal chain required by the Second Brain.

## Multi-stakeholder capability

**Weak.** Multiple canvases can be created, but the buying committee is not modeled as a system.

## Competitive value

**Medium to weak.** Competition can be layered on, but the core canvas does not structurally force a next-best-alternative comparison.

## Quantification

**Weak.**

## Proof orientation

**Weak to medium.**

## Strategic verdict

The Value Proposition Canvas is excellent as a **human interface and workshop view**. It is not sufficiently strong as the primary reasoning engine for a ContextOps system.

---

# 9. Economic Value to the Customer (EVC)

**Origin:** John L. Forbis & Nitin T. Mehta, McKinsey (1979).

EVC is particularly useful in B2B settings where acquisition, operation and switching create material economic consequences.

## Core problem

> **How much more economic value does our solution create than the customer’s next-best alternative?**

## Core logic

**Next-Best Alternative + Incremental Revenue / Performance Value + Cost Savings – Incremental / Switching Costs = Total Economic Value**

## Required inputs

- Next-best alternative
- Alternative price
- Revenue impact
- Cost impact
- Implementation cost
- Operating cost
- Switching cost
- Performance delta
- Time horizon

## Outputs

- Reference value
- Differentiation value
- Total economic value
- Customer surplus
- Economic price ceiling

## ContextOps questions

| ID | Question | Expected output |
|---|---|---|
| EVC-01 | What is the economically realistic next-best alternative? | Reference alternative |
| EVC-02 | What does that alternative cost? | Reference value |
| EVC-03 | What additional revenue can our solution create? | Revenue value |
| EVC-04 | Which costs can it reduce? | Cost value |
| EVC-05 | Which additional costs does it create? | Negative value |
| EVC-06 | Which switching, integration and implementation costs occur? | Adoption cost |
| EVC-07 | What is the net differentiation value? | Differentiation value |
| EVC-08 | Which assumptions most affect the result? | Sensitivity variables |
| EVC-09 | How much of the created value remains with the customer? | Customer surplus |

## Capability → Value mapping

Very good for **economic value**, weak for personal, reputational or strategic optionality value.

## Multi-stakeholder capability

**Weak.**

## Competitive value

**5/5.**

## Quantification

**5/5.**

## Proof orientation

**Good**, provided customer-specific data supports the model.

## Best role in ContextOps

A specialized **Economic Value Engine**, not the general value-proposition framework.

---

# 10. Comparison Matrix

Scores: **1 = weak, 5 = very strong**.

| Framework | B2B | Customer Insight | Multi-Stakeholder | Differentiation | Quantification | Proof | Strategic Depth | ContextOps Fit | Evidence Quality |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| ODI / JTBD | 4 | **5** | 3 | 4 | 3 | 3 | **5** | 4 | **5** |
| Anderson Customer Value Model | **5** | 4 | 3 | **5** | **5** | **5** | **5** | 4 | **5** |
| Resonating Focus | **5** | 4 | 3 | **5** | 4 | **5** | **5** | **5** | **5** |
| Bain B2B Elements | **5** | 4 | 4 | 3 | 2 | 2 | 4 | **5** | 4 |
| Means–End Chain | 3 | **5** | 4 | 2 | 1 | 2 | 4 | 4 | **5** |
| Payne et al. | **5** | 4 | 4 | 4 | 4 | **5** | **5** | 4 | **5** |
| Value Proposition Canvas | 4 | 4 | 2 | 3 | 2 | 2 | 3 | **5** | 4 |
| EVC | **5** | 2 | 2 | **5** | **5** | 4 | 4 | **5** | 4 |

## Interpretation of notable scores

**Value Proposition Canvas = easy to operationalize, strategically thinner.** Its clear structure is LLM-friendly, but that same simplicity raises the risk of plausible invented pains and gains.

**ODI = high strategic depth, but research hungry.** An LLM can structure ODI analysis but cannot legitimately substitute for customer research.

**Resonating Focus = strongest final proposition decision logic.** It forces both relevance and relative superiority.

**Payne = strongest governance model.** It does not replace discovery but provides an excellent architecture for the complete value-proposition lifecycle.

---

# 11. Framework Overlap and Redundancy

## VPC vs. ODI

There is significant overlap:

- `Customer Jobs` ≈ `Job-to-be-Done`
- `Gains` partially overlap with `Desired Outcomes`

The difference is material: **ODI operationalizes customer needs with greater precision and measurability.**

**Recommendation:** ODI as the deep reasoning engine; VPC as an optional visualization layer.

## VPC vs. Bain

Pains and gains are open categories. Bain provides a controlled and broader **value vocabulary**. This makes Bain useful as a coverage check for dimensions such as personal, relational and strategic value.

## ODI vs. Bain

Highly complementary:

- ODI: **Which outcomes are important and underserved?**
- Bain: **Which dimensions of value may sit behind those outcomes?**

## Bain vs. Means–End

Complementary:

- Bain provides the **value vocabulary**.
- Means–End provides the **causal structure**.

## Customer Value Model vs. EVC

There is substantial overlap. Both quantify value relative to alternatives.

- EVC is narrower and more pricing-oriented.
- Anderson/Narus is broader and connects discovery, value quantification, proof and value proposition development.

**Recommendation:** Treat EVC as a specialized module inside Customer Value Quantification, not as a parallel core framework.

## Resonating Focus vs. Positioning

They are not the same construct.

**Resonating Focus asks:**
> Which relative customer value should dominate the value proposition?

**Positioning asks more broadly:**
> Which differentiated strategic position should the brand or offering occupy in the market and the customer’s mind?

A value proposition can support positioning, but it does not replace positioning.

---

# 12. Recommended B2B VALUE PROPOSITION OPERATING SYSTEM

I would not implement all eight frameworks as parallel workflows. The recommended architecture is:

```text
1. CUSTOMER REALITY
   ODI / JTBD
        ↓
   Jobs + Desired Outcomes + Unmet Outcomes

2. VALUE SPACE
   Bain B2B Elements of Value
        ↓
   Functional + Economic + Ease-of-Business
   + Strategic + Personal Value

3. CAUSAL VALUE LOGIC
   Means–End Chain, extended for B2B
        ↓
   Capability
   → Consequence
   → Business Outcome
   → Organizational Value
   → Stakeholder Value

4. COMPETITIVE & ECONOMIC VALUE
   Anderson / Narus
        ↓
   Next-Best Alternative
   → Points of Parity
   → Points of Difference
   → Customer Value Model
   → Quantification
   → Proof

5. VALUE PROPOSITION DECISION
   Resonating Focus
        ↓
   1–2 highest-value differentiated drivers
   → Core Value Proposition

6. IMPLEMENTATION & LEARNING
   Payne et al.
        ↓
   Design
   → Quantify
   → Communicate
   → Document
   → Verify
   → Learn
```

This creates five main methodological engines:

**ODI → Bain → Means–End → Anderson/Narus → Payne**

Resonating Focus can sit within the Anderson/Narus layer as the final selection logic.

**Value Proposition Canvas** remains useful above these layers as a **human interface / workshop view**.

**EVC** sits below them as a specialized **economic quantification module**.

---

# 13. Master ContextOps Question Set

The following framework-independent question set should become the canonical runtime layer. Framework-specific questions remain available for deeper analysis.

## A. Customer Reality

| ID | Question | Required input | Expected output |
|---|---|---|---|
| CR-01 | Which customer or segment is being analyzed? | ICP, segment data | Target customer |
| CR-02 | In which situation does the need arise? | Interviews, CRM, trigger data | Buying situation |
| CR-03 | Who is trying to accomplish which fundamental job? | VoC, interviews | Core job |
| CR-04 | Which alternatives are used today? | Win/Loss, Sales, research | Current alternatives |

## B. Desired Outcomes

| ID | Question | Required input | Expected output |
|---|---|---|---|
| DO-01 | By which criteria does the customer judge whether the job was completed successfully? | VoC | Desired outcomes |
| DO-02 | Which outcomes are especially important? | Survey / VoC | Outcome importance |
| DO-03 | Which important outcomes are currently insufficiently satisfied? | VoC, alternative performance | Unmet outcomes |

## C. Current Friction

| ID | Question | Required input | Expected output |
|---|---|---|---|
| FR-01 | What prevents or makes the desired outcome harder to achieve? | Interviews, support, reviews | Frictions |
| FR-02 | Which costs, risks, delays or errors result? | Operational data | Consequences |
| FR-03 | What are the consequences of doing nothing? | Customer context | Cost of inaction |

## D. Value Drivers

| ID | Question | Required input | Expected output |
|---|---|---|---|
| VD-01 | Which functional forms of value matter? | Bain taxonomy + evidence | Functional value |
| VD-02 | Which economic forms of value matter? | Financial data | Economic value |
| VD-03 | Which ease-of-business forms of value matter? | CX, Sales | Ease value |
| VD-04 | Which strategic forms of value matter? | Strategy / customer research | Strategic value |
| VD-05 | Which personal or reputational forms of value matter? | Stakeholder evidence | Personal value |

## E. Stakeholder Value

| ID | Question | Required input | Expected output |
|---|---|---|---|
| ST-01 | Which stakeholders influence purchase, approval, implementation and use? | Buying-committee data | Stakeholder map |
| ST-02 | Which outcomes matter to each stakeholder? | VoC | Stakeholder outcomes |
| ST-03 | Which benefits and risks does each role experience? | Evidence | Stakeholder value |
| ST-04 | Where do stakeholder objectives conflict? | Cross-role analysis | Value conflicts |

## F. Capability → Value

| ID | Question | Required input | Expected output |
|---|---|---|---|
| CV-01 | Which capability creates the claimed effect? | Solution context | Capability |
| CV-02 | What immediate customer consequence does it create? | Product/customer evidence | Consequence |
| CV-03 | Which business outcome follows? | Operational evidence | Business outcome |
| CV-04 | Why is this outcome valuable? | Stakeholder evidence | Value driver |
| CV-05 | For whom is the value created? | Buying-committee data | Stakeholder value |

## G. Competitive Value

| ID | Question | Required input | Expected output |
|---|---|---|---|
| CA-01 | What is the real next-best alternative? | Market/customer evidence | Next-best alternative |
| CA-02 | Which value elements are category table stakes? | Competitor analysis | Table stakes |
| CA-03 | Where does parity exist? | Benchmarks | Points of parity |
| CA-04 | Where does demonstrable advantage exist? | Competitor/customer data | Points of difference |
| CA-05 | Where do we claim superiority without sufficient evidence? | Claim audit | Unsupported POD |
| CA-06 | Which advantage affects a high-priority customer outcome? | Combined analysis | Relevant differentiated value |

## H. Economic Value

| ID | Question | Required input | Expected output |
|---|---|---|---|
| EV-01 | What revenue impact is created? | Customer financials | Revenue impact |
| EV-02 | What cost impact is created? | Operational data | Cost impact |
| EV-03 | What time or productivity impact is created? | Process data | Productivity value |
| EV-04 | What risk impact is created? | Risk data | Risk value |
| EV-05 | What implementation and switching costs occur? | Project data | Negative value |
| EV-06 | What is the net value relative to the alternative? | Above | Economic value |

## I. Proof

| ID | Question | Required input | Expected output |
|---|---|---|---|
| PR-01 | Which evidence proves capability and performance? | Product data | Product proof |
| PR-02 | Which evidence proves the customer outcome? | Cases, KPIs | Outcome proof |
| PR-03 | Which evidence proves economic value? | ROI/customer data | Economic proof |
| PR-04 | Which independent evidence exists? | Analysts, research, certifications | External proof |
| PR-05 | Which claims remain unsupported? | Claim audit | Research gaps |

## J. Value Proposition Decision

| ID | Question | Required input | Expected output |
|---|---|---|---|
| VP-01 | Which value drivers are relevant, differentiated and supportable? | Complete model | Candidate value pillars |
| VP-02 | Which one or two value drivers create the greatest relative value? | Priority analysis | Resonating focus |
| VP-03 | Which shared value logic connects the relevant stakeholders? | Stakeholder map | Core value logic |
| VP-04 | Which core value proposition follows from the evidence? | All above | Core VP |
| VP-05 | Which stakeholder-specific variants are justified? | Stakeholder evidence | VP variants |

---

# 14. Machine-Readable VALUE_PROPOSITION Object

The target object should emphasize **causality, competition and provenance**:

```yaml
VALUE_PROPOSITION:

  scope:
    customer_segment:
    buying_situation:
    geography:
    industry:
    use_case:

  customer_reality:
    job_executor:
    core_job:
    job_steps: []
    trigger_events: []
    desired_outcomes:
      - outcome:
        importance:
        current_satisfaction:
        status:
        evidence_refs: []

    frictions: []
    cost_of_inaction: []

  buying_committee:
    stakeholders:
      - role:
        decision_influence:
        jobs: []
        desired_outcomes: []
        value_drivers: []
        risks: []
        personal_value: []
        conflicts: []

  alternatives:
    next_best_alternative:
    incumbent:
    status_quo:
    internal_solution:
    do_nothing:

  value_drivers:
    table_stakes: []
    functional: []
    economic: []
    ease_of_business: []
    strategic: []
    personal: []
    reputational: []
    inspirational: []

  capability_value_chains:
    - capability:
      delivery_mechanism:
      customer_consequence:
      business_outcome:
      organizational_value:
      stakeholder:
      stakeholder_value:
      evidence_refs: []
      confidence:

  competitive_value:
    - value_element:
      alternative:
      classification:
        # parity | difference | contention
      customer_importance:
      own_performance:
      alternative_performance:
      relative_advantage:
      defensibility:
      evidence_refs: []

  economic_value:
    reference_alternative:
    reference_value:

    positive_differentiation:
      revenue_gain:
      cost_reduction:
      productivity_gain:
      risk_reduction:
      working_capital:
      other:

    negative_differentiation:
      implementation_cost:
      switching_cost:
      operating_cost:
      adoption_friction:

    total_economic_value:
    customer_surplus:
    assumptions: []
    sensitivity_variables: []

  proof_architecture:
    capability_proof: []
    operational_proof: []
    customer_outcome_proof: []
    economic_proof: []
    case_evidence: []
    external_validation: []
    certifications: []

  value_proposition:
    resonating_focus:
      primary_value_driver:
      secondary_value_driver:
      required_point_of_parity:

    core_proposition:
    supporting_value_pillars: []

    stakeholder_variants:
      - stakeholder:
        proposition:
        evidence_refs: []

  implementation:
    required_resources: []
    required_processes: []
    ecosystem_dependencies: []
    business_model_fit:
    delivery_risks: []

  evidence_ledger:
    - claim_id:
      claim:
      status:
        # FACT
        # SUPPORTED_INFERENCE
        # HYPOTHESIS
        # CONTRADICTION
        # UNKNOWN
      evidence_refs: []
      evidence_quality:
      confidence:
      missing_evidence:
      research_question:

  research_gaps: []

  verification:
    promised_value:
    realized_value:
    variance:
    explanation:
    learning:
    last_validated:
```

The critical architectural change is that **evidence is not stored only at the end of the process; it is linked to each strategic claim and object.** This materially reduces hallucination and unsupported inference risk.

---

# 15. Decision Rules for the Second Brain

## Customer Reality

1. **Do not infer a customer need from a product feature and then store it as a customer fact.**
2. **Customer Jobs must be phrased independently of a specific solution.**
3. **A measurable Desired Outcome is stronger than a generic pain or gain.**
4. **Jobs and outcomes derived only from secondary context remain hypotheses until customer evidence exists.**

## Capability → Value

5. **No value claim without an identifiable customer outcome.**
6. **No customer outcome claim without a plausible and evidenced delivery mechanism or capability.**
7. **Feature ≠ Benefit.**
8. **Benefit ≠ Customer Value.**
9. **Customer Value exists only when the consequence matters to the customer.**

## Stakeholders

10. **“The customer” is not an acceptable final analytical unit in complex B2B when materially different buying-committee roles exist.**
11. **Every important value driver must be mapped to one or more stakeholders.**
12. **Personal value must not be conflated with company value.**
13. **Stakeholder conflicts must not be hidden behind a generic value proposition.**

## Differentiation

14. **No differentiated value without a defined next-best alternative.**
15. **A relevant value driver is not differentiation if competitors deliver it equally well.**
16. **Unique capability ≠ Unique value.**
17. **Irrelevant uniqueness must not be treated as differentiation.**
18. **Table stakes must not be presented as differentiators.**
19. **Where customer perception conflicts with the vendor’s assessment, classify the claim as a point of contention rather than a point of difference.**

## Quantification

20. **No ROI claim without an explicit formula and traceable inputs.**
21. **Every monetary variable requires source, time period and assumption metadata.**
22. **Switching, implementation and adoption costs must be deducted from positive value.**
23. **Economic value must be calculated relative to an alternative.**
24. **Avoid false precision: output precision cannot exceed input quality.**

## Proof

25. **No central value pillar without a proof architecture.**
26. **Separate supplier evidence from customer evidence.**
27. **Separate projected value from realized value.**
28. **Do not automatically generalize a case study across segments.**
29. **Missing evidence creates a research gap, not permission to generate plausible marketing language.**

## Value Proposition

30. **A final value proposition prioritizes a small number of value drivers rather than listing all possible benefits.**
31. **A core value driver should be relevant, differentiated, deliverable and supportable.**
32. **Stakeholder propositions may vary, but they require a common overarching value logic.**
33. **Value Proposition ≠ Positioning.**
34. **Value Proposition ≠ Messaging.**
35. **Value Proposition ≠ Product Description.**

---

# 16. AI / ContextOps Confidence Logic

Keep the five status classes, but apply hard transition rules:

| Status | Rule |
|---|---|
| **FACT** | Directly supported by a credible source |
| **SUPPORTED INFERENCE** | Logically derived from at least two compatible facts, with no material contradictory evidence |
| **HYPOTHESIS** | Plausible interpretation with insufficient direct evidence |
| **CONTRADICTION** | Credible sources support materially conflicting claims |
| **UNKNOWN** | Context is insufficient |

For every `HYPOTHESIS`, `CONTRADICTION` or `UNKNOWN`, the system should automatically create:

```text
Missing evidence:
...

Research question:
...

Preferred evidence source:
Customer interview | CRM | Win/Loss | Usage Data | Financial Data |
Competitive Research | Survey | Product Data | Other

Priority:
Critical | High | Medium | Low
```

This turns ContextOps from an **answering system** into a **research-orchestration system**.

---

# 17. Key Architecture Decision

The Second Brain should not ask:

> “What is the best value proposition framework?”

It should use a complementary stack:

```text
ODI
finds the right customer outcomes.

Bain
prevents the definition of value from becoming too narrow.

Means–End
creates the causal value chain.

Anderson / Narus
tests relative and economic superiority.

Resonating Focus
decides what genuinely belongs in the proposition.

Payne
turns the result into a learning B2B operating process.
```

**Strategyzer Value Proposition Canvas** should remain as a **human-readable interface / workshop representation**.

**EVC** should operate as a specialist **economic quantification module**.

Together, this provides a materially more robust **B2B Value Proposition Engine** than any single framework can offer.

---

# References / Primary Sources

1. Ulwick, A. W. (2002). “Turn Customer Input into Innovation.” *Harvard Business Review*. https://hbr.org/2002/01/turn-customer-input-into-innovation
2. Strategyn. Outcome-Driven Innovation methodology and process. https://strategyn.com/outcome-driven-innovation-process/
3. Anderson, J. C. & Narus, J. A. (1998). “Business Marketing: Understand What Customers Value.” *Harvard Business Review*. https://hbr.org/1998/11/business-marketing-understand-what-customers-value
4. Anderson, J. C., Narus, J. A. & van Rossum, W. (2006). “Customer Value Propositions in Business Markets.” *Harvard Business Review*. https://hbr.org/2006/03/customer-value-propositions-in-business-markets
5. Almquist, E., Cleghorn, J. & Sherer, L. (2018). “The B2B Elements of Value.” *Harvard Business Review*. https://hbr.org/2018/03/the-b2b-elements-of-value
6. Bain & Company. B2B Elements of Value interactive overview. https://media.bain.com/b2b-eov/
7. Gutman, J. (1982). “A Means-End Chain Model Based on Consumer Categorization Processes.” *Journal of Marketing*, 46(2), 60–72. https://doi.org/10.1177/002224298204600207
8. Payne, A., Frow, P., Steinhoff, L. & Eggert, A. (2020). “Toward a comprehensive framework of value proposition development: From strategy to implementation.” *Industrial Marketing Management*. https://www.sciencedirect.com/science/article/pii/S0019850119309940
9. Osterwalder, A., Pigneur, Y., Bernarda, G. & Smith, A. (2014). *Value Proposition Design*. Strategyzer. https://www.strategyzer.com/library/value-proposition-design-2
10. Strategyzer. Value Proposition overview. https://www.strategyzer.com/value-proposition
11. Forbis, J. L. & Mehta, N. T. (1979). “Economic Value to the Customer” / value-based pricing logic, McKinsey. https://www.mckinsey.com/capabilities/strategy-and-corporate-finance/our-insights/delivering-value-to-customers
