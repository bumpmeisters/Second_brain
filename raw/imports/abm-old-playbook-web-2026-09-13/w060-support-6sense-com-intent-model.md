---
type: "web-source-capture"
title: "Intent Model"
url: "https://support.6sense.com/docs/intent-model"
resolved_url: "https://support.6sense.com/docs/intent-model"
captured_at: "2026-09-13T17:59:18.561227+00:00"
capture_method: "Firecrawl main-content Markdown; non-generative extraction"
capture_scope: "full-main-text"
source_id: "W060"
capture_receipt: "wiki/_outputs/abm-old-playbook-2026-09-13/web-ingest/receipts/w060.json"
selection_authority: "User-selected URLs from ABM old-playbook research, 2026-09-13; custody is not claim approval"
---

> ## Documentation Index
>
> Fetch the complete documentation index at: [https://support.6sense.com/llms.txt](https://support.6sense.com/llms.txt)
>
> Use this file to discover all available pages before exploring further.

# Intent Model

- Updated on Jul 23, 2025
- Published on Jun 26, 2025

- 1 minute(s) read
- Listen

Follow

Print

Copy pageCopy as Markdown for LLMsView as MarkdownView the page as plain text

Open in ChatGPTAsk ChatGPT about this pageOpen in ClaudeAsk Claude about this page

Article summary

[Prev](https://support.6sense.com/docs/predictive-and-temperature-use-cases "Predictive and Temperature Use Cases")[Next](https://support.6sense.com/docs/account-profile-fit-model "Account Profile Fit Model")

Predictive intent scores predict the likelihood an account is interested in buying the product or service being sold. (Intent scores have also been called engagement scores.)

Predictive also uses intent scores to determine [buying stages (opens in new tab)](https://support.6sense.com/v1/docs/predictive-buying-stages) and [6QAs](https://support.6sense.com/v1/docs/6sense-qualified-accounts-6qas).

## Data inputs

The Predictive company activity AI model considers the following activities when calculating intent scores:

- CRM (excluding Task and Event)

- MAP

- Web

- Business-to-business network (B2BN) keyword

- 3rd party intent activities (using Bombora, G2, TrustRadius)


The intent score is the output of the Predictive company activity model that uses an account’s historical activity data to determine the likelihood of the account opening an opportunity in the next 90 days.

## How intent is measured

Intent is measured from 0-100, with a higher score indicating a higher interest, and therefore likelihood of opening an opportunity. Each account’s intent score is updated daily to account for any new activities.

## How intent is used

Intent scores are inputs to [buying stages (opens in new tab)](https://support.6sense.com/v1/docs/predictive-buying-stages) and [6QAs](https://support.6sense.com/v1/docs/6sense-qualified-accounts-6qas).

Also refer to the the Model Insights report, specifically the [Account behavior model](https://support.6sense.com/v1/docs/predictive-model-insights-report#account-behavior-model) panel that covers account buying stages.

Customer Relationship Management, an external platform used to manage your relationships and interactions with potential customers and clients.

Marketing Automation Platform, a 3rd-party platform that automates your marketing tasks and workflows, allowing for more efficient marketing campaigns.

Was this article helpful?

Yes  No

Previous article

Predictive and Temperature Use Cases

Next article

Account Profile Fit Model

Related articles

- [6sense Scores Overview](https://support.6sense.com/docs/6sense-scores-overview)



Predictive Modeling > Predictive Overviews

- [Predictive Buying Stages](https://support.6sense.com/docs/predictive-buying-stages)



Predictive Modeling > Predictive Overviews
