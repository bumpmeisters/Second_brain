---
type: "web-source-capture"
title: "Qualify and convert a lead to opportunity | Microsoft Learn"
url: "https://learn.microsoft.com/en-us/dynamics365/sales/qualify-lead-convert-opportunity-sales"
resolved_url: "https://learn.microsoft.com/en-us/dynamics365/sales/qualify-lead-convert-opportunity-sales"
captured_at: "2026-09-13T17:55:38.062595+00:00"
capture_method: "Firecrawl main-content Markdown; non-generative extraction"
capture_scope: "full-main-text"
source_id: "W041"
capture_receipt: "wiki/_outputs/abm-old-playbook-2026-09-13/web-ingest/receipts/w041.json"
selection_authority: "User-selected URLs from ABM old-playbook research, 2026-09-13; custody is not claim approval"
---

Table of contents Exit editor mode

Ask LearnAsk Learn

Reading modeTable of contents[Read in English](https://learn.microsoft.com/en-us/dynamics365/sales/qualify-lead-convert-opportunity-sales)Add to CollectionsAdd to Plans[Edit](https://github.com/MicrosoftDocs/dynamics-365-customer-engagement/blob/main/ce/sales/qualify-lead-convert-opportunity-sales.md)

* * *

Copy MarkdownPrint

* * *

Note

Access to this page requires authorization. You can try [signing in](https://learn.microsoft.com/en-us/dynamics365/sales/qualify-lead-convert-opportunity-sales#) or changing directories.


Access to this page requires authorization. You can try changing directories.


# Qualify and convert a lead to opportunity

Feedback

Summarize this article for me


Qualifying leads is essential to move prospects through your sales pipeline efficiently. When you qualify a lead, you validate that it's a genuine sales opportunity and associate an account and contact, and create the corresponding opportunity record to track the deal. For leads that don't meet your criteria, you can disqualify them while maintaining an audit trail. For example, if a prospect provides a budget and a clear decision timeline, you'd qualify them to generate an opportunity you can actively work toward closing.

Tip

If you’d like to try Dynamics 365 Sales for free, you can sign up for a [30-day trial](https://dynamics.microsoft.com/en-us/sales/sales/free-trial/).

[Section titled: Qualify a lead](https://learn.microsoft.com/en-us/dynamics365/sales/qualify-lead-convert-opportunity-sales#qualify-a-lead)

## Qualify a lead

1. From the site map, select **Leads**.

2. In the list of leads, open the lead that you want to qualify. You can also [qualify multiple leads at the same time](https://learn.microsoft.com/en-us/dynamics365/sales/qualify-lead-convert-opportunity-sales#qualify-leads-in-bulk).

3. (Optional) In the **Qualify** section of the process bar, specify the following information:

   - If the lead is from an existing account or contact, select the account in the **Existing Account** field and the account in the **Existing Contact** field. This step is optional because you can create a new account and contact in the next step, or use an existing account and contact, depending on how your administrator configured the lead qualification experience.
   - Specify other details, such as the purchase time frame and estimated budget.
4. On the command bar, select **Qualify**.

Depending on the lead qualification experience that your admin configured, you experience one of the following flows:


   - [New experience](https://learn.microsoft.com/en-us/dynamics365/sales/qualify-lead-convert-opportunity-sales#new-experience)
   - [Legacy experience](https://learn.microsoft.com/en-us/dynamics365/sales/qualify-lead-convert-opportunity-sales#legacy-experience)

The lead is moved to the next stage of the business process. The lead is also removed from the **My Open Leads** view and added to the **Closed Leads** view.

Note

If no opportunity is created when you qualify a lead, the business process flow doesn't progress to the next stage, although the lead's status becomes _Qualified_.

[Section titled: New experience](https://learn.microsoft.com/en-us/dynamics365/sales/qualify-lead-convert-opportunity-sales#new-experience)

### New experience

As part of the [new lead qualification experience](https://learn.microsoft.com/en-us/dynamics365/sales/define-lead-qualification-experience#difference-between-new-lead-qualification-experience-and-legacy-experience), your admin can customize several aspects of the lead qualification process.

[Section titled: Record creation](https://learn.microsoft.com/en-us/dynamics365/sales/qualify-lead-convert-opportunity-sales#record-creation)

#### Record creation

- If your admin turned on the new experience and the automatic creation of account, contact, and opportunity records, the system automatically creates the records. While the system creates the records, it shows a "Processing" message. After the system creates the records, it opens the opportunity record.

- If your admin turned off automatic creation for all records, the **Qualify lead** side pane appears for creating contact, account, and opportunity records. For contact and account records, you can create a new record, use an existing record, or skip record creation.



Note



For the account record, the **Create new** option is available only when the **Company name** field is set in the lead record.

- If your admin turned on automatic creation for some records and manual creation for others, the **Qualify lead** side pane is displayed. It shows records that the system creates automatically and records that you must create manually. For example, the account and contact records might be set for automatic creation, whereas the opportunity record is set for manual creation. The following screenshot shows an example of the side pane for this scenario:

![Screenshot of the Qualify lead side pane when record creation is set to automatic for the contact and account records, but set to manual for the opportunity record.](https://learn.microsoft.com/en-us/dynamics365/sales/media/qualify-lead-dialog-box-mix.png)

In this example, the account and contact records aren't editable. If you must change the account or contact details, close the side pane, edit the details in the **Lead** form, and then select **Qualify**.


Learn how the fields in the lead record are mapped to other records in [Field mappings to other entities](https://learn.microsoft.com/en-us/dynamics365/sales/define-lead-qualification-experience#field-mappings-to-other-entities). If a similar account or contact already exists, the duplicate detection dialog appears. You can then either create a new record or use the existing record. Learn more in [What happens when duplicates are found while qualifying leads?](https://learn.microsoft.com/en-us/dynamics365/sales/faq-lead#what-happens-when-duplicates-are-found-while-qualifying-leads)

[Section titled: Multiple opportunity creation](https://learn.microsoft.com/en-us/dynamics365/sales/qualify-lead-convert-opportunity-sales#multiple-opportunity-creation)

#### Multiple opportunity creation

If your admin turned on multiple opportunity creation, you can create up to five opportunities for each lead. A default opportunity record is added to the **Qualify lead** side pane. To create more opportunities, follow these steps:

1. In the **Qualify lead** side pane, select **+ New Opportunity**. If the **+ New Opportunity** button is unavailable, learn why in [Why can't I edit or create multiple opportunities for a lead in the new lead qualification experience?](https://learn.microsoft.com/en-us/dynamics365/sales/faq-lead#why-cant-i-edit-or-create-multiple-opportunities-for-a-lead-in-the-new-lead-qualification-experience)

2. In the **Quick create** form for adding opportunities, enter the details of the opportunity. If you want the opportunity form to include different fields, talk to your admin about [customizing the opportunity form](https://learn.microsoft.com/en-us/dynamics365/sales/define-lead-qualification-experience#customize-opportunity-creation-experience-for-qualified-leads).

3. Save the opportunity record.

The system doesn't create the records until you select **Qualify**. If you close the **Qualify lead** side pane without qualifying the lead, the system doesn't create any records. The business process flow is only available in the default opportunity record. Learn more in [Why can't I see the business process flow on all the newly created opportunities?](https://learn.microsoft.com/en-us/dynamics365/sales/faq-lead#why-cant-i-see-the-business-process-flow-on-all-the-newly-created-opportunities)


[Section titled: Lead summary](https://learn.microsoft.com/en-us/dynamics365/sales/qualify-lead-convert-opportunity-sales#lead-summary)

#### Lead summary

If your admin [turned on lead summarization](https://learn.microsoft.com/en-us/dynamics365/sales/define-lead-qualification-experience#summarize-the-lead-after-its-qualified), an AI-generated summary of the lead is shown after the lead is qualified. The summary includes key details from the lead record and is added to the timeline of the primary opportunity record and the lead record.

![Screenshot of the Lead qualified page that appears after the lead is qualified.](https://learn.microsoft.com/en-us/dynamics365/sales/media/lead-qualify-finish-page.png)

Select **Finish** to open the primary opportunity record, and select the **Close** button ( **X**) at the top of the pane to return to the lead record.

[Section titled: Legacy experience](https://learn.microsoft.com/en-us/dynamics365/sales/qualify-lead-convert-opportunity-sales#legacy-experience)

### Legacy experience

- If your admin turned on automatic creation, account, contact, and opportunity records are automatically created when you qualify the lead.

- If your admin turned off automatic creation, you're prompted to select which records to create when you qualify the lead (account, contact, or opportunity).

![Screenshot that shows account and contact records selected for creation in the Qualify lead dialog.](https://learn.microsoft.com/en-us/dynamics365/sales/media/qualify-lead-dialog-box.png)


Learn more:

- [What happens when a lead is qualified?](https://learn.microsoft.com/en-us/dynamics365/sales/faq-lead#what-happens-when-a-lead-is-qualified)
- [What happens when duplicates are found while qualifying leads?](https://learn.microsoft.com/en-us/dynamics365/sales/faq-lead#what-happens-when-duplicates-are-found-while-qualifying-leads)
- [How do I handle lead qualification errors?](https://learn.microsoft.com/en-us/dynamics365/sales/faq-lead#how-do-i-handle-lead-qualification-errors)

[Section titled: Qualify leads in bulk](https://learn.microsoft.com/en-us/dynamics365/sales/qualify-lead-convert-opportunity-sales#qualify-leads-in-bulk)

## Qualify leads in bulk

You can qualify multiple leads at the same time. To qualify multiple leads, open the **Leads** page in a read-only grid view, and select the leads that you want to qualify. Then, on the command bar, select **Qualify**.

If your admin turned on automatic creation in the legacy experience, the records are automatically created. If your admin turns off automatic creation or turns on the new experience, a dialog appears. In the dialog, you can select which records to create when you qualify the lead.

[Section titled: Disqualify a lead](https://learn.microsoft.com/en-us/dynamics365/sales/qualify-lead-convert-opportunity-sales#disqualify-a-lead)

## Disqualify a lead

If you know that a lead won't turn into an opportunity, you can disqualify it and still have an audit trail for your sales process. If the lead contacts you in the future, you can reactivate the record, including any attachments and notes, without having to reenter all the data. If you delete the record, any attachments and notes are also removed.

Note

You can disqualify a lead only if no opportunity is associated with it.

To disqualify a lead, select the lead, and then, on the command bar, select **Disqualify**.

[Section titled: Troubleshoot issues and get answers to frequently asked questions about lead qualification](https://learn.microsoft.com/en-us/dynamics365/sales/qualify-lead-convert-opportunity-sales#troubleshoot-issues-and-get-answers-to-frequently-asked-questions-about-lead-qualification)

## Troubleshoot issues and get answers to frequently asked questions about lead qualification

- Learn how to fix common errors that you might encounter while qualifying a lead in the [troubleshooting guide](https://learn.microsoft.com/en-us/dynamics365/sales/troubleshooting).
- Get answers to frequently asked questions about lead qualification in [Lead management FAQs](https://learn.microsoft.com/en-us/dynamics365/sales/faq-lead).

[Section titled: Typical next steps](https://learn.microsoft.com/en-us/dynamics365/sales/qualify-lead-convert-opportunity-sales#typical-next-steps)

## Typical next steps

![Right arrow button](https://learn.microsoft.com/en-us/dynamics365/sales/media/orange-right-arrow-button.png)[Create or edit an opportunity](https://learn.microsoft.com/en-us/dynamics365/sales/create-edit-opportunity-sales)

![Home button](https://learn.microsoft.com/en-us/dynamics365/sales/media/home-button.png)[Learn about the sales process, nurturing sales from lead to order](https://learn.microsoft.com/en-us/dynamics365/sales/nurture-sales-from-lead-order-sales)

[Section titled: Can't find the feature in your app?](https://learn.microsoft.com/en-us/dynamics365/sales/qualify-lead-convert-opportunity-sales#cant-find-the-feature-in-your-app)

## Can't find the feature in your app?

There are a few possibilities:

- You don't have the necessary license to use this feature. Check out the [comparison table](https://www.microsoft.com/dynamics-365/products/sales/pricing#comparison-table) and the [licensing guide](https://go.microsoft.com/fwlink/?LinkId=866544&clcid=0x409) to see which features are available with your license.
- You don't have the necessary security role to use this feature.
  - To configure or setup a feature, you need to have the [Administration and customization roles](https://learn.microsoft.com/en-us/dynamics365/sales/security-roles-for-sales#administration-and-customization-roles)
  - To use sales-related features, you need to have the [Primary sales roles](https://learn.microsoft.com/en-us/dynamics365/sales/security-roles-for-sales#primary-sales-roles)
  - Some tasks require specific [Functional roles](https://learn.microsoft.com/en-us/dynamics365/sales/security-roles-for-sales#functional-roles).
- Your administrator hasn't turned on the feature.
- Your organization is using a custom app. Check with your administrator for exact steps. The steps described in this article are specific to the out-of-the-box Sales Hub and Sales Professional apps.

[Section titled: Related information](https://learn.microsoft.com/en-us/dynamics365/sales/qualify-lead-convert-opportunity-sales#related-information)

## Related information

[Customize the lead qualification experience](https://learn.microsoft.com/en-us/dynamics365/sales/define-lead-qualification-experience)

[Print quote, invoice, or other records](https://learn.microsoft.com/en-us/dynamics365/sales/print-records)

[Dynamics 365 Sales troubleshooting guide](https://learn.microsoft.com/en-us/dynamics365/sales/troubleshooting)

[Prioritize leads through scores](https://learn.microsoft.com/en-us/dynamics365/sales/work-predictive-lead-scoring)

[Insights, powered by InsideView](https://learn.microsoft.com/en-us/dynamics365/insights-insideview/insights-powered-by-insideview)

[FAQs about lead qualification experience](https://learn.microsoft.com/en-us/dynamics365/sales/faq-lead#faqs-about-lead-qualification-experience)

[Troubleshoot issues with lead qualification issues for salespeople](https://learn.microsoft.com/en-us/troubleshoot/dynamics-365/sales/troubleshoot-lead-qualification-issues-for-salespeople)

Reading mode disabled

* * *

## Feedback

Was this page helpful?


YesNoNo

Need help with this topic?


Want to try using Ask Learn to clarify or guide you through this topic?


Ask LearnAsk Learn

Suggest a fix?

* * *

## Additional resources

Training

Module

[Nurture and Generate Leads in Dynamics 365 Sales - Training](https://learn.microsoft.com/en-us/training/modules/manage-leads-dynamics-365-sales/?source=recommendations)

Configure lead management in Dynamics 365 Sales to capture, nurture, and prioritize leads. Explore lead creation methods including integration with Customer Insights, configure predictive lead scoring, and use Copilot to surface insights that help sellers focus on the right leads.

* * *

- Last updated on 04/30/2026

Ask Learn is an AI assistant that can answer questions, clarify concepts, and define terms using trusted Microsoft documentation.

Please sign in to use Ask Learn.

[Sign in](https://learn.microsoft.com/en-us/dynamics365/sales/qualify-lead-convert-opportunity-sales#)
