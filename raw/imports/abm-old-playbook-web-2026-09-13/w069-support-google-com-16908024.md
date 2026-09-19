---
type: "web-source-capture"
title: "Search generative AI control - Search Console Help"
url: "https://support.google.com/webmasters/answer/16908024"
resolved_url: "https://support.google.com/webmasters/answer/16908024"
captured_at: "2026-09-13T18:00:24.439900+00:00"
capture_method: "Firecrawl main-content Markdown; non-generative extraction"
capture_scope: "full-main-text"
source_id: "W069"
capture_receipt: "wiki/_outputs/abm-old-playbook-2026-09-13/web-ingest/receipts/w069.json"
selection_authority: "User-selected URLs from ABM old-playbook research, 2026-09-13; custody is not claim approval"
---

[Skip to main content](https://support.google.com/webmasters/answer/16908024#hcfe-content)

# Search generative AI control

**Note**: As of August 31, 2026, we’ve rolled out this control to all websites worldwide.

Use the Search generative AI control to manage your site's inclusion in the following generative AI features on Google Search. We expect to update this list over time as we develop Google Search.

- [AI Overviews](https://support.google.com/websearch/answer/14901683)
- [AI Mode](https://support.google.com/websearch/answer/16011537)
- Generative AI features in [Google Discover](https://support.google.com/websearch/answer/2819496?hl=en&co=GENIE.Platform%3DAndroid)

See and manage the Search generative AI control for your property under **Settings**![Settings](https://lh3.googleusercontent.com/oyYmLH7WiMYp3MZfUMAXaTyojw4lv4t9lNMat9eUz3wxsQTJ7hSD91gBKW10q-VaROs=h36) \> **Search generative AI** in Search Console.

[Open the Search generative AI control](https://search.google.com/search-console/settings/search-gen-ai)

## Change your control

To change your Search generative AI control choice, open the [Search generative AI control page](https://search.google.com/search-console/settings/search-gen-ai) and choose one of the following:

- **Include my site's links and content in Search generative AI features:** Your site's content can appear in [Search generative AI features](https://support.google.com/webmasters/answer/16908024#gen-ai-features), including showing up as links and helping to ground AI responses in these features. Your site can receive impressions and traffic from these features. This is the default control for all properties.
- **Exclude my site's links and content from Search generative AI features**: Your site's content is prevented from being visible to users in [Search generative AI features](https://support.google.com/webmasters/answer/16908024#gen-ai-features), including being linked to within these features and helping with grounding AI responses in these features. You won't receive any traffic or impressions from these features. Learn more about [what excluding your site means](https://support.google.com/webmasters/answer/16908024#exclusion).
- **Inherit control from parent**: Your property is following the Search generative AI control value of its parent property. Any changes made at the parent level will automatically apply to your property too. You can override this and [manually configure the control](https://support.google.com/webmasters/answer/16908024#configure-child) for your property at any time. This is the default if your property has a parent property.

To measure how your content is performing in Search generative AI features, use the [Generative AI performance report](https://support.google.com/webmasters/answer/16984139). This can help you get an idea of how changing your control may impact traffic to your site.

## What happens if I exclude my site?

If you exclude your site, links to your site and your site's content won't appear in [Search generative AI features](https://support.google.com/webmasters/answer/16908024#gen-ai-features). Content from other sites will still be available in those features, and it may appear similar to yours. Content crawled from your site won't be eligible to be used as an input to generate an AI response or preview in [Search generative AI features](https://support.google.com/webmasters/answer/16908024#gen-ai-features).

This control only affects whether your content can appear in certain Search generative AI features; this control isn't used as a ranking or inclusion signal affecting other parts of Search. This control doesn't override publishers' other choices to participate in particular services, such as Merchant Center and Google Ads. Your site's content may still be used to power Google Search as a whole, like helping our systems better understand the [language of users’ queries](https://blog.google/products-and-platforms/products/search/search-language-understanding-bert/) and the language on pages on the web. This control doesn't affect AI training; to limit training of the models used to generate responses in Search generative AI features, use [Google-Extended](https://developers.google.com/crawling/docs/crawlers-fetchers/google-common-crawlers#google-extended). To block your content from appearing in Google Search completely, use [noindex](https://developers.google.com/search/docs/crawling-indexing/block-indexing).

## How long it takes for a control change to take effect

Once you change your control in Search Console, it generally takes a few days for your site's content to be excluded from the [applicable Search generative AI features](https://support.google.com/webmasters/answer/16908024#gen-ai-features). Content will be excluded within 1-2 days after the control goes live, but some content may take longer to be excluded due to caching and propagation across Google systems.

## How Search generative AI control inheritance works

By default, a property inherits its Search generative AI control from its closest parent that has changed its control to stop inheriting. For a property in which none of its parents manually-configured their control to stop inheriting, the property is set to inherit the control of its top-level domain property.

For example, the child property ( [URL-prefix property](https://support.google.com/webmasters/answer/10432366)`https://example.com/business/cats`) would inherit the control of its parent (domain property `example.com`) by default, unless an owner of a closer parent property (`https://example.com/business/` or `https://example.com/`) [manually configured the control](https://support.google.com/webmasters/answer/16908024#configure-child) to stop inheriting. You can check whether your property is inheriting its control and [manually configure the control](https://support.google.com/webmasters/answer/16908024#configure-child) for your property at any time.

### About parent and child properties

**Note**: Many properties can be both a parent and a child of other properties.

- **Parent property**: A higher-level property that has child property nested below it. It may be a top-level domain (the highest-level domain for a single site on the web) property, a subdomain property, or a [URL-prefix property](https://support.google.com/webmasters/answer/10432366).




Examples of parent properties









Here are some examples of a **top-level domain**:



  - `example.com`
  - `example.co.uk`

Here are some examples of a **subdomain property**:

  - `blog.example.com`

Here are some examples of a **URL-prefix property**:

  - `https://m.example.com/petstore/`
  - `https://example.com/`
  - `http://www.example.com/cats/`

- **Child property**: A lower-level, URL-prefix path property, or a domain property which is not the top-level, that's nested under another property. It may be nested under a top-level domain property or another property.

![](https://lh3.googleusercontent.com/SDQxBGPSDA2ggu-qr57nDcINa-_wlsSU9OZ1wM-NJLG7eAHnNJjrpVRASxrGOWEHfYY=w895)

1. The top-level domain `example.com` is a parent property of all properties below it. Both **2) `https://example.com`** and **3) `https://example.com/blog`** ``are child properties of `example.com`, and therefore inherit `example.com`'s setting by default, if there was no manually configured setting.
2. The URL-prefix property `https://example.com` is a parent property of the property below it. If `https://example.com` has a setting configured, then 3) `https://example.com/blog` inherits that setting by default, as that property is its closest parent property with a configured setting.

### Examples of parent and child properties

Here are some examples that show how the parent and child relationship works in terms of Search Console properties:

| **Parent property** | **Examples of child properties** | **Not a child property** |
| --- | --- | --- |
| example.com<br>(top-level domain) | `✅ https://example.com/business/`<br>`✅ http://example.com/`<br>`✅ blog.example.com`<br>`✅ https://www.blog.example.com/path` | ❌ example.co.uk |
| https://www.example.com/<br>(URL-prefix property) | `✅ https://www.example.com/business/`<br>`✅ https://www.example.com/cats/kittens/` | ❌ example.com<br>❌ http://www.example.com/<br>❌ https://example.com/ |
| https://example.com/business/ <br>(URL-prefix property) | `✅ https://example.com/business/cats/`<br>`✅ https://example.com/business/dogs/`<br>`✅ https://example.com/business/cats/kittens` | ❌ https://example.com/<br>❌ http://example.com/business/cats/<br>❌ https://www.example.com/business/cats/ |
| http://example.com/<br>(URL-prefix property) | `✅ http://example.com/cat/`<br>`✅ http://example.com/cat/kittens` | ❌ https://example.com/<br>❌ http://www.example.com/cat |
| blog.example.com<br>(domain property) | `✅ m.blog.example.com`<br>`✅ https://www.blog.example.com`<br>`✅ http://blog.example.com`<br>`✅ https://m.blog.example.com`<br>`✅ https://blog.example.com/path` | ❌ example.com<br>❌ https://example.com/<br>❌ bl.example.com |

### Manually configure the Search generative AI control for a child property

Owners of a child property can choose to follow its parent property's Search generative AI control or change it for the specific child property and its subpages. To specify a control for a given child property, log in to that property in Search Console and update its configuration using the Search generative AI control page.

## Submitting feedback

You can [submit feedback on the Search generative AI control](https://docs.google.com/forms/d/e/1FAIpQLScKKRDQnnGxDoyWkargi1ibrgh5Jw7p1FS0f2xLiboJJSEoLA/viewform?usp=preview). Note that this feedback helps improve Search Console overall, and we generally can't act upon individual submissions.

If you have feedback about other Search Console features, use the feedback link within Search Console. If you have questions about how your site appears in Search, visit the [Search Central help community](http://goo.gle/sc-forum) to discuss with peers.

Give feedback about this article

Choose a section to give feedback on

## Was this helpful?

How can we improve it?

YesNo

Submit

## Need more help?

### Try these next steps:

[Post to the help community  Get answers from community members](https://support.google.com/webmasters/community?hl=en&help_center_link=CPj9hwgSHFNlYXJjaCBnZW5lcmF0aXZlIEFJIGNvbnRyb2w)

true

[![](https://lh3.googleusercontent.com/iyJZOYB-OnYWs0GqA-QFmBPpjL0PJMB-XyfpVu95XL4xqzCh5XU7ZQdUMWAzmHvaIqI=w512)](https://support.google.com/webmasters/answer/9128669?hl=en&ref_topic=9128571)

[New to Search Console?](https://support.google.com/webmasters/answer/9128669?hl=en&ref_topic=9128571)

Never used Search Console before? Start here, whether you're a complete beginner, an SEO expert, or a website developer.

10581450415144412871

true

Search Help Center

false

true

true

true

[Google Help](https://support.google.com/)

[Help Center](https://support.google.com/webmasters/?hl=en) [Community](https://support.google.com/webmasters/community?hl=en&help_center_link=CPj9hwgSHFNlYXJjaCBnZW5lcmF0aXZlIEFJIGNvbnRyb2w) [Search Console](https://search.google.com/search-console)

[Privacy Policy](https://www.google.com/intl/en/privacy.html) [Terms of Service](https://www.google.com/accounts/TOS)Submit feedback

true

true

83844

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

By continuing, you agree Google uses your answers, [account & system info](https://support.google.com/webmasters/answer/16908024#) to improve services, per our [Privacy](https://myaccount.google.com/privacypolicy?hl=en) & [Terms](https://policies.google.com/terms?hl=en).

false

false

false

Search

Clear search

Close search

Main menu

Google apps
