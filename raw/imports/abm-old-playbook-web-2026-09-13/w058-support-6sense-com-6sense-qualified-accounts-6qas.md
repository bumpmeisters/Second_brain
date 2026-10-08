---
type: "web-source-capture"
title: "6sense Qualified Accounts (6QAs)"
url: "https://support.6sense.com/docs/6sense-qualified-accounts-6qas"
resolved_url: "https://support.6sense.com/docs/6sense-qualified-accounts-6qas"
captured_at: "2026-09-13T17:59:05.634886+00:00"
capture_method: "Firecrawl main-content Markdown; non-generative extraction"
capture_scope: "full-main-text"
source_id: "W058"
capture_receipt: "wiki/_outputs/abm-old-playbook-2026-09-13/web-ingest/receipts/w058.json"
selection_authority: "User-selected URLs from ABM old-playbook research, 2026-09-13; custody is not claim approval"
---

> ## Documentation Index
>
> Fetch the complete documentation index at: [https://support.6sense.com/llms.txt](https://support.6sense.com/llms.txt)
>
> Use this file to discover all available pages before exploring further.

# 6sense Qualified Accounts (6QAs)

- Updated on Jun 8, 2026
- Published on Jun 20, 2025

- 7 minute(s) read
- Listen

Follow

Print

Copy pageCopy as Markdown for LLMsView as MarkdownView the page as plain text

Open in ChatGPTAsk ChatGPT about this pageOpen in ClaudeAsk Claude about this page

Article summary

[Prev](https://support.6sense.com/docs/predictive-buying-stages "Predictive Buying Stages")[Next](https://support.6sense.com/docs/set-up-predictive-analytics "Set Up Predictive Analytics")

6sense Qualified Accounts, or 6QAs, are those accounts that have been identified for prioritization by your marketing teams for a Sales/BDR handoff. The analogous process/object for most organizations are their marketing-qualified leads (MQLs) or sales-qualified leads (SQLs), although 6sense takes an account-centric view as opposed to lead-centric view.

6QAs are best used as a replacement for SQLs, although they can take the place of either object in their current iteration. 6QAs represent accounts that should be prioritized by your organization’s SDRs/BDRs.

> **Note:** This is a method of identifying 6sense-based mastered accounts _not_ one for CRM accounts, CRM opportunities, CRM leads, and so on (although these accounts are mastered).

## How 6QA accounts provide value

6QA accounts provide value to your organization because:

- 6QAs are managed using 6sense as opposed to manually via users’ custom rules. This enables a single system of qualification vs. maintaining multiple layers of logic.

- 6QAs leverage the 6sense’s company database, which is generally more comprehensive than an organizations’ CRM data. This enables accounts that aren’t in your CRM to be qualified.

- 6QAs enable combinations of many data sources. Simplifies integration of intent and buying signals, enables 6sense to be a single source of record for account qualification.

- Predictive filters result in more meaningful qualifications. Reliance on manually curated rules means that you may be missing out on meaningful interactions that signal buying intent.

- You can tune 6QAs to adjust qualification thresholds. Loosen or tighten your qualification rules over time to tune the amount of high intent, targeted accounts you’re qualifying vs. medium intent, large pipeline accounts.


## Prerequisites and permissions

- Your organization must have the Predictive add-on package to have access to 6QA features.

- Only Primary Administrators, Administrators, and Operations users can edit the 6QA configuration.


## Default 6QA definition

By default, a 6QA definition is applied to all accounts. This definition contains the following logic:

- **Qualification:**

  - **Reason name =** Purchase or Decision Buying Stage.

  - **Buying Stage** = The Account Reached the Purchase or Decision buying stage in the last 60 days.

  - **Profile Fit** = Strong or Moderate.

  - No opportunities were created or lost in the last 90 days.

  - Was not qualified in the last 60 days.
- **Disqualification:** Relevant opportunity opened.

- **Requalification:** Null.


> **Best Practice: keep the default 6QA configuration for reference.**
>
> After you have configured a new 6QA, the default 6QA is removed. If you want to keep this default configuration while you are editing or adjusting new configurations:
>
> 1. Create a [GTM segment](https://support.6sense.com/v1/docs/publish-a-segment-legacy#gotomarket-gtm-segment-nomination) containing all accounts.
>
> 2. Clone the default configuration and apply it to the “all accounts” GTM segment you created.

## Set up 6QAs

You set up 6QAs at the product-GTM segment level.

- The GTM segment identifies a subset of accounts using firmographic and/or named account list segment capabilities.

- 6QA configuration logic identifies the qualification trigger logic, based on predictive, intent, engagement, and CRM-based behavioral filters.


Account prioritization and/or routing can be done based on the many facets of 6QAs, including:

- Product.

- GTM segment.

- Days since 6QA.

- Linking 6QAs to other named account lists that dictate prioritization.


### 6QA-related terminology

**Configuration:** The product-GTM Segment combination of logic that describes accounts’ qualification logic.

_Example:_ You can configure the qualification methods for accounts that are interested in “Widget X” product in your “US Enterprise” GTM Segment, separately from accounts that are interested in the “Widget Y” product in your “US Commercial” GTM Segment.

Each configuration contains a bundle of qualification, disqualification, and requalification logic.

**Criteria:** The individual filters applied to the qualification, disqualification, and requalification logic.

**Qualification:** The various triggers that may cause an account to become qualified. Users can configure multiple qualification “reasons” per configuration.

_Example_: Users can create a qualification threshold regarding one or multiple intent signals, and group this under the qualification reason “>3 G2/ TrustRadius/ 6sense Keywords in last 30 days”.

**Disqualification:** The triggers that will result in an account moving out of the qualified state. This is a universal bundle of logic per configuration.

_Example_: Generally users will want to move accounts out of the 6QA state if they’ve created an opportunity against it.

**Requalification:** After an account has been qualified and disqualified for the first time, the account now has to meet the requalification criteria in order to be qualified again in the future. By default, this means that any disqualified account can be requalified if they meet the qualification criteria again. This is a universal bundle of logic per configuration.

_Example:_ Accounts that are “winback” accounts may be requalified a year after their initial closed-lost status.

**Reason:** The bundle of qualification logic associated with a given configuration. Users can configure one or multiple criteria per reason, and must give the reason a name that will be meaningful to the consumers of this data down the line (in other words, their BDRs/ SDRs who may use this data when cold-calling or prioritizing accounts that have been qualified).

_Example:_ Users can create a qualification threshold regarding one or multiple intent signals, and group this under the qualification reason “>3 G2/ TrustRadius/ 6sense Keywords in last 30 days”.

### Identify the accounts and segment

Identify a subset of accounts for which you want to create a specific 6QA configuration. Refer to [Publishing Segments (opens in new tab)](https://support.6sense.com/v1/docs/publish-a-segment-legacy).

### Define the 6QA

To set up a 6QA definition:

1. In ABM, go to **Settings > Data Settings > 6QA Customization**.

The 6QA Customization page opens.

![](https://cdn.us.document360.io/0e2cd0a2-b3b3-495b-80df-96f8381febea/Images/Documentation/abm-settings-6qa-config-1024x161.png)

2. Select **Create Configuration**.

You see a warning message:

   - Once you have saved a new 6QA configuration, your default 6QA configuration and associated qualified accounts will be overwritten.

   - _Any accounts that were previously 6QAed must meet your new 6QA configurations to continue qualifying, and accounts in GTM segments that are not part of a 6QA configuration will not be eligible for qualification._

   - Please ensure a comprehensive GTM segment and product 6QA strategy prior to saving your new configurations to ensure a smooth transition.
3. Select **OK**.

4. Select the **product category**.

5. Select the **GTM Segment**. ![mceclip1.png](https://cdn.us.document360.io/0e2cd0a2-b3b3-495b-80df-96f8381febea/Images/Documentation/4412365118995-mceclip1.png)

6. Apply filters. Only the following filter types can be employed within criteria edits:

   - **Predictive criteria:** 6sense Predictive filters, such as Buying Stage.

   - **Intent:** Keyword-based filters, based on both 6sense and partner keywords.

   - **Engagement:** All engagement-based filters.

   - **CRM:** CRM field-based filters.

     ![mceclip0.png](https://cdn.us.document360.io/0e2cd0a2-b3b3-495b-80df-96f8381febea/Images/Documentation/4413927157395-mceclip0.png)
7. Enter **Disqualification Criteria**. The default filter for **Days since CRM Opps Created or Lost** is after 90 days back. (This filter does not appear anywhere else in 6sense).

![mceclip1.png](https://cdn.us.document360.io/0e2cd0a2-b3b3-495b-80df-96f8381febea/Images/Documentation/4413912280851-mceclip1.png)

8. Enter **Re-qualification Criteria**.

![mceclip3.png](https://cdn.us.document360.io/0e2cd0a2-b3b3-495b-80df-96f8381febea/Images/Documentation/4413927463187-mceclip3.png)

9. After you specify the qualification, disqualification, and re-qualification criteria, select **Create Configuration** at the bottom of the page.


It takes approximately 24 hours for a new 6QA configuration to take effect and become active.

## Manage 6QA configurations

To manage 6QA definitions, go to the **6QA Configuration** list.

The list shows:

- **6QA Status**: A green check mark in the **Status** column indicates that the configuration is active. An orange arrow circle indicates that the configuration is in processing.

- **6QA Count**: The **6QA Count** column gives the number of 6QAs as of today, found for that configuration/GTM segment combination. An account may qualify as 6QA in more than one segment, so there may be overlap.

- **GTM Segment**: The segment used by the 6QA configuration.

- **Date created**: When the configuration was created.

- **Created by**: The Administrator or Operations user who created the configuration.

- **Active**: You can turn a 6QA configuration on or off by toggling the Active status.


> Only one configuration can be active per product/GTM segment combination.

### Additional actions

Select a configuration’s **More** (three dots) menu to use the following options:

- **View**: Opens the **Review Configuration** page.

- **Edit**: Change the configuration.

- **Clone**: When you create a clone, you create an exact copy of the configuration. You can then edit the clone to create another version of the configuration.

- **Delete**: Delete the configuration.


![](https://cdn.us.document360.io/0e2cd0a2-b3b3-495b-80df-96f8381febea/Images/Documentation/abm-6qa-config-list-1024x253.png)

## 6QA report insights

6sense provides two reports to help you analyze and gain insights about your 6QAs. Refer to:

- [6QA Analytics report insights (opens in new tab)](https://support.6sense.com/v1/docs/6qa-analytics-report)

- [6QA Trends report insights (opens in new tab)](https://support.6sense.com/v1/docs/6qa-trends-report)


## 6QAs in 6sense products

The following 6sense product areas show 6QAs:

- RevM [6sense AI - 6QA filters (opens in new tab)](https://support.6sense.com/v1/docs/segments-overview-new#create-a-segment-using-filters)

- RevM [segment Accounts list (opens in new tab)](https://support.6sense.com/v1/docs/segments-overview-new#preview-segment-or-list-details)

- RevM [Alerts (opens in new tab)](https://support.6sense.com/v1/docs/6sense-abm-alerts)

- Sales Intelligence [Dashboard (opens in new tab)](https://support.6sense.com/v1/docs/6sense-sales-intelligence-dashboards-overview) and [Temperature](https://support.6sense.com/v1/docs/temperature-model)

- Data Workflows [Predictive Scores Exports (opens in new tab)](https://support.6sense.com/v1/docs/export-predictive-scores-from-data-workflows-templates)

- Audience Workflow [filters for decision nodes (opens in new tab)](https://support.6sense.com/v1/docs/audience-workflow-decision-nodes#decision-node-conditions-and-filters) and some [action nodes (opens in new tab)](https://support.6sense.com/v1/docs/audience-workflow-action-nodes)

- [6QA Analytics report insights (opens in new tab)](https://support.6sense.com/v1/docs/6qa-analytics-report)

- [6QA Trends report insights (opens in new tab)](https://support.6sense.com/v1/docs/6qa-trends-report)


## FAQ

#### Why is an account still 6QA if it doesn’t meet the buying stage criteria?

After an account becomes a 6QA, its buying stage can change, such as when the account demonstrates less activities than before. The account will stay in 6QA status for 60 days.

#### What happens if an account is in multiple GTM segments?

There is a single 6QA status flag per account. This account will be eligible to be qualified via the multiple configurations applied to the multiple GTM segments.

Put another way, the account will be able to qualify if it meets any of the GTM segment configurations’ logic. It will only be disqualified if it does not meet any of those configurations’ logic.

#### What happens if an account is qualified via multiple products’ configurations?

Same as above.

#### What happens if an account is qualified via multiple reasons?

Same as above.

#### How do I know if an account is 6QA?

In Revenue Marketing, you can see a segment’s **Accounts** list which has a small 6sense icon with the logo of the account. The icon indicates that the account is 6QA. For a specific account, use **Search Accounts**, then look for the icon. Refer to [segment Accounts list (opens in new tab)](https://support.6sense.com/v1/docs/segments-overview-new#preview-segment-or-list-details).

![](https://cdn.us.document360.io/0e2cd0a2-b3b3-495b-80df-96f8381febea/Images/Documentation/6qa-icon-on-account-logo(1).png)

In Sales Intelligence, go to the **Discovery** page and use the **6sense AI > 6QA > 6QA status** filter. Refer to [6sense Sales Intelligence Discovery (opens in new tab)](https://support.6sense.com/v1/docs/6sense-sales-intelligence-discovery).

Customer Relationship Management, an external platform used to manage your relationships and interactions with potential customers and clients.

Account-Based Marketing, the former name of the 6sense Revenue Marketing product.

Was this article helpful?

Yes  No

Previous article

Predictive Buying Stages

Next article

Data Taxonomy
