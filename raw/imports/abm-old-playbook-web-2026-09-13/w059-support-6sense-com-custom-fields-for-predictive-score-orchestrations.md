---
type: "web-source-capture"
title: "Custom Fields for Predictive Score Orchestrations"
url: "https://support.6sense.com/docs/custom-fields-for-predictive-score-orchestrations"
resolved_url: "https://support.6sense.com/docs/custom-fields-for-predictive-score-orchestrations"
captured_at: "2026-09-13T17:59:12.391308+00:00"
capture_method: "Firecrawl main-content Markdown; non-generative extraction"
capture_scope: "full-main-text"
source_id: "W059"
capture_receipt: "wiki/_outputs/abm-old-playbook-2026-09-13/web-ingest/receipts/w059.json"
selection_authority: "User-selected URLs from ABM old-playbook research, 2026-09-13; custody is not claim approval"
---

> ## Documentation Index
>
> Fetch the complete documentation index at: [https://support.6sense.com/llms.txt](https://support.6sense.com/llms.txt)
>
> Use this file to discover all available pages before exploring further.

# Custom Fields for Predictive Score Orchestrations

- Published on Jul 11, 2025

- 8 minute(s) read
- Listen

Follow

Print

Copy pageCopy as Markdown for LLMsView as MarkdownView the page as plain text

Open in ChatGPTAsk ChatGPT about this pageOpen in ClaudeAsk Claude about this page

Article summary

[Prev](https://support.6sense.com/docs/smart-form-fill "Smart Form Fill")[Next](https://support.6sense.com/docs/abm-platform-settings-landing-page "ABM Platform Settings Landing Page")

This article serves to advise the customer on what field they should create and in what format on the three standard objects (Account, Contact and Lead) in SFDC when exporting scores. This will help with implementation during onboarding.

**Recommended Custom Fields:** Create Custom Fields on the Lead, Contact and Account/Company objects:

- Customers with a **single predictive model**, please replace the **_\_<ProductCat>_** to the product family name of your model, the name of your company, or keep it simple without any product in the name.

- Customers with **multiple predictive models**, please create the fields for each of your models and swap **_\_<ProductCat>_** with the name of the product category of the predictive model. Only a single field is needed for Update Date.


**Recommended Field-Level Security:** Visible and Read-Only to any profile that needs to see the score, but Visible and Editable (in other words, Read-Only unchecked) for the integration user set in 6sense ABM integration settings.

**Maximum Values for Number Field-Data Type:** Numbers are whole numbers (no decimals) with a maximum of three digits. (They pass 0–100.)

> Make sure you have migrated from the legacy Salesforce Score Exports to the new integration. Instructions for migration can be viewed in [Preparing for Your Salesforce Predictive Score Migration](https://support.6sense.com/v1/docs/prepare-for-a-salesforce-predictive-score-migration).

## **Lead Object (not available for HubSpot CRM)**

| **Field Label**<br>**(Display Name)** | **Field Name** | **Field-Data Type** | **Recommended**<br>**Description/Help Text** |
| 6sense Lead Intent Score <ProductCat> | leadIntentScore6sense\_<ProductCat> | Number | A measure, between 0 and 100, of how engaged a person is with your first party sales and marketing tactics compared to previous buyers. Engagement activities of a person, along with historical opportunity history, are used by data science models to create this measure. |
| 6sense Lead Profile Fit <ProductCat> | leadProfileFit6sense\_<ProductCat> | Text | A measure of how similar the person is to your typical buyer or buying committee members. Demographic factors of a person record, along with historical opportunity history, are used by data science models to create this measure. |
| 6sense Lead Grade <ProductCat> | leadGrade6sense\_<ProductCat> | Text | A measure of how engaged a person is with your first party sales and marketing tactics compared to previous buyers. Engagement activities of a person, along with historical opportunity history, are used by data science models to create this measure. |
| 6sense Lead Profile Score <ProductCat> | leadProfileScore6sense\_<ProductCat> | Number | A measure, between 0 and 100, of how similar the person is to your typical buyer or buying committee members. Demographic factors of a person record, along with historical opportunity history, are used by data science models to create this measure. |
| 6sense Account Intent Score <ProductCat> | accountIntentScore6sense\_<ProductCat> | Number | A measure, between 0 and 100, of how much an account is behaving like accounts with which there is a history of previously opened opportunities. |
| 6sense Account Profile Fit <ProductCat> | accountProfileFit6sense\_<ProductCat> | Text | A measure of how similar a company is to the ideal customer profile. Firmographic and technographic factors of an account, along with historical opportunity history, are used by data science models to create this measure. |
| 6sense Account Buying Stage <ProductCat> | accountBuyingStage6sense\_<ProductCat> | Text | The categorical representation of the measure of how much an account is behaving like accounts with which there is a history of previously opened opportunities.<br>**Target:** The buyer may not realize a problem exists, but may fit within the seller’s TAM.<br>**Awareness:** The buyer realizes they have a problem. The buyer is doing educational research to more clearly understand, frame, and identify their problem. <br>**Consideration:** The buyer defines their problem and researches options to solve it. The buyer is researching all of the available options to solve the defined problem.<br>**Decision:** The buyer chooses a solution. The buyer is narrowing a list of potential vendors to ultimately make a purchase decision.<br>**Purchase:** The buyer commits to a specific solution and justifies the reasons for the purchase. |
| 6sense Account Profile Score <ProductCat> | accountProfileScore6sense\_<ProductCat> | Number | A measure of how similar a company is to the ideal customer profile. Firmographic and technographic factors of an account, along with historical opportunity history, are used by data science models to create this measure. |
| 6sense Account 6QA Start Date <ProductCat> | account6QAStartDate6sense\_<ProductCat> | Date | The date the account qualified for 6QA status (YYYY-MM-DD). |
| 6sense Account 6QA End Date <ProductCat> | account6QAEndDate6sense\_<ProductCat> | Date | The date the account was disqualified from 6QA status (YYYY-MM-DD). |
| 6sense Account 6QA Age in Days <ProductCat> | account6QAAgeInDays6sense\_<ProductCat> | Number | Days the account has been in 6QA status. |
| 6sense Account 6QA <ProductCat> | account6QA6sense\_<ProductCat> | Boolean/Checkbox | The 6QA status of the account for the product.<br>The values are either:<br>- 1 = 6QA<br>  <br>- 0 = Not 6QA |
| 6sense Account Numerical Reach Score <ProductCat> | accountNumericalReachScore6sense\_<ProductCat> | Number | 6sense’s current assessment of your team’s outreach on the account in comparison to the other accounts where opportunities were won previously. |
| 6sense Lead Update Date <ProductCat> | leadUpdateDate6sense\_<ProductCat> | Date | The latest update date and time when 6sense Scores were updated. |

## **Account/Company Object**

| **Field Label (Display Name)** | **Field Name** | **Data Type** | **Recommended**<br>**Description/Help Text** |
| 6sense Account Intent Score <ProductCat> | accountIntentScore6sense\_<ProductCat> | Number | A measure, between 0 and 100, of how much an account is behaving like accounts with which there is a history of previously opened opportunities. |
| 6sense Account Profile Fit <ProductCat> | accountProfileFit6sense\_<ProductCat> | Text | A measure of how similar a company is to the ideal customer profile. Firmographic and technographic factors of an account, along with historical opportunity history, are used by data science models to create this measure. |
| 6sense Account Profile Score <ProductCat> | accountProfileScore6sense\_<ProductCat> | Number | A measure of how similar a company is to the ideal customer profile. Firmographic and technographic factors of an account, along with historical opportunity history, are used by data science models to create this measure. |
| 6sense Account Reach Score <ProductCat> | accountReachScore6sense\_<ProductCat> | Text | A measure of current outreach activities against optimal quality, quantity, and diversity of outreach activities as defined by your company’s historical success on won opportunities. Outbound calls, both marketing and sales emails are analyzed for this measure. For additional information please see this [FAQ](https://support.6sense.com/v1/docs/2020-07-06-product-updates#account-reach-score). |
| 6sense Account Numerical Reach Score <ProductCat> | accountNumericalReachScore6sense\_<ProductCat> | Number | A measure, between 0 and 100, represents 6sense’s current assessment of your team’s outreach on the account in comparison to the other accounts where opportunities were won previously. |
| 6sense Account Buying Stage <ProductCat> | accountBuyingStage6sense\_<ProductCat> | Text | The categorical representation of the measure of how much an account is behaving like accounts with which there is a history of previously opened opportunities.<br>**Target:** The buyer may not realize a problem exists, but may fit within the seller’s TAM.<br>**Awareness:** The buyer realizes they have a problem. The buyer is doing educational research to more clearly understand, frame, and identify their problem.<br>**Consideration:** The buyer defines their problem and researches options to solve it. The buyer is researching all of the available options to solve the defined problem.<br>**Decision:** The buyer chooses a solution. The buyer is narrowing a list of potential vendors to ultimately make a purchase decision.<br>**Purchase:** The buyer commits to a specific solution and justifies the reasons for the purchase. |
| 6sense 6QA <ProductCat> | account6QA6sense\_<ProductCat> | Boolean/Checkbox | The 6QA status of the account for the product.<br>The values are either:<br>- 1 = 6QA<br>  <br>- 0= Not 6QA |
| 6sense Account 6QA Start Date <ProductCat> | account6QAStartDate6sense\_<ProductCat> | Date | The date the account qualified for 6QA status (YYYY-MM-DD). |
| 6sense Account 6QA End Date <ProductCat> | account6QAEndDate6sense\_<ProductCat> | Date | The date the account was disqualified from 6QA status (YYYY-MM-DD). |
| 6sense Account 6QA Age in Days <ProductCat> | account6QAAgeInDays6sense\_<ProductCat> | Number | Days the account has been in 6QA status. |
| 6sense Account Update Date <ProductCat> | accountUpdateDate6sense\_<ProductCat> | Date | The latest update date and time when 6sense Scores were updated. |
| 6sense Segments <ProductCat> | 6sensesegments\_<ProductCat> | Text Area (long) | A list of published 6sense Segment Names corresponding to the 6sense Segments that account or person record is associated with. |

## **Contact Object**

| **Field Label (Display Name)** | **Field Name** | **Data Type** | **Recommended**<br>**Description/Help Text** |
| 6sense Contact Intent Score <ProductCat> | contactIntentScore6sense\_<ProductCat> | Number | A measure of how engaged a person is with your first party sales and marketing tactics compared to previous buyers. Engagement activities of a person, along with historical opportunity history, are used by data science models to create this measure. |
| 6sense Contact Profile Fit <ProductCat> | contactProfileFit6sense\_<ProductCat> | Text | A measure of how similar the person is to your typical buyer or buying committee members. Demographic factors of a person record, along with historical opportunity history, are used by data science models to create this measure. |
| 6sense Contact Grade <ProductCat> | contactGrade6sense\_<ProductCat> | Text | A measure of how engaged a person is with your first party sales and marketing tactics compared to previous buyers. Engagement activities of a person, along with historical opportunity history, are used by data science models to create this measure. |
| 6sense Contact Profile Score <ProductCat> | contactProfileScore6sense\_<ProductCat> | Number | A measure of how similar the person is to your typical buyer or buying committee members. Demographic factors of a person record, along with historical opportunity history, are used by data science models to create this measure. |
| 6sense Account Intent Score <ProductCat> | accountIntentScore6sense\_<ProductCat> | Number | A measure, between 0 and 100, of how much an account is behaving like accounts with which there is a history of previously opened opportunities. |
| 6sense Account Buying Stage <ProductCat> | accountBuyingStage6sense\_<ProductCat> | Text | The categorical representation of the measure of how much an account is behaving like accounts with which there is a history of previously opened opportunities.<br>**Target:** The buyer may not realize a problem exists, but may fit within the seller’s TAM.<br>**Awareness:** The buyer realizes they have a problem. The buyer is doing educational research to more clearly understand, frame, and identify their problem.<br>**Consideration:** The buyer defines their problem and researches options to solve it. The buyer is researching all of the available options to solve the defined problem.<br>**Decision:** The buyer chooses a solution. The buyer is narrowing a list of potential vendors to ultimately make a purchase decision.<br>**Purchase:** The buyer commits to a specific solution and justifies the reasons for the purchase. |
| 6sense Account Profile Score <ProductCat> | accountProfileScore6sense\_<ProductCat> | Number | A measure of how similar a company is to the ideal customer profile. Firmographic and technographic factors of an account, along with historical opportunity history, are used by data science models to create this measure. |
| 6sense Account Profile Fit <ProductCat> | accountProfileFit6sense\_<ProductCat> | Text | A measure of how similar a company is to the ideal customer profile. Firmographic and technographic factors of an account, along with historical opportunity history, are used by data science models to create this measure. |
| 6sense Account 6QA Start Date <ProductCat> | account6QAStartDate6sense\_<ProductCat> | Date | The date the account qualified for 6QA status (YYYY-MM-DD). |
| 6sense Account 6QA End Date <ProductCat> | account6QAEndDate6sense\_<ProductCat> | Date | The date the account was disqualified from 6QA status (YYYY-MM-DD). |
| 6sense Account 6QA Age in Days <ProductCat> | account6QAAgeInDays6sense\_<ProductCat> | Number | Days the account has been in 6QA status. |
| 6sense Account 6QA <ProductCat> | account6QA6sense\_<ProductCat> | Boolean/Checkbox | The 6QA status of the account for the product.<br>The values are either:<br>- 1 = 6QA<br>  <br>- 0= Not 6QA |
| 6sense Account Numerical Reach Score <ProductCat> | accountNumericalReachScore6sense\_<ProductCat> | Number | 6sense’s current assessment of your team’s outreach on the account in comparison to the other accounts where opportunities were won previously. |
| 6sense Contact Update Date <ProductCat> | contactUpdateDate6sense\_<ProductCat> | Date | The latest update date and time when 6sense Scores were updated. |

## **SFDC Visual Force Sales Intelligence Component Installation**

- Refer to [(Legacy) Installation of 6sense Sales Intelligence on Salesforce](https://support.6sense.com/v1/docs/installation-of-sales-intelligence-for-salesforce)

- **Guide on setting up score export orchestration**

  - Refer to [Setup Score Exports Orchestration](https://support.6sense.com/v1/docs/set-up-score-exports-orchestration)
- **Additional documents**

  - (Legacy) FAQ: SFDC Sales Intelligence Iframe

Was this article helpful?

Yes  No

Previous article

Smart Form Fill

Next article

ABM Platform Settings Landing Page

Related articles

- [Salesforce Custom Data Objects](https://support.6sense.com/docs/salesforce-custom-data-objects)



Revenue Marketing > Revenue Marketing Orchestration

- [Creating 6sense Score Export Fields on Standard Tables in Microsoft Dynamics](https://support.6sense.com/docs/creating-6sense-score-export-fields-on-standard-tables-in-microsoft-dynamics)



Revenue Marketing > Revenue Marketing Orchestration

- [Microsoft Dynamics Custom Data Objects](https://support.6sense.com/docs/microsoft-dynamics-custom-data-objects)



Revenue Marketing > Revenue Marketing Orchestration
