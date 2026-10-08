---
type: "web-source-capture"
title: "Organization Schema Markup | Google Search Central  |  Documentation  |  Google for Developers"
url: "https://developers.google.com/search/docs/appearance/structured-data/organization"
resolved_url: "https://developers.google.com/search/docs/appearance/structured-data/organization"
captured_at: "2026-09-13T17:56:52.729898+00:00"
capture_method: "Firecrawl main-content Markdown; non-generative extraction"
capture_scope: "full-main-text"
source_id: "W020"
capture_receipt: "wiki/_outputs/abm-old-playbook-2026-09-13/web-ingest/receipts/w020.json"
selection_authority: "User-selected URLs from ABM old-playbook research, 2026-09-13; custody is not claim approval"
---

[Skip to main content](https://developers.google.com/search/docs/appearance/structured-data/organization#main-content)

[![Google Search Central](https://developers.google.com/static/search/images/google-search-central-logo.svg)](https://developers.google.com/search)

- [GoogleSearch Central](https://developers.google.com/search)

`/`

Language

- [English](https://developers.google.com/search/docs/appearance/structured-data/organization)
- [Deutsch](https://developers.google.com/search/docs/appearance/structured-data/organization?hl=de)
- [Español](https://developers.google.com/search/docs/appearance/structured-data/organization?hl=es)
- [Español – América Latina](https://developers.google.com/search/docs/appearance/structured-data/organization?hl=es-419)
- [Français](https://developers.google.com/search/docs/appearance/structured-data/organization?hl=fr)
- [Indonesia](https://developers.google.com/search/docs/appearance/structured-data/organization?hl=id)
- [Italiano](https://developers.google.com/search/docs/appearance/structured-data/organization?hl=it)
- [Polski](https://developers.google.com/search/docs/appearance/structured-data/organization?hl=pl)
- [Português – Brasil](https://developers.google.com/search/docs/appearance/structured-data/organization?hl=pt-br)
- [Tiếng Việt](https://developers.google.com/search/docs/appearance/structured-data/organization?hl=vi)
- [Türkçe](https://developers.google.com/search/docs/appearance/structured-data/organization?hl=tr)
- [Русский](https://developers.google.com/search/docs/appearance/structured-data/organization?hl=ru)
- [العربيّة](https://developers.google.com/search/docs/appearance/structured-data/organization?hl=ar)
- [हिंदी](https://developers.google.com/search/docs/appearance/structured-data/organization?hl=hi)
- [ภาษาไทย](https://developers.google.com/search/docs/appearance/structured-data/organization?hl=th)
- [中文 – 简体](https://developers.google.com/search/docs/appearance/structured-data/organization?hl=zh-cn)
- [中文 – 繁體](https://developers.google.com/search/docs/appearance/structured-data/organization?hl=zh-tw)
- [日本語](https://developers.google.com/search/docs/appearance/structured-data/organization?hl=ja)
- [한국어](https://developers.google.com/search/docs/appearance/structured-data/organization?hl=ko)

[Sign in](https://developers.google.com/_d/signin?continue=https%3A%2F%2Fdevelopers.google.com%2Fsearch%2Fdocs%2Fappearance%2Fstructured-data%2Forganization&prompt=select_account)

- [Documentation](https://developers.google.com/search/docs)

[Search Console](https://goo.gle/searchconsole)

- On this page
- [How to add structured data](https://developers.google.com/search/docs/appearance/structured-data/organization#add-structured-data)
- [Examples](https://developers.google.com/search/docs/appearance/structured-data/organization#examples)
  - [Organization](https://developers.google.com/search/docs/appearance/structured-data/organization#example-organization)
  - [OnlineStore (subtype of Organization) with a shipping policy and return policy](https://developers.google.com/search/docs/appearance/structured-data/organization#example-online-store)
- [Guidelines](https://developers.google.com/search/docs/appearance/structured-data/organization#guidelines)
  - [Technical guidelines](https://developers.google.com/search/docs/appearance/structured-data/organization#technical-guidelines)
- [Structured data type definitions](https://developers.google.com/search/docs/appearance/structured-data/organization#structured-data-type-definitions)
- [Troubleshooting](https://developers.google.com/search/docs/appearance/structured-data/organization#troubleshooting)

- [Home](https://developers.google.com/)
- [Search Central](https://developers.google.com/search)
- [Documentation](https://developers.google.com/search/docs)



 Send feedback



- On this page
- [How to add structured data](https://developers.google.com/search/docs/appearance/structured-data/organization#add-structured-data)
- [Examples](https://developers.google.com/search/docs/appearance/structured-data/organization#examples)
  - [Organization](https://developers.google.com/search/docs/appearance/structured-data/organization#example-organization)
  - [OnlineStore (subtype of Organization) with a shipping policy and return policy](https://developers.google.com/search/docs/appearance/structured-data/organization#example-online-store)
- [Guidelines](https://developers.google.com/search/docs/appearance/structured-data/organization#guidelines)
  - [Technical guidelines](https://developers.google.com/search/docs/appearance/structured-data/organization#technical-guidelines)
- [Structured data type definitions](https://developers.google.com/search/docs/appearance/structured-data/organization#structured-data-type-definitions)
- [Troubleshooting](https://developers.google.com/search/docs/appearance/structured-data/organization#troubleshooting)

# Organization (`Organization`) structured data

![Merchant knowledge panel in Google Search results](https://developers.google.com/static/search/docs/images/organization.png)Merchant knowledge panel in Google Search results

Adding organization structured data to your home page can help Google better understand your
organization's administrative details and disambiguate your organization in search results. Some
properties are used behind the scenes to disambiguate your organization from other organizations
(like `iso6523` and `naics`), while others can influence visual elements in
Search results (such as which `logo` is shown in Search results and your
[knowledge panel](https://support.google.com/knowledgepanel/answer/9163198)).
If you're a merchant, you can influence more details in your
[merchant knowledge panel](https://blog.google/products/shopping/google-merchant-new-features-holiday/)
and [brand profile](https://support.google.com/merchants/answer/14998338),
such as return policy, address, and contact information. There are no required properties;
instead, we recommend adding as many properties that are relevant to your organization.

## How to add structured data

Structured data is a standardized format for providing information about a page and classifying the page
content. If you're new to structured data, you can learn more about
[how structured data works](https://developers.google.com/search/docs/appearance/structured-data/intro-structured-data).


Here's an overview of how to build, test, and release structured data.

1. Add as many [recommended properties](https://developers.google.com/search/docs/appearance/structured-data/organization#structured-data-type-definitions) that apply
    to your web page. There are no required properties; instead, add the properties that apply to
    your content. Based on the format you're using, learn where to
    [insert structured data on the page](https://developers.google.com/search/docs/appearance/structured-data/intro-structured-data#format-placement).


2. Follow the [guidelines](https://developers.google.com/search/docs/appearance/structured-data/organization#guidelines).
3. Validate your code using the
    [Rich Results Test](https://search.google.com/test/rich-results)
    and fix any critical errors. Consider also fixing any non-critical issues that may be flagged
    in the tool, as they can help improve the quality of your structured data (however, this isn't necessary to be eligible for rich results).
4. Deploy a few pages that include your structured data and use the [URL Inspection tool](https://support.google.com/webmasters/answer/9012289) to test how Google sees the page. Be sure that your page is
    accessible to Google and not blocked by a robots.txt file, the `noindex` tag, or
    login requirements. If the page looks okay, you can
    [ask Google to recrawl your URLs](https://developers.google.com/search/docs/crawling-indexing/ask-google-to-recrawl).


5. To keep Google informed of future changes, we recommend that you
    [submit a sitemap](https://developers.google.com/search/docs/crawling-indexing/sitemaps/build-sitemap). You can automate this with the
    [Search Console Sitemap API](https://developers.google.com/webmaster-tools/v1/sitemaps).

## Examples

### `Organization`

Here's an example of organization information in JSON-LD code.

```
<html>
  <head>
    <title>About Us</title>
    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "Organization",
      "url": "https://www.example.com",
      "sameAs": ["https://example.net/profile/example1234", "https://example.org/example1234"],
      "logo": "https://www.example.com/images/logo.png",
      "name": "Example Corporation",
      "description": "The example corporation is well-known for producing high-quality widgets",
      "email": "contact@example.com",
      "telephone": "+47-99-999-9999",
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "Rue Improbable 99",
        "addressLocality": "Paris",
        "addressCountry": "FR",
        "addressRegion": "Ile-de-France",
        "postalCode": "75001"
      },
      "vatID": "FR12345678901",
      "iso6523Code": "0199:724500PMK2A2M1SQQ228"
    }
    </script>
  </head>
  <body>
  </body>
</html>
```

### `OnlineStore` (subtype of `Organization`) with a shipping policy and return policy

Here's an example of an online store with both a shipping policy and a return policy in JSON-LD code.

Refer to the separate [Merchant return policy markup](https://developers.google.com/search/docs/appearance/structured-data/return-policy) documentation for more examples and detailed information for merchant-level standard return policies.

```
<html>
  <head>
    <title>About Us</title>
    <script type="application/ld+json">
      {
        "@context": "https://schema.org",
        "@type": "OnlineStore",
        "name": "Example Online Store",
        "url": "https://www.example.com",
        "sameAs": [\
          "https://example.net/profile/example12",\
          "https://example.org/@example34"\
        ],
        "logo": "https://www.example.com/assets/images/logo.png",
        "contactPoint": {
          "contactType": "Customer Service",
          "email": "support@example.com",
          "telephone": "+47-99-999-9900"
        },
        "vatID": "FR12345678901",
        "iso6523Code": "0199:724500PMK2A2M1SQQ228",
        "hasShippingService": [\
          {\
            "@type": "ShippingService",\
            "name": "shipping to CH and FR",\
            "description": "Shipping to CH 5% of order value, shipping to FR always free",\
            "fulfillmentType": "FulfillmentTypeDelivery",\
            "shippingConditions": [\
              {\
                "@type": "ShippingConditions",\
                "shippingOrigin": {\
                  "@type": "DefinedRegion",\
                  "addressCountry": "FR"\
                },\
                "shippingDestination": {\
                  "@type": "DefinedRegion",\
                  "addressCountry": "CH"\
                },\
                "shippingRate": {\
                  "@type": "ShippingRateSettings",\
                  "orderPercentage": "0.05"\
                }\
              },\
              {\
                "@type": "ShippingConditions",\
                "shippingOrigin": {\
                  "@type": "DefinedRegion",\
                  "addressCountry": "FR"\
                },\
                "shippingDestination": {\
                  "@type": "DefinedRegion",\
                  "addressCountry": "FR"\
                },\
                "shippingRate": {\
                  "@type": "MonetaryAmount",\
                  "value": "0",\
                  "currency": "EUR"\
                }\
              }\
            ]\
          }\
        ],
        "hasMerchantReturnPolicy": {
          "@type": "MerchantReturnPolicy",
          "applicableCountry": [\
            "FR",\
            "CH"\
          ],
          "returnPolicyCountry": "FR",
          "returnPolicyCategory": "https://schema.org/MerchantReturnFiniteReturnWindow",
          "merchantReturnDays": 60,
          "returnMethod": "https://schema.org/ReturnByMail",
          "returnFees": "https://schema.org/FreeReturn",
          "refundType": "https://schema.org/FullRefund"
        }
        // Other Organization-level properties
        // ...
      }
    </script>
  </head>
  <body>
  </body>
</html>
```

## Guidelines

You must follow these guidelines to enable structured data to be eligible for inclusion in Google
Search results.

- [Technical guidelines](https://developers.google.com/search/docs/appearance/structured-data/organization#technical-guidelines)
- [Search Essentials](https://developers.google.com/search/docs/essentials)
- [General structured data guidelines](https://developers.google.com/search/docs/appearance/structured-data/sd-policies)

### Technical guidelines

We recommend placing this information on your home page, or a single page that describes your
organization, for example the _about us_ page. You don't need to include it on every
page of your site.

We recommend using the most specific schema.org subtype of [`Organization`](https://schema.org/Organization)
that matches your organization. For example, if you have an ecommerce site, then we recommend using the
[`OnlineStore`](https://schema.org/OnlineStore) subtype instead of
[`OnlineBusiness`](https://schema.org/OnlineBusiness).
And if your site is about a local business, for example a restaurant or a physical store, then we
recommend providing your administrative details using the most specific
[subtype(s)](https://developers.google.com/search/docs/appearance/structured-data/local-business#local-business-properties) of [`LocalBusiness`](https://schema.org/LocalBusiness)
and following the required and recommended fields for [Local business](https://developers.google.com/search/docs/appearance/structured-data/local-business)
in addition to the fields recommended in this guide.

## Structured data type definitions

Google recognizes the following properties of an
[`Organization`](https://schema.org/Organization).
To help Google better understand your page, include as many recommended properties that apply
to your web page. There are no required properties; instead, add the properties that apply to
your organization.

| Recommended properties |
| --- |
| `address` | `PostalAddress`<br>The address (physical or mailing) of your organization, if applicable. Include all properties that apply to your country. The more<br>properties you provide, the higher quality the result is for users.<br>You can provide multiple addresses if you have a location in multiple cities, states, or countries.<br>For example:<br>```<br>"address": [{<br>  "@type": "PostalAddress",<br>  "streetAddress": "999 W Example St Suite 99 Unit 9",<br>  "addressLocality": "New York",<br>  "addressRegion": "NY",<br>  "postalCode": "10019",<br>  "addressCountry": "US"<br>},{<br>  "streetAddress": "999 Rue due exemple",<br>  "addressLocality": "Paris",<br>  "postalCode": "75001",<br>  "addressCountry": "FR"<br>}]<br>``` |
| `address.addressCountry` | `Text`<br>The country for your postal address, using the two-letter [ISO 3166-1 alpha-2 country code.](https://wikipedia.org/wiki/ISO_3166-1) |
| `address.addressLocality` | `Text`<br>The city of your postal address. |
| `address.addressRegion` | `Text`<br>The region of your postal address, if applicable. For example, a state. |
| `address.postalCode` | `Text`<br>The postal code for your address. |
| `address.streetAddress` | `Text`<br>The full street address of your postal address. |
| `alternateName` | `Text`<br>Another common name that your organization goes by, if applicable. |
| `contactPoint` | `ContactPoint`<br>The best way for a user to contact your business, if applicable. Include all support methods available to your users<br>following Google recommended [best practices](https://developers.google.com/search/blog/2021/07/customer-support). For example:<br>```<br>"contactPoint": {<br>  "@type": "ContactPoint",<br>  "telephone": "+9-999-999-9999",<br>  "email": "contact@example.com"<br>}<br>``` |
| `contactPoint.email` | `Text`<br>The email address to contact your business, if applicable.<br>If you are using a `LocalBusiness` type, specify a primary email address at<br>the `LocalBusiness` level before using `contactPoint` to specify<br>multiple ways to reach your organization. |
| `contactPoint.telephone` | `Text`<br>The phone number to contact your business, if applicable.<br>Be sure to include the country code and area code in the phone number.<br>If you are using a `LocalBusiness` type, specify a primary phone number at<br>the `LocalBusiness` level before using `contactPoint` to specify<br>multiple ways to reach your organization. |
| `description` | `Text`<br>A detailed description of your organization, if applicable. |
| `duns` | `Text`<br>The Dun & Bradstreet DUNS number for identifying your `Organization`, if<br>applicable. We encourage using the `iso6523Code` field with prefix `0060:`<br>instead. |
| `email` | `Text`<br>The email address to contact your business, if applicable. |
| `foundingDate` | `Date`<br>The date your `Organization` was founded in [ISO 8601 date format](https://en.wikipedia.org/wiki/ISO_8601), if applicable. |
| `globalLocationNumber` | `Text`<br>The GS1 Global Location Number identifying the location of your `Organization`,<br>if applicable. |
| `hasMerchantReturnPolicy` | Repeated `MerchantReturnPolicy`<br>The return policy of your `Organization`, if applicable. See<br>[Merchant return policy markup](https://developers.google.com/search/docs/appearance/structured-data/return-policy#merchant-return-policy-properties)<br>for detailed information on required and optional properties for `MerchantReturnPolicy`. |
| `hasMemberProgram` | Repeated `MemberProgram`<br>A member (loyalty) program that you provide, if applicable.<br>See [Member program markup](https://developers.google.com/search/docs/appearance/structured-data/loyalty-program#member-program-properties) for detailed information on required and optional properties for `MemberProgram`. |
| `hasShippingService` | Repeated `ShippingService`<br>The shipping policy of your `Organization`, if applicable. See<br>[Merchant shipping policy markup](https://developers.google.com/search/docs/appearance/structured-data/shipping-policy#merchant-shipping-policy-properties)<br>for detailed information on required and optional properties for `ShippingService`. |
| `iso6523Code` | `Text`<br>The ISO 6523 identifier of your organization, if applicable.<br>The first part of an ISO 6523 identifier is an [`ICD` (International Code Designator)](http://iso6523.info/icd_list.pdf)<br>which defines which identification scheme is used.<br>The second part is the actual identifier. We recommend separating the ICD and the<br>identifier with a colon character (`U+003A`). Common ICD values include:<br>- `0060`: Dun & Bradstreet Data Universal Numbering System (DUNS)<br>- `0088`: GS1 Global Location Number (GLN)<br>- `0199`: Legal Entity Identifier (LEI) |
| `legalName` | `Text`<br>The registered, legal name of your `Organization`, if applicable and different<br>from the `name` property. |
| `leiCode` | `Text`<br>The identifier for your `Organization` as defined in ISO 17442, if applicable.<br>We encourage using the `iso6523Code` field with prefix `0199:` instead. |
| `logo` | `URL` or `ImageObject`<br>A logo that is representative of your organization, if applicable. Adding this property can help Google<br>better understand which logo you want to show, for example in Search results and knowledge<br>panels.<br>Image guidelines:<br>- The image must be 112x112px, at minimum.<br>- The image URL must be crawlable and indexable.<br>- The image file format must be [supported by Google Images](https://developers.google.com/search/docs/appearance/google-images#supported-image-formats).<br>- Make sure the image looks how you intend it to look on a purely white background (for<br>   example, if the logo is mostly white or gray, it may not look how you want it to look when<br>   displayed on a white background).<br>If you use the `ImageObject` type,<br>make sure that it has a valid `contentUrl` property or<br>`url` property that follows the same guidelines as a<br>`URL` type. |
| `naics` | `Text`<br>The [North American Industry Classification System (NAICS) code](https://www.census.gov/naics/)<br>for your `Organization`, if applicable. |
| `name` | `Text`<br>The name of your organization. Use the same `name` and `alternateName`<br>that you're using for your [site name](https://developers.google.com/search/docs/appearance/site-names). |
| `numberOfEmployees` | `QuantitativeValue`<br>The number of employees in your `Organization`, if applicable.<br>Example with a specific number of employees:<br>```<br>"numberOfEmployees": {<br>  "@type": "QuantitativeValue",<br>  "value": 2056<br>}<br>```<br>Example with the number of employees in a range:<br>```<br>"numberOfEmployees": {<br>  "@type": "QuantitativeValue",<br>  "minValue": 100,<br>  "maxValue": 999<br>}<br>``` |
| `sameAs` | `URL`<br>The URL of a page on another website with additional information about your organization,<br>if applicable. For example, a URL to your organization's profile page on a social media or<br>review site. You can provide multiple `sameAs` URLs. |
| `taxID` | `Text`<br>The tax ID associated with your `Organization`, if applicable. Make sure<br>`taxID` matches the country that you provided in the `address` field. |
| `telephone` | `Text`<br>A business phone number meant to be the primary contact method for customers, if applicable.<br>Be sure to include the country code and area code in the phone number. |
| `url` | `URL`<br>The URL of the website of your organization, if applicable. This helps Google uniquely<br>identify your organization. |
| `vatID` | `Text`<br>The VAT (Value Added Tax) code associated with your `Organization`, if applicable<br>to your country and business. This is an important trust signal for users (for example, users<br>can look up your business in public VAT registries). |

## Troubleshooting

If you're having trouble implementing or debugging structured data, here are some resources that
may help you.


- If you're using a content management system (CMS) or someone else is taking care of your site,
ask them to help you. Make sure to forward any Search Console message that details the issue to them.
- Google does not guarantee that features that consume structured data will show up in search results.
For a list of common reasons why Google may not show your content in a rich result, see the
[General Structured Data Guidelines](https://developers.google.com/search/docs/appearance/structured-data/sd-policies).
- You might have an error in your structured data. Check the
[list of structured data errors](https://support.google.com/webmasters/answer/13300873)
and the [Unparsable structured data report](https://support.google.com/webmasters/answer/9166415).
- If you received a structured data manual action against your page, the structured data on
the page will be ignored (although the page can still appear in Google Search results). To fix
[structured data issues](https://support.google.com/webmasters/answer/9044175#zippy=%2Cstructured-data-issue), use the [Manual Actions report](https://support.google.com/webmasters/answer/9044175).

- Review the [guidelines](https://developers.google.com/search/docs/appearance/structured-data/organization#guidelines) again to identify if your content isn't compliant
with the guidelines. The problem can be caused by either spammy content or spammy markup usage.
However, the issue may not be a syntax issue, and so the Rich Results Test won't be able to
identify these issues.

- Structured data issues can affect how your site's content appears in search results. Use this
[Troubleshoot missing rich results / drop in total rich results](https://support.google.com/webmasters/answer/13300208)
guide to review a step-by-step approach to identify, fix, and validate these issues in Search Console.
- Allow time for re-crawling and re-indexing. Remember that it may take several days after
publishing a page for Google to find and crawl it. For general questions about crawling and indexing, check the
[Google Search crawling and indexing FAQ](https://developers.google.com/search/help/crawling-index-faq).

- Post a question in the [Google Search Central forum](https://support.google.com/webmasters/community).



 Send feedback



Except as otherwise noted, the content of this page is licensed under the [Creative Commons Attribution 4.0 License](https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the [Apache 2.0 License](https://www.apache.org/licenses/LICENSE-2.0). For details, see the [Google Developers Site Policies](https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2026-09-08 UTC.


Need to tell us more?






\[\[\["Easy to understand","easyToUnderstand","thumb-up"\],\["Solved my problem","solvedMyProblem","thumb-up"\],\["Other","otherUp","thumb-up"\]\],\[\["Missing the information I need","missingTheInformationINeed","thumb-down"\],\["Too complicated / too many steps","tooComplicatedTooManySteps","thumb-down"\],\["Out of date","outOfDate","thumb-down"\],\["Samples / code issue","samplesCodeIssue","thumb-down"\],\["Other","otherDown","thumb-down"\]\],\["Last updated 2026-09-08 UTC."\],\[\],\["To enhance Google Search visibility, implement \`Organization\` structured data on your website's homepage, specifying details like name, logo, and contact information. Key actions include: adding relevant properties, adhering to guidelines, validating with the Rich Results Test, deploying and testing on a few pages, and maintaining by submitting sitemaps. For online stores, utilize \`OnlineStore\` subtype with \`contactPoint\` and \`hasMerchantReturnPolicy\`. The merchant return policy requires defining properties like \`applicableCountry\` and \`returnPolicyCategory\`, and also allows recommended properties like \`refundType\`. Maintain and re-crawl the data.\\n"\]\]



Info


Chat


API
