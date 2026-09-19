---
type: "web-source-capture"
title: "Match Rates, VPNs, and Firewalls"
url: "https://support.6sense.com/docs/match-rates-vpns-and-firewalls"
resolved_url: "https://support.6sense.com/docs/match-rates-vpns-and-firewalls"
captured_at: "2026-09-13T17:59:26.210621+00:00"
capture_method: "Firecrawl main-content Markdown; non-generative extraction"
capture_scope: "full-main-text"
source_id: "W061"
capture_receipt: "wiki/_outputs/abm-old-playbook-2026-09-13/web-ingest/receipts/w061.json"
selection_authority: "User-selected URLs from ABM old-playbook research, 2026-09-13; custody is not claim approval"
---

> ## Documentation Index
>
> Fetch the complete documentation index at: [https://support.6sense.com/llms.txt](https://support.6sense.com/llms.txt)
>
> Use this file to discover all available pages before exploring further.

# Match Rates, VPNs, and Firewalls

- Updated on Jul 10, 2025
- Published on Jun 23, 2025

- 1 minute(s) read
- Listen

Follow

Print

Copy pageCopy as Markdown for LLMsView as MarkdownView the page as plain text

Open in ChatGPTAsk ChatGPT about this pageOpen in ClaudeAsk Claude about this page

Article summary

[Prev](https://support.6sense.com/docs/revenue-marketing-reference "Revenue Marketing Reference")[Next](https://support.6sense.com/docs/pageview-match-rates "Pageview Match Rates")

This page discusses how firewalls and VPNs affect 6sense match rates.

Firewalls generally shouldn’t impact 6sense match rates, firewalls are more about restricting traffic connecting into networks and don’t actively mask an IP.

The impact of VPNs depends what kind of VPN you are using. Sometimes VPNs can help make it easier for 6sense to match someone to a company if they are using a corporate VPN tunnel. In that case the IP address will always look like one 6sense has likely mapped to your HQ or account. This is because your home IP address (which 6sense may not know) now looks like your work IP address (which 6sense is more likely to know). However, it does affect 6sense location data – usually VPNs don’t cross country IP ranges (unless traveling), but it may affect the site visitor/city data.

If you are using a private VPN or one that uses obscure IPs, it can impact 6sense match rates because it may hide the IP and instead show one that 6sense has no association data for, or run through an aggregated VPN IP range used for many different users where 6sense can’t build confidence. It may also dynamically change your IP every time, so 6sense can never build a high confidence association around the activity data.

A VPN primarily affects IP matching, however 6sense is still able to leverage cookie information, device ID, etc. in these cases in order to identify an anonymous user despite fluctuations in IP addresses.

The 6sense matching algorithm uses the following tiers:

- **1st party cookies/device ID**: If 6sense has enough signal to confidently match an individual cookie to an account, we leverage this layer before IP matching.

  - Cookies do expire with time or can be cleared the user. 6sense cookies are 1st party so this tier of the algorithm won’t be effected by the Google 3rd party cookie deprecation.
- **IP to Company**

- **6sense Company Identity Graph**: The algorithm daily leverages the large 6sense signal network to create mappings of IP addresses to companies.

- 6sense doesn’t prioritize cookie or any other identifier by default.


Was this article helpful?

Yes  No

Previous article

FAQ: Third-Party Cookie Deprecation

Next article

Pageview Match Rates

Related articles

- [Company Identification API FAQ](https://support.6sense.com/docs/company-identification-api-faq)



Integrations > WebTag & APIs > APIs

- [FAQ: Third-Party Cookie Deprecation](https://support.6sense.com/docs/third-party-cookie-deprecation-faq)



Revenue Marketing > Run Advertising Campaigns > Advertising Reference
