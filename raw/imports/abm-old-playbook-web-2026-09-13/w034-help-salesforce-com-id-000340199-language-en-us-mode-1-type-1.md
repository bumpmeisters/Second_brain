---
type: "web-source-capture"
title: "Convert a Lead into a current Contact or Opportunity | Salesforce Help"
url: "https://help.salesforce.com/s/articleView?id=000340199&language=en_US&mode=1&type=1"
resolved_url: "https://help.salesforce.com/s/articleView?id=000388015&type=1"
captured_at: "2026-09-13T17:54:46.118325+00:00"
capture_method: "Firecrawl main-content Markdown; non-generative extraction"
capture_scope: "full-main-text"
source_id: "W034"
capture_receipt: "wiki/_outputs/abm-old-playbook-2026-09-13/web-ingest/receipts/w034.json"
selection_authority: "User-selected URLs from ABM old-playbook research, 2026-09-13; custody is not claim approval"
---

![Help](https://a.sfdcstatic.com/shared/images/c360-nav/salesforce-no-type-logo.svg)

Help

[![](https://a.sfdcstatic.com/shared/images/c360-nav/salesforce-no-type-logo.svg)\\
Help](https://help.salesforce.com/s)

Loading

[×](https://help.salesforce.com/s/articleView?id=000388015&type=1# "Cancel and close") Sorry to interrupt

CSS Error

[Refresh](https://help.salesforce.com/s/articleView?nocache=https%3A%2F%2Fhelp.salesforce.com%2Fs%2FarticleView%3Fid%3D000340199%26language%3Den_US%26mode%3D1%26type%3D1)

Modal Body...

Hi there! Ask me product support and troubleshooting questions.

Ask Agentforce

Connected to Agentforce. Press enter to send your message

Prepare for Email to Become the Default Login ExperienceRead More

Close

# Convert a Lead into a current Contact or Opportunity

Publish Date: Apr 3, 2026

Description

This scenario explains the Lead Conversion in Salesforce Classic and Lightning Experience.

When you convert a Lead, you create a new account or connect to an existing Account. When you select new Account, a new Contact is created.

However, converting Lead to an existing Contact or Opportunity is possible if it’s attached to the existing Account and the existing Contact or Opportunity related to the same Account.

Resolution

## **Associate a converted Lead to an existing Contact in Salesforce Classic or Lightning Experience**

To select an existing Contact record during the lead conversion process has two requirements:

- You can create an account or choose an existing account.
- There must be an existing Contact to de-dupe against.

If you don't have access to the two requirements above, you can't see the "Attach to Existing Contact" screen.

If your user meets the above requirements, follow the steps below to convert the Lead:

### Classic Instructions:

1. Click the **Lead** tab.
2. Open the Lead record that needs to be converted and click **Convert.**
3. In the Account Name field, select **Attach to Existing Account** (for example: "Big cars Account").
4. Complete the other details on the page as per the requirement and click **Convert.**
5. Since a Contact with the same name already exists in the selected Account, it allows you to either create a new Contact or Attach to an existing contact.
6. Select the Contact in which you want to merge the Lead while converting.
7. Click **Convert**.

### Lightning Experience Instructions:

1. Navigate to the Lead record
2. Click **Convert** on the upper right part of the page
3. Convert to Existing Account
4. Then choose to convert to the existing contact if there is a duplicate detected
5. Select the existing contact record you want the lead to be converted to
6. Update Lead Source of the existing contact (Optional)
7. Select a record owner and converted status and click **Convert**

**Notes**:

- As Opportunity is a required field, but if you don't want to convert the lead into opportunity, select the **'Don't create an opportunity upon conversion'** checkbox.

**Note**: On lead conversion, Opportunity must have a default record type, even though we have selected the option 'Don't create an opportunity upon conversion', otherwise user will not be able to convert the lead and will get the error ' **Unable to find default record type**'.
- If the Convert button is not displayed, check the page layout of the object. The Convert button is Mobile & LIghtning Action and needs to be placed under the Salesforce Mobile and Lightning Experience Actions section. If the layout does not include this action, the Convert button won't be displayed.
- The same applies when converting a Lead into an existing Opportunity. You can only convert a Lead to an existing Opportunity if the Account is already available and when you choose an existing Account, you can then select existing Opportunities related to the Account.
- Only 20 matching Opportunities can be shown when converting and selecting the option "existing Opportunities."

Additional Resources

- **[Considerations for Converting Leads](https://help.salesforce.com/s/articleView?id=sf.leads_notes.htm&type=5&language=en_US)**
- [**Common errors in Lead conversion**](https://help.salesforce.com/s/articleView?id=000383660&type=1&language=en_US)
- [**Error 'There was an error converting the lead' on Lead Conversion**](https://help.salesforce.com/s/articleView?id=000382564&type=1&language=en_US)
- [**What happens when I convert leads?**](https://help.salesforce.com/s/articleView?id=sf.faq_leads_what_happens_when.htm&type=5&language=en_US)
- [**Map Custom Lead Fields for Lead Conversion**](https://help.salesforce.com/s/articleView?id=sf.customize_mapleads.htm&type=5&language=en_US)

Knowledge Article Number

000388015

Did this article solve your issue?

Let us know so we can improve!

YesNo

Loading

Salesforce Help \| Article

![Salesforce](https://a.sfdcstatic.com/digital/one-trust/core/stable/consent/8e783e8c-0ad0-475d-8fca-4a03afa0a02a/019e3ba8-766d-7090-bf0d-c2f7beefa22d/logos/ddb906c9-f57b-40fc-85a1-c8bcbc371b0d/6a33a761-886e-4860-8e17-abc0832f7a62/corporate_logo_big.png)

## Cookie Consent Manager

## Cookie Consent Manager

- ### General Information

- ### Required Cookies

- ### Functional Cookies

- ### Advertising Cookies


#### General Information

We use three kinds of cookies on our websites: required, functional, and advertising. You can choose whether functional and advertising cookies apply. Click on the different cookie categories to find out more about each category and to change the default settings.


[Privacy Statement](https://www.salesforce.com/company/privacy/full_privacy/)

#### Required Cookies

Always Active

Required cookies are necessary for basic website functionality. Some examples include: session cookies needed to transmit the website, authentication cookies, and security cookies.

Cookies Details

#### Functional Cookies

Functional Cookies

Functional cookies enhance functions, performance, and services on the website. Some examples include: cookies used to analyze site traffic, cookies used for market research, and cookies used to display advertising that is not directed to a particular individual.

Cookies Details

#### Advertising Cookies

Advertising Cookies

Advertising cookies track activity across websites in order to understand a viewer’s interests, and direct them specific marketing. Some examples include: cookies used for remarketing, or interest-based advertising.

Cookies Details

Back Button

### Cookie List

Filter Button

ConsentLeg.Interest

checkbox labellabel

checkbox labellabel

checkbox labellabel

Clear

- checkbox labellabel


ApplyCancel

Save Settings

Accept All Cookies
