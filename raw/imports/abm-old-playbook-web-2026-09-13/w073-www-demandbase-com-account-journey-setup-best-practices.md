---
type: "web-source-capture"
title: "Account Journey Setup Best Practices for GTM Teams"
url: "https://www.demandbase.com/resources/playbook/account-journey-setup-best-practices"
resolved_url: "https://www.demandbase.com/resources/playbook/account-journey-setup-best-practices/"
captured_at: "2026-09-13T18:00:42.080017+00:00"
capture_method: "Firecrawl main-content Markdown; non-generative extraction"
capture_scope: "full-main-text"
source_id: "W073"
capture_receipt: "wiki/_outputs/abm-old-playbook-2026-09-13/web-ingest/receipts/w073.json"
selection_authority: "User-selected URLs from ABM old-playbook research, 2026-09-13; custody is not claim approval"
---

# Account journey setup best practices

![Tom Keefe Headshot](https://www.demandbase.com/wp-content/uploads/2025/02/Tom-Keefe-Headshot-1280x853.jpg)

Tom Keefe

Director of GTM Experts

[Meet the experts](https://www.demandbase.com/meet-the-experts/)

- Journey Stage



All Stages

- Team



RevOps, Marketing

- Expertise Level



Beginner, Intermediate


## Contents

- [What you'll learn](https://www.demandbase.com/resources/playbook/account-journey-setup-best-practices/#chapter-what-youll-learn)
- [Why do account journeys matter?](https://www.demandbase.com/resources/playbook/account-journey-setup-best-practices/#chapter-why-do-account-journeys-matter)
- [What you need to get started](https://www.demandbase.com/resources/playbook/account-journey-setup-best-practices/#chapter-what-you-need-to-get-started)
- [Step-by-step playbook](https://www.demandbase.com/resources/playbook/account-journey-setup-best-practices/#chapter-step-by-step-playbook)
- [Part 1: Account journey overview](https://www.demandbase.com/resources/playbook/account-journey-setup-best-practices/#chapter-part-1-account-journey-overview)
- [Part 2: Stage criteria techniques](https://www.demandbase.com/resources/playbook/account-journey-setup-best-practices/#chapter-part-2-stage-criteria-techniques)
- [Part 3: Stage customization](https://www.demandbase.com/resources/playbook/account-journey-setup-best-practices/#chapter-part-3-stage-customization)
- [Part 4: Additional stages to create](https://www.demandbase.com/resources/playbook/account-journey-setup-best-practices/#chapter-part-4-additional-stages-to-create)
- [The results](https://www.demandbase.com/resources/playbook/account-journey-setup-best-practices/#chapter-the-results)

**Partner with Demandbase Experts**

Get tailored strategies and insights to optimize your approach, drive engagement, and unlock new opportunities.

[Book a meeting](https://www.demandbase.com/meet-the-experts/)

## What you’ll learn

This playbook will walk you through some basic best practices for setting up your Account Journey in Demandbase, ensuring alignment between your Sales, Marketing, and Customer Success teams. By the end, you’ll understand how to:

- Establish the foundational stages of the Account Journey.
- Configure and enhance stage criteria to meet your specific business needs.
- Add advanced customization techniques for segmentation and engagement.
- Create additional stages for accounts that fall outside the standard OOB setup.
- Align your entire go-to-market (GTM) team using unified metrics and account-focused criteria.

## Why do account journeys matter?

The days of Marketing speaking a different language from Sales are over. Sales isn’t closing John Smith; they’re closing the deal with an Account. Traditionally, Marketing tracked the status of people down a funnel, but with privacy changes (e.g., less form submission and cookie tracking), the expansion of buying groups, and the need to fully align our GTM Teams, the People Funnel lacks the required functionality of today’s environment.

The Account Journey aligns Sales, Marketing, and Customer Success around a shared understanding of where an account stands in the buying process. It helps overcome:

- **Inefficient GTM Strategies:** Teams perceiving Accounts differently in their buying journey.
- **Data blind spots:** Caused by relying solely on person-level engagement.
- **Inaccurate Forecasting:** Lack of vision into an Account’s journey down the funnel.

By shifting the focus to accounts, the Account Journey helps your organization:

- Use [intent and engagement signals](https://www.demandbase.com/products/account-intelligence/intent/) more effectively.
- Align your GTM strategies under a single framework.
- Establish consistent metrics and accountability across teams.

> **Key Takeaway →** The Account Journey equips your GTM organization with the tools and insights to identify, act, and unify efforts across the Account Lifecycle.

## What you need to get started

To implement an effective Account Journey, ensure the following pre-requisites are met:

#### Technology Requirements

- A fully integrated CRM (Customer Relationship Management tool) and MAP (Marketing Automation Platform) with Demandbase One.

#### Configured Models and Scoring

- One active Pipeline Predict Model to predict pipeline readiness.
- One active Qualification Score Model to evaluate target accounts.
- [Engagement Minute scoring](https://www.demandbase.com/resources/playbook/custom-engagement-minute-counts-guide/) is configured.

#### Intent Keywords

- Specific Demandbase Intent Keyword Sets created and active.

#### Buy-In from Operations and GTM Leadership

- Alignment with your Operations and GTM leaders to define account stages and criteria.

## Step-by-step playbook

### Part 1: Account Journey Overview

The Account Journey evaluates all available data within DemandbaseOne (Accounts, People, Opportunities, and Activities) to determine the most appropriate stage for every account. Demandbase’s Account Journey begins by classifying Accounts at the bottom-most stage and works upward, ensuring every account finds its correct position.

### Default Stages

- **All Other:** Everything else, unqualified and unengaged.
- **Qualified:** Accounts fitting ICP or TAM criteria, but showing no intent.
- **Aware:** Accounts showing intent signals but no direct engagement.
- **Engaged:** Accounts engaging with your content but not sales-ready.
- **MQA (Marketing Qualified Account):** Highly engaged accounts ready for Sales.
- **Opportunity:** Accounts with open opportunities.
- **Customer:** Accounts with won opportunities.

![](https://www.demandbase.com/wp-content/uploads/2025/04/Tom-AJ-1.png)

### Part 2: Stage Criteria Techniques

Stage criteria are the logic engine of your Account Journey. By refining the data and conditions used to qualify accounts in and out of stages, you can ensure the system aligns with your GTM motion while providing accurate insights. Below are techniques that can be implemented through your Account Journey Stages to identify the most impactful and effective aspects of an account throughout its buying cycle.

![](https://www.demandbase.com/wp-content/uploads/2025/04/AJ-1-updated-scaled.png)

#### Step 1. Account Segmentation

Larger accounts may require more engagement to indicate their buying interest, given the complex internal dynamics and numerous stakeholders involved. This technique of grouping your stage criteria by account segmentation ensures that engagement expectations scale appropriately.

**Technique Example:**

- Define account segmentation using an account field (e.g., Employees, Annual Revenue, or Account Type).
- Segment accounts by Enterprise and Mid-Market. Then differentiate the Marketing Engagement Points required for the stage based on segmentation.
  - **Enterprise Accounts:** 150 Marketing Engagement Points.
  - **Mid-Market Accounts:** 75 Marketing Engagement Points.

![](https://www.demandbase.com/wp-content/uploads/2025/04/AJ-2-scaled.png)

> **Pro Tip →** Collaborate with your Operations team to validate how your system segments accounts into size categories like SMB, Mid-Market, and Enterprise. This ensures consistent criteria logic.

#### Step 2. Known vs. Unknown People Engagement

Engagement data often involves both known and unknown individuals. Due to people becoming more aware of how their activity can trigger sales outreach and evolving technologies, we have seen a decrease in web form submissions and an increase in anonymous signals such as intent and web visits. This technique will ensure you have control over how much known and anonymous engagement will cause an Account to move into a specific Journey Stage.

**Technique Example:**

1. Create the first relationship of Accounts with any Person:
   - Input either your CRM or MAP “Created Date” field and use the “exists” logic to indicate the person is known to your systems.
   - Use the relationship People with Activities to then reference the amount of Engagement Points you wish the known person to have.
   - Embed the Sales vs Marketing Engagement segment to ensure those activities are Marketing-related.
2. Create the second relationship of Accounts with any Person:
   - Input either your CRM or MAP “Created Date” field and use the “does not exist” logic to indicate the person is not known to your systems.
   - Use the relationship People with Activities to then reference the amount of Engagement Points you wish the known person to have, setting it to double the previous block referencing known engagement.
   - Embed the Sales vs Marketing Engagement segment to ensure those activities are Marketing-related and in the desired time range.

![](https://www.demandbase.com/wp-content/uploads/2025/04/AJ-3-scaled.png)

> **Pro Tip →** Speak with your Sales Teams to ensure they are aware of how to prospect effectively into Accounts with abundant amounts of engagement from anonymous records for this technique to be the most effective.

#### Step 3. Specific Persona Engagement

Engagement data is an amazing lever to identify if an Account is ready for specific strategies; however, if that engagement comes from individuals who aren’t decision-makers or influencers, it can frustrate the entire GTM organization. Use this technique to ensure that Accounts only move down the Journey if there is engagement from the right personas within it.

**Technique Example:**

- Use the Accounts with People relationship.
- Reference the “Personas” field and select all relevant personas.
- Add in the People with Activities relationship.
- Embed the Sales vs Marketing Engagement segment to ensure those activities are Marketing-related and in the desired time range.

![](https://www.demandbase.com/wp-content/uploads/2025/04/Tom-AJ-5.png)

> **Pro Tip →** Collaborate with the entire GTM organization to ensure the personas selected are meaningful for the specific stage they are being utilized within.

#### Step 4. Specific Actions Taken

Given the customization of these Journey Stages and the vast amount of activities at your disposal, we want to ensure that if certain critical engagement signals occur, you can ensure they will never be overlooked. This technique will show you how to directly identify these actions to ensure the Account moves into a specific journey stage.

**Technique Example:**

- Use the Accounts with Activity relationship.
- Reference your CRM Campaign activity.
- Input the criteria, such as Campaign Name, to identify those specific campaign activities, as well as the time period during which they occurred.

![](https://www.demandbase.com/wp-content/uploads/2025/04/Tom-AJ-6.png)

> **Pro Tip →** This technique can also be applied to Marketo Programs, specific form submissions, web visits, sales activities, or even unique third-party intent signals.

By leveraging these techniques, your stage criteria will better reflect each account’s level of engagement and ensure your teams act on data that drives results.

### Part 3: Stage Customization

Customizing stages is key to refining your Account Journey. Each stage’s default setup provides a baseline, but enhancements ensure the model aligns with your organization’s unique workflows and data architecture. Here’s a detailed breakdown of default configurations and recommendations for stage-by-stage optimization. For any customization, we highly recommend reaching out to your Operations team to ensure you are utilizing the correct fields.

#### Customer Stage

**Default Setting:** Captures all accounts with won opportunities where “Is Won” equals TRUE.

**Why Enhance the Stage:** Ensuring that all Customers are accurately captured in this stage.

**Enhancement:**

- Add a CRM field such as “Account Type = Customer.”

**Key Consideration:** Consult your Operations team to determine how your CRM identifies current customers.

![](https://www.demandbase.com/wp-content/uploads/2025/04/Tom-AJ-7.png)

#### Opportunity Stage

**Default Setting:** Includes all accounts with any open opportunities where “Is Closed” equals FALSE.

**Why Enhance the Stage:** Ensuring that all New Business Opportunities are accurately captured by this stage.

**Enhancement:**

- Refine this stage by Opportunity fields, such as:
  - **Type:** Filter for “New Business” opportunities (exclude renewals, upsells, de-books, and test opps).
  - **Stage:** Include all relevant open opportunities stage values for new business, excluding lost and won opportunity stage designations.
  - **Pipeline Amount:** Exclude opportunities with a value of zero or invalid placeholders. However, if you create opportunities initially with zero values, ignore this recommendation.

**Key Consideration:** How does your CRM distinguish pre-pipeline opportunities from pipeline-ready opportunities? Use this insight for downstream segmentation.

![](https://www.demandbase.com/wp-content/uploads/2025/04/Tom-AJ-8.png)

#### MQA (Marketing Qualified Account) Stage

**Default Setting:** Measures 85+ Pipeline Predict score OR at least 100 Engagement Points in the last 3 months.

**Why Enhance the Stage:** Ensure all Accounts that move into the MQA Stage remain in that stage while Sales prospects into them for an appropriate amount of time.

**Enhancement:**

- Add the MQA Date field to the criteria as the last option.
- Use the “In the past” logic and add in a value, such as 3 months. This value will indicate how long an Account will stay in this stage before moving further down the Journey.
- Configure the stage logic to ensure this new field is included: _Logic Example:_ “(85+ Pipeline Predict OR 100+ Marketing Engagement Points) OR MQA Date in past 3 months.”

**Key Consideration:** Consult with your Sales Team to understand how long they expect to prospect into an Account before moving it out of the MQA stage due to lack of positive progression to an Opportunity.

![](https://www.demandbase.com/wp-content/uploads/2025/04/Tom-Keeke-Account-journey-screenshots-5-scaled.png)

#### Engaged Stage

**Default Setting:** Accounts showing 10+ Engagement Points (excluding Demandbase Intent or Intent Surge).

**Why Enhance the Stage:** Ensure that engaged Accounts are classified as such due to engagement with Marketing and from known people records.

**Enhancement:**

- Add the Accounts with People relationship.
- Add the People with Activities relationship.
- Update relationship logic to add the threshold of Engagement Points required.
- Add the Sales vs Marketing Engagement segment to ensure those activities are Marketing-related and in the desired time range.
- Add in either your CRM or MAP “Created Date” field.

**Key Consideration:** Utilize the Known vs. Unknown People Engagement technique if you wish to also set an engagement threshold for unknown people activities as well.

![](https://www.demandbase.com/wp-content/uploads/2025/04/AJ-5-scaled.png)

#### Aware Stage

**Default Setting:** High or Medium Demandbase Intent strength in the past month.

**Why Enhance the Stage:** Ensure that you are using the proper [Intent Keyword Sets](http://set%20up%20demandbase%20intent:%20create%20keyword%20sets%20demandbase%20https//support.demandbase.com%20%E2%80%BA%20en-us%20%E2%80%BA%20articles%20%E2%80%BA%203600...) and any third-party intent integrations.

**Enhancement:**

- Add the Accounts with Activity relationship.
- Add activities for Demandbase Intent and Trending Intent.
- Select the Keyword Sets for each.
- Ensure Demandbase Intent is only capturing Medium and High Strength signals.
- Add in any third-party intent integrations via the Intent Surge activity, and call out what specifically you wish to use in this stage.
- Update logic within the relationship of Accounts with Activity to utilize OR instead of AND to make sure that if an account shows any of these signals, it will qualify for the stage.

**Key Consideration:** Carefully review which third-party intent platform you have integrated and if there are any signals you wish not to be a factor for Accounts qualifying into this stage.

![](https://www.demandbase.com/wp-content/uploads/2025/04/Tom-AJ-11.png)

#### Qualified Stage

**Default Setting:** Accounts with Qualification Score ≥ 70.

**Why Enhance the Stage:** Ensure that you find the Accounts that best fit your model definition.

**Enhancement:**

- Lower the threshold to 50+.

![](https://www.demandbase.com/wp-content/uploads/2025/04/Tom-AJ-12.png)

**Key Consideration:** The Qualification Score model is designed to find similar Accounts based on the Accounts you gave the model to train. By lowering the score to 50, we allow this stage to find accounts that are showing 50% of the characteristics of the group you trained the model with.

### Part 4: Additional Stages to Create

Adding tailored stages to your Account Journey unlocks new opportunities to refine your [GTM strategies](https://www.demandbase.com/blog/what-is-a-go-to-market-gtm-strategy/) further. These new stages, based on insights from leading Demandbase users, help capture specific account scenarios and optimize tracking, engagement, and prioritization efforts. Below is a detailed breakdown of how to create and configure the Recycle, Pre-Pipeline, and Disqualified stages.

#### Recycle Stage

The Recycle stage captures accounts with recently closed-lost new business opportunities. By giving these accounts a cooling-off period, Sales and Marketing can ensure their resources are focused on more promising leads, while these recycled accounts can receive low-touch nurture until they’re ready for re-engagement.

##### Stage Setup

- Select the targeted Journey and click the gear icon, then choose “Add New Stage.”

![](https://www.demandbase.com/wp-content/uploads/2025/04/Tom-AJ-14.png)

- Name the stage (e.g., “Recycle”) to match your organization’s terminology and input a description for clarity.

![](https://www.demandbase.com/wp-content/uploads/2025/04/Tom-AJ-15.png)

- Make the stage “non-analytic” by toggling off “Display in Analytics.” This ensures the stage is excluded from Volume, Velocity, and Conversion metrics tied to forward-funnel stages.
- Place the stage immediately after MQA and before any Opportunity-related stages (e.g., Stage 6).

![](https://www.demandbase.com/wp-content/uploads/2025/04/Tom-AJ-16.png)

##### Criteria Configuration

- Add the relationship Accounts with Opportunities.
- Use logic to specify accounts with closed-lost new business opportunities, such as:
  - **Type:** New Business.
  - **Stage:** Closed Lost.
- Add criteria to hold the Account in the stage for a specific period. Example:
  - **Opportunity Close Date:** Within the past 3 months.

_Note:_ This assumes that the Close Date is reflected as to when the Opportunity was actually marked as closed lost.

![](https://www.demandbase.com/wp-content/uploads/2025/04/Tom-AJ-17.png)

##### Advanced Notes

- Adjust holding periods based on MQA settings. For example, if MQA criteria include accounts active within 90 days, set the Recycle holding period to 91 days to avoid accounts prematurely moving back into the MQA Stage.
- Optionally, use OR logic based on lost reasons. Example:
  - **“Competitor Chosen” = Hold for 180 days.**
  - **Other reasons = Hold for 90 days.**

**Why It Matters:**

By implementing the Recycle stage, you give recently lost accounts the chance to reset without creating friction between Sales and Marketing teams, while still enabling periodic nurture to re-enter them when appropriate.

#### Pre-Pipeline Stage

The Pre-Pipeline stage holds accounts with new business opportunities that haven’t fully entered your sales pipeline. This distinction lets your teams differentiate between pre-pipeline and in-pipeline opportunities for clearer strategy and measurement.

##### Stage Setup

- Choose the desired Journey, click the gear icon, and select “Add New Stage.”

![](https://www.demandbase.com/wp-content/uploads/2025/04/Tom-AJ-18.png)

- Name the stage “Pre-Pipeline” or use a term that matches your team’s terminology.

![](https://www.demandbase.com/wp-content/uploads/2025/04/Tom-AJ-19.png)

- Toggle on “Display in Analytics” for this stage to include it in forward-funnel metrics.
- Position the stage just before your existing Opportunity stage (e.g., Stage 7).

![](https://www.demandbase.com/wp-content/uploads/2025/04/Tom-AJ-20.png)

##### Criteria Configuration

- Use the relationship Accounts with Opportunities.
- Customize filters to differentiate pre-pipeline new business opportunities:
  - **Type:** New Business.
  - **Stage:** Pre-Pipeline (requires internally defined stage values in your CRM).

![](https://www.demandbase.com/wp-content/uploads/2025/04/Tom-AJ-21.png)

- Update the Opportunity Stage.
- Edit the existing Opportunity (Pipeline) stage to include only accounts with active New Business opportunities in accepted pipeline stages.

![](https://www.demandbase.com/wp-content/uploads/2025/04/Tom-AJ-22.png)

![](https://www.demandbase.com/wp-content/uploads/2025/04/Tom-AJ-23.png)

##### Advanced Notes

- Consider defining separate engagement plays for Pre-Pipeline accounts, such as advertising tailored to early-stage opportunities.

**Why It Matters:**

This stage allows for precise segmentation, better metrics tracking, and tailored GTM strategies for accounts at different levels of opportunity maturity.

#### Disqualified Stage

Disqualified accounts are those that your team has determined will not be pursued further. This stage is essential for maintaining focus on high-value targets while ensuring the entire organization aligns around which accounts are off the table.

##### Stage Setup

- Choose the appropriate Journey, select the gear icon, and click “Add New Stage.”

![](https://www.demandbase.com/wp-content/uploads/2025/04/Tom-AJ-24.png)

- Name the stage (e.g., “Disqualified”).

![](https://www.demandbase.com/wp-content/uploads/2025/04/Tom-AJ-25.png)

![](https://www.demandbase.com/wp-content/uploads/2025/04/Tom-AJ-26.png)

- Place this stage at the very bottom of your Account Journey (e.g., Stage 8).
- Make the stage “non-analytic” by toggling off “Display in Analytics.” This ensures the stage is excluded from Volume, Velocity, and Conversion metrics tied to forward-funnel stages.

![](https://www.demandbase.com/wp-content/uploads/2025/04/Tom-AJ-27.png)

##### Criteria Configuration

- Reference disqualification criteria from your CRM. Common examples include:
  - **Annual Revenue Below Threshold:** E.g., <$50M.
  - **Geography Exclusion:** Located outside defined territories.
  - **Custom Field:** Use a designated field like “Disqualified = TRUE.”
- Add OR logic where necessary to capture multiple disqualification scenarios. Example:
  - **“Annual Revenue < $50M” OR “Headquarters Outside North America.”**

![](https://www.demandbase.com/wp-content/uploads/2025/04/Tom-AJ-28.png)

##### Advanced Notes

- If CRM fields for disqualification don’t exist yet, work with your Ops team to establish them for seamless integration.

**Why It Matters:**

Adding a Disqualified stage ensures GTM resources aren’t wasted pursuing leads that are unlikely to or would never become Customers, while also improving your understanding of why accounts may not fit your ideal customer profile.

### Account Journey Usage

Your Account Journey is the centerpiece of cross-functional execution.

#### Activation Examples

- Send [highly-targeted ABM ads](http://adtech%20to%20uplevel%20your%20account-based%20strategy%20demandbase%20https//www.demandbase.com%20%E2%80%BA%20products%20%E2%80%BA%20advertising) to Aware accounts showing demand signals.
- Run aggressive outbound plays for accounts in the MQA stage.
- Create low-touch nurture sequences for Recycle accounts.

#### Metrics and Reporting

Built-in analytics ( **Volume**, **Conversion**, **Velocity**) allow you to track major trends, while supplementary KPIs (e.g., MQA Acceptance and Conversion) provide deeper insights.

> **Pro Tip →** Route Account Journey stages to tools like Webchat for dynamic custom experiences.

### The results

This playbook is perfect for Marketing Operations, Sales Operations, Revenue Operations, and GTM leadership teams. Whether you’re new to Demandbase or an experienced user, this is for anyone looking to implement or optimize an Account Journey to strengthen cross-organizational collaboration and improve ROI.

By implementing this playbook, your organization will achieve powerful, measurable results that drive alignment, efficiency, and growth across Marketing, Sales, and Customer Success teams. Here’s what you can expect:

#### Alignment and Focus

Shared stage definitions and clear criteria bring your teams into perfect sync, reducing friction and ensuring consistent priorities across your GTM strategy.

#### Smarter, Data-Driven Decisions

Harness [reliable account data](http://boost%20your%20gtm%20strategy%20with%20ai%20and%20data-driven%20insights%20demandbase%20https//www.demandbase.com%20%E2%80%BA%20products%20%E2%80%BA%20data) to drive better decisions at every stage, from targeting to pipeline progression, resulting in higher confidence and precision.

#### Improved Pipeline Efficiency

Eliminate wasted effort by ensuring accounts move through the funnel at the right time with clear signals for action, boosting conversion rates and velocity.

#### Predictable and Scalable Growth

With visibility into your Account Journey’s performance, you can predict outcomes with confidence and scale strategies that deliver consistent ROI.

#### A Competitive Advantage

This playbook equips you with a cutting-edge approach to account-based GTM, giving your organization the tools it needs to win in today’s competitive landscape.

**Partner with Demandbase Experts**

Get tailored strategies and insights to optimize your approach, drive engagement, and unlock new opportunities.

[Book a meeting](https://www.demandbase.com/meet-the-experts/)

## More Playbooks

All Stages

## [How to set up predictive models in Demandbase](https://www.demandbase.com/resources/playbook/predictive-models-setup/)

Learn how to set up and customize Demandbase's predictive models - Qualification Score and Pipeline Predict - to prioritize accounts, align with your GTM strategy, and drive higher conversion rates.

[View playbook](https://www.demandbase.com/resources/playbook/predictive-models-setup/)

Customer

## [How to track sales touches by specific personas](https://www.demandbase.com/resources/playbook/track-sales-touches-by-persona/)

Learn how to track sales touches by persona in Demandbase. Optimize sales outreach by targeting the right personas at the right time.

[View playbook](https://www.demandbase.com/resources/playbook/track-sales-touches-by-persona/)

All Stages

## [Engagement points for TrustRadius intent](https://www.demandbase.com/resources/playbook/engagement-points-trustradius-intent/)

Learn how to score TrustRadius intent in Demandbase using engagement points. Follow proven grouping, signal, and geo-based best practices.

[View playbook](https://www.demandbase.com/resources/playbook/engagement-points-trustradius-intent/)

Curious how Demandbase would work for you?

[Book a meeting](https://www.demandbase.com/book-meeting/) [Watch a demo](https://www.demandbase.com/on-demand-demo/)

We have updated our Privacy Notice. Please [click here](https://www.demandbase.com/privacy/) for details.
