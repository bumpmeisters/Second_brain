---
type: "web-source-capture"
title: "Get started with attribution - Analytics Help"
url: "https://support.google.com/analytics/answer/10596866"
resolved_url: "https://support.google.com/analytics/answer/10596866"
captured_at: "2026-09-13T17:59:44.258412+00:00"
capture_method: "Firecrawl main-content Markdown; non-generative extraction"
capture_scope: "full-main-text"
source_id: "W064"
capture_receipt: "wiki/_outputs/abm-old-playbook-2026-09-13/web-ingest/receipts/w064.json"
selection_authority: "User-selected URLs from ABM old-playbook research, 2026-09-13; custody is not claim approval"
---

[Skip to main content](https://support.google.com/analytics/answer/10596866#hcfe-content)

## Advertising and attribution

# Get started with attribution

Analyze how your ads drive users to perform meaningful actions on your website or app

[Previous: [GA4] Missing Google Analytics 4 data in Google Ads](https://support.google.com/analytics/answer/13684192?hl=en&ref_topic=10595744)[Next: All channels performance report](https://support.google.com/analytics/answer/12198930?hl=en&ref_topic=10595744)

## Overview

Customers may do several searches and click several of your ads before making a purchase or completing another important action on your website or app. Typically, all credit for the important action, called a [key event](https://support.google.com/analytics/answer/9355848?), is given to the last ad customers clicked. But was it solely that ad that made them decide to interact with a key event on the path to a key event? What about the other ads they clicked on before it?

Attribution is the act of assigning credit for important user actions to different ads, clicks, and factors along the user's path to completing the action.

An attribution model can be a rule, a set of rules, or a data-driven algorithm that determines how credit is assigned to [touchpoints](https://support.google.com/analytics/answer/14709948) along a user's path to completing important actions.

There are 3 attribution models available in the Attribution reports in Google Analytics properties:

- Data-driven attribution
- Paid and organic last click
- Google paid channels last click

**Note**: All attribution models exclude direct visits from receiving attribution credit, unless the path to key event consists entirely of direct visits.

## ![Google Ads logo](https://lh3.googleusercontent.com/J4M28Bq9qeG73_UOp6cyyXkmuVRpsyFWwn1KMoz1dY0lZhDFl1_RKbZARpgY4_WAYA8=w80-h80) Reach your marketing goals

Put your insights from Google Analytics to work with Google Ads to help get your business in front of the right customers across Search, YouTube, and more.

[Get started](https://ads.google.com/signup?subid=ww-ww-xs-ip-GA_helpcenter_10596866!o2)

## Access the Attribution reports

To access the Attribution reports:

1. In Google Analytics, click **Advertising** on the left.
2. Under _Attribution_, click **Attribution models** or **Attribution paths**.

## Data-driven attribution

**Data-driven**: Data-driven attribution distributes credit for the key event based on data for each key event. It's different from the other models because it uses your account's data to calculate the actual contribution of each click interaction.

![Data-driven model icon](https://lh3.googleusercontent.com/XB0uIdySmY1njJdD5Fq7reMBbkme4oMujx-VXcntFwdCC2bACtrGiY6dBuiN91RLg4o=w48) Each **Data-driven** model is specific to each advertiser and each key event.

### How data-driven attribution works

Attribution uses machine learning algorithms to evaluate both converting and non-converting paths. The resulting _Data-driven_ model learns how different touchpoints impact key event outcomes. The model incorporates factors such as time from key event, device type, number of ad interactions, the order of ad exposure, and the type of creative assets. Using a counterfactual approach, the model contrasts what happened with what _could have occurred_ to determine which touchpoints are most likely to drive key events. The model attributes credit to these touchpoints based on this likelihood.

**Notes**:

- Depending on data availability, data-driven attribution models may leverage aggregate data from [Data sharing settings](https://support.google.com/analytics/answer/1011397).
- Conversions can be reattributed for up to 7 days after the conversion.

### The methodology behind data-driven attribution (advanced)

There are 2 main parts to the data-driven attribution methodology:

- Analyzing the available path data to develop key event rate models for each of your key events
- Using the key event rate model predictions as input to an algorithm that attributes credit to ad interactions

#### **Develop key event probability models from available path data**

Data-driven attribution uses path data, including data from both converting and non-converting users, to understand how the presence and timing of particular marketing touchpoints may impact your users’ probability of key events. The resulting models assess how likely a user is to interact with a key event on the path to a key event at any particular point in the path, given exposure to a particular ad interaction.

The models compare the key event probability of users who were exposed to the ad, to the key event probability of similar users in a holdback group. (In more technical terms, the models compute the counterfactual gains of Google ad exposures by training on data from randomized controlled trials.)

#### **Algorithmically assign fractional credit to marketing touchpoints**

The data-driven attribution model assigns credit based on how the addition of each ad interaction to the path changes the estimated key event probability. The data-driven attribution algorithm uses features including time between the ad interaction and the key event, format type, and other query signals to calculate this credit.

**Example**

In the following high-level illustration, the combination of Ad Exposure #1 (Paid search), Ad Exposure #2 (Social), Ad Exposure #3 (Affiliate), and Ad Exposure #4 (Search) leads to a 3% probability of key event. When Ad Exposure #4 doesn't occur, the probability drops to 2%, so we know that Ad Exposure #4 drives +50% key event probability. We repeat this for each ad interaction and use the learned contributions as attribution weights.

![](https://lh3.googleusercontent.com/lebrcHjXjYmir0upFE6Gs69-wOllE7N9UaGYXvU01Rm_RThJW0Hs83CIbmJaMPqWKeS3=w589)

## Paid and organic last click

**Note**: The first click, linear, time decay, and position-based attribution models are no longer available as of November 2023. Learn more [About the deprecated models](https://support.google.com/google-ads/answer/13427716).

![Last interaction model icon](https://lh3.googleusercontent.com/-USKjk6oD8OY7P3UowRQsY7umTlhvOose1fsecdnedDri9Lsd7cLUry1HB3GqrGp64M=w48)**Paid and organic last click**: Ignores direct traffic and attributes 100% of the key event value to the last channel that the customer clicked through (or engaged view through for YouTube) before converting. See examples below of how key event value is allocated:

**Examples**

1. Display > Social > Paid Search > Organic Search → 100% to Organic Search
2. Display > Social > Paid Search > Email → 100% to Email
3. Display > Social > Paid Search > Direct → 100% to Paid Search
4. Direct → 100% Direct traffic

**Note**:

- **Paid and organic last click** and **Last non-direct click** are two names for the same attribution model.

An engaged view is counted in data-driven attribution when a user:

- Watches an ad for 30 seconds (or until the end if it is less than 30 seconds)
- Clicks on a teaser card
- Clicks a companion banner or video wall
- Clicks on a phrase that is a call to action
- Clicks on the end screen
- Clicks to visit the advertiser’s website

## Google paid channels last click

![Last interaction model icon](https://lh3.googleusercontent.com/-USKjk6oD8OY7P3UowRQsY7umTlhvOose1fsecdnedDri9Lsd7cLUry1HB3GqrGp64M=w48)**Google paid channels last click**: Attributes 100% of the key event value to the last Google Ads channel that the customer clicked through before converting. If there is no Google Ads click in the path, as in Example 6, the attribution model falls back to Paid and organic last click.

**Examples**

5. Display > Social > Paid Search > Organic Search → 100% to Paid Search
6. Display > Social > YouTube EVC > Email → 100% to YouTube
7. Display > Social > Email > Direct → 100% to Email (fallback to last non-direct click)
8. Direct → 100% Direct traffic

## Select attribution settings

The Attribution settings page lets you choose how key event reports in Google Analytics assign credit to different ads, clicks, and other factors before users trigger key events. Google Analytics provides a streamlined process for managing cross-channel conversions. Key events in Google Analytics are the primary source for creating conversions that can be shared with Google Ads.

To select key event attribution settings:

1. Sign in to [Google Analytics](http://analytics.google.com/).
2. In **[Admin](https://analytics.google.com/analytics/web/#/?pagename=admin&utm_source=gahc&utm_medium=dlinks)**, under _Data display_, click **Events**.



**Note**: The previous link opens to the last Google Analytics property you accessed. You must be signed in to a Google Account to open the property. You can [change the property](https://support.google.com/analytics/answer/12813202) using the property selector.


    You must be a [Marketer or above](https://support.google.com/analytics/answer/9305587) at the property level to select the attribution settings.

3. Click **Attribution settings**.
4. Review these attribution settings:
   - [Reporting attribution model](https://support.google.com/analytics/answer/10597962#reporting-attribution-model)
   - [Channels that can receive credit](https://support.google.com/analytics/answer/10597962#channels-receive-credit)
   - [Key event lookback window](https://support.google.com/analytics/answer/10597962#window)
5. Click **Save**.

Give feedback about this article

Choose a section to give feedback on

[Previous: [GA4] Missing Google Analytics 4 data in Google Ads](https://support.google.com/analytics/answer/13684192?hl=en&ref_topic=10595744)[Next: All channels performance report](https://support.google.com/analytics/answer/12198930?hl=en&ref_topic=10595744)

## Was this helpful?

How can we improve it?

Submit

## Need more help?

### Try these next steps:

[Post to the help community  Get answers from community members](https://support.google.com/analytics/community?hl=en&help_center_link=CILkhgUSHEdldCBzdGFydGVkIHdpdGggYXR0cmlidXRpb24) [Contact usTell us more and we’ll help you get there](https://support.google.com/analytics/gethelp)

false

3781663056541738465

true

Search Help Center

false

true

true

true

[Google Help](https://support.google.com/)

[Help Center](https://support.google.com/analytics/?hl=en)

[Get started with Analytics](https://support.google.com/analytics/topic/14090456?hl=en&ref_topic=3544742,2986333,) [Collect and manage data](https://support.google.com/analytics/topic/14132937?hl=en&ref_topic=3544742,2986333,) [Report and explore](https://support.google.com/analytics/topic/9228654?hl=en&ref_topic=3544742,2986333,) [Advertising and attribution](https://support.google.com/analytics/topic/10595744?hl=en&ref_topic=3544742,2986333,) [Audiences and remarketing](https://support.google.com/analytics/topic/9303474?hl=en&ref_topic=3544742,2986333,) [Manage accounts, properties, and users](https://support.google.com/analytics/topic/9303569?hl=en&ref_topic=3544742,2986333,) [Google Analytics 360](https://support.google.com/analytics/topic/10985992?hl=en&ref_topic=3544742,2986333,) [Policies and data privacy](https://support.google.com/analytics/topic/1008008?hl=en&ref_topic=3544742,2986333,)

[Community](https://support.google.com/analytics/community?hl=en&help_center_link=CILkhgUSHEdldCBzdGFydGVkIHdpdGggYXR0cmlidXRpb24) [Analytics](https://www.google.com/analytics/)

[Privacy Policy](https://www.google.com/intl/en/privacy.html) [Terms of Service](https://www.google.com/accounts/TOS)Submit feedback

[Introduction to Analytics](https://support.google.com/analytics/topic/14089939?hl=en&ref_topic=14090456,3544742,2986333,) [Set up Analytics](https://support.google.com/analytics/topic/14088998?hl=en&ref_topic=14090456,3544742,2986333,) [Guides and videos](https://support.google.com/analytics/topic/14089317?hl=en&ref_topic=14090456,3544742,2986333,) [Troubleshoot](https://support.google.com/analytics/topic/13614110?hl=en&ref_topic=14090456,3544742,2986333,) [Glossary](https://support.google.com/analytics/topic/9355633?hl=en&ref_topic=14090456,3544742,2986333,)

[Events and key events](https://support.google.com/analytics/topic/14710097?hl=en&ref_topic=14132937,3544742,2986333,) [Import data from external systems](https://support.google.com/analytics/topic/10054560?hl=en&ref_topic=14132937,3544742,2986333,) [Integrations](https://support.google.com/analytics/topic/9306488?hl=en&ref_topic=14132937,3544742,2986333,) [Measure ecommerce](https://support.google.com/analytics/topic/12270146?hl=en&ref_topic=14132937,3544742,2986333,) [Measure lead generation](https://support.google.com/analytics/topic/12943241?hl=en&ref_topic=14132937,3544742,2986333,) [First-party data](https://support.google.com/analytics/topic/14272008?hl=en&ref_topic=14132937,3544742,2986333,) [Troubleshoot data issues](https://support.google.com/analytics/topic/16714023?hl=en&ref_topic=14132937,3544742,2986333,)

[Reports](https://support.google.com/analytics/topic/13818299?hl=en&ref_topic=9228654,3544742,2986333,) [Explorations](https://support.google.com/analytics/topic/9266525?hl=en&ref_topic=9228654,3544742,2986333,) [Dimensions and metrics](https://support.google.com/analytics/topic/11151952?hl=en&ref_topic=9228654,3544742,2986333,) [Analytics Intelligence](https://support.google.com/analytics/topic/10333392?hl=en&ref_topic=9228654,3544742,2986333,) [The Analytics app](https://support.google.com/analytics/topic/12677004?hl=en&ref_topic=9228654,3544742,2986333,) [How data is stored and displayed](https://support.google.com/analytics/topic/13987797?hl=en&ref_topic=9228654,3544742,2986333,)

[Understand advertising](https://support.google.com/analytics/topic/10604827?hl=en&ref_topic=10595744,3544742,2986333,) [Understand attribution](https://support.google.com/analytics/topic/10597959?hl=en&ref_topic=10595744,3544742,2986333,) [Manage and configure attribution](https://support.google.com/analytics/topic/10595462?hl=en&ref_topic=10595744,3544742,2986333,) [iOS conversion measurement](https://support.google.com/analytics/topic/13165701?hl=en&ref_topic=10595744,3544742,2986333,)

[Set up audiences](https://support.google.com/analytics/topic/14272803?hl=en&ref_topic=9303474,3544742,2986333,) [Use audiences for advertising and remarketing](https://support.google.com/analytics/topic/14277381?hl=en&ref_topic=9303474,3544742,2986333,) [Audiences for common marketing objectives](https://support.google.com/analytics/topic/13286687?hl=en&ref_topic=9303474,3544742,2986333,) [Troubleshoot audiences](https://support.google.com/analytics/topic/14277483?hl=en&ref_topic=9303474,3544742,2986333,)

[\[GA4\] Subproperties](https://support.google.com/analytics/topic/11525653?hl=en&ref_topic=9303569,3544742,2986333,) [Roll-up properties](https://support.google.com/analytics/topic/11525654?hl=en&ref_topic=9303569,3544742,2986333,)

[\[GA4\] Subproperties](https://support.google.com/analytics/topic/11525653?hl=en&ref_topic=10985992,3544742,2986333,) [Roll-up properties](https://support.google.com/analytics/topic/11525654?hl=en&ref_topic=10985992,3544742,2986333,) [How data is stored and displayed](https://support.google.com/analytics/topic/13987797?hl=en&ref_topic=10985992,3544742,2986333,)

[Data privacy and security](https://support.google.com/analytics/topic/2919631?hl=en&ref_topic=1008008,3544742,2986333,)

true

true

69256

false

false

## What is the issue with this selection?

What is the issue with this selection?

Inaccurate - doesn't match what I see in the product

Hard to understand - unclear or translation is wrong

Missing info - relevant but not comprehensive

Irrelevant - doesn’t match the title and / or my expectations

Minor errors - formatting issues, typos, and / or broken links

Other suggestions - ideas to improve the content

## Share additional info or suggestions

​

​

Do not share any personal info

Cancel

Submit

By continuing, you agree Google uses your answers, [account & system info](https://support.google.com/analytics/answer/10596866#) to improve services, per our [Privacy](https://myaccount.google.com/privacypolicy?hl=en) & [Terms](https://policies.google.com/terms?hl=en).

false

false

false

Search

Clear search

Close search

Main menu

Google apps
