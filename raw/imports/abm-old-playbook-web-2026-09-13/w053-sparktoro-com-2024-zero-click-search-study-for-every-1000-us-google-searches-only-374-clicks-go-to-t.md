---
type: "web-source-capture"
title: "2024 Zero-Click Search Study: For every 1,000 EU Google Searches, only 374 clicks go to the Open Web. In the US, it’s 360. - SparkToro"
url: "https://sparktoro.com/blog/2024-zero-click-search-study-for-every-1000-us-google-searches-only-374-clicks-go-to-the-open-web-in-the-eu-its-360"
resolved_url: "https://sparktoro.com/blog/2024-zero-click-search-study-for-every-1000-us-google-searches-only-374-clicks-go-to-the-open-web-in-the-eu-its-360/"
captured_at: "2026-09-13T17:58:32.563093+00:00"
capture_method: "Firecrawl main-content Markdown; non-generative extraction"
capture_scope: "full-main-text"
source_id: "W053"
capture_receipt: "wiki/_outputs/abm-old-playbook-2026-09-13/web-ingest/receipts/w053.json"
selection_authority: "User-selected URLs from ABM old-playbook research, 2026-09-13; custody is not claim approval"
---

Over the past decade, I’ve done [several](https://sparktoro.com/blog/less-than-half-of-google-searches-now-result-in-a-click/) [reports](https://sparktoro.com/blog/in-2020-two-thirds-of-google-searches-ended-without-a-click/) with multiple clickstream panels analyzing Google search behavior at scale. The last such analysis was in [2021](https://sparktoro.com/blog/in-2020-two-thirds-of-google-searches-ended-without-a-click/), and behavior almost certainly looks different today thanks to changes from both Google itself and its search consumers. In past reports, I’ve only been able to look at searches for the United States. This time, given the European Union’s [recent rules](https://ec.europa.eu/commission/presscorner/detail/en/ip_23_3207) around Google’s self-preferencing behavior, and the [rollout](https://blog.google/products/search/generative-ai-google-search-may-2024/) (and [rollback](https://www.wired.com/story/google-ai-overview-search-issues/)) of AI Overviews, I wanted to extend the analysis to both regions.

![What happens after a Google search in the US vs. EU in 2024? (results from the joint Datos & SparkToro study)](https://images.sparktoro.com/blog/wp-content/uploads/2024/07/2024-what-happens-after-google-search-eu-vs-us-2.png)

Thanks to the kind folks from [Datos, (a Semrush Company)](https://datos.live/), whose multi-million device clickstream panel powers a significant part of SparkToro’s [audience research software](https://sparktoro.com/product), we’re able to revisit critical questions, like:

- What happens, on average, after Americans and Europeans search Google?
- What percent of searches in 2024 end without a click?
- Have the EU’s regulations curbed Google’s ability to funnel search traffic to its own properties (YouTube, Google Flights, Google Hotels, etc.)?
- Is the popular media narrative that Google is losing out to LLM-powered tools like ChatGPT, Perplexity, or Microsoft’s Bing correct?
- Has the rollout of AI Overviews changed how many searches consumers perform, how many results they click, or how much traffic Google sends to the open web?

With Datos’ numbers in hand, I was able to not only address, but also visually answer these with nine unique charts below.

## Caveats and Data Limitations

Before we get into the numbers, there are a few important things to keep in mind about how clickstream panels work, and how they apply to this study.

1. Clickstream panelists may not be perfectly representative of the overall population (though I’ve found them to historically be [as close as we can get](https://sparktoro.com/blog/which-3rd-party-traffic-estimate-best-matches-google-analytics/)). Datos obviously goes to great lengths to ensure that their panelists are a demographic and behavioral match to the overall online population, not just for research like this, but because their customers require it! Still, it’s wise to keep in mind that some limitations exist, such as…
2. Minimal coverage of mobile iOS devices (iPhones and iPads) are currently available in the panel. While it’s unlikely that Google searchers on iPhones behave significantly differently than Android, PC, or Apple desktop searchers, this constraint should be noted.
3. Mobile data only goes back to January 2024–you’ll see in the graphs below that time series graphs, pie charts, and visuals that include mobile data only compare the first 5 months of this year. The good news is that, moving forward, we’ll have a longer stretch of mobile panelists to study.
4. Ad blockers, in particular those that remove or hide Google’s top ads in search, may be responsible for the lower-than-expected paid search CTR numbers vs. my previous zero-click search studies. Various estimates put US ad-blocking usage at [31](https://www.emarketer.com/insights/ad-blocking/)– [50](https://www.theregister.com/2024/03/27/america_ad_blocker/)% of desktop and mobile devices, with generally [higher numbers in Europe](https://backlinko.com/ad-blockers-users). Not all ad blockers remove Google paid search ads, but [plenty do](https://www.reddit.com/r/brave_browser/comments/hux4ww/any_way_to_block_ads_in_google_search_results/). Datos doesn’t single out or remove panelists who use ad-blocking, and since we didn’t control for it here, we may be undercounting paid search clicks and overestimating organic clicks (in both regions).
5. In order to account for the distribution of mobile vs. desktop searches, we’ve employed percentages from [Sistrix’s excellent 2023 study](https://www.sistrix.com/blog/the-proportion-of-mobile-searches-is-more-than-you-think-what-you-need-to-know/) of mobile vs. desktop search volumes in the US (63% of searches are on mobile devices) and EU (64.7% of searches are on mobile devices) as baselines.

With those limitations in mind, let’s get to the data.

## What happens after Americans and Europeans search Google?

The power of an active, multi-million user clickstream panel is its ability to comprehensively see all behavior, rather than just selected subsets. In the case of Google searches, for example, other studies have purported to analyze zero-click searches or the results of self-preferencing by looking at the click-through-rates of millions of keywords. That doesn’t work.

Any study that selects and analyzes keywords fails to account for real searcher behavior. Real searchers query the same keyword multiple times. Sometimes they click, sometimes not. Real searchers query keywords that will never show up in SEO tool datasets, ad impression data, or Google Search Console. Their search behavior is diverse, unexpected, and messy… i.e. they’re human.

The only accurate way to put trustworthy numbers to search behavior at scale, is to have access to a full clickstream for millions of actual people (like Google’s Chrome dataset, which was revealed to be a key source of their algorithmic data in the [recent search API leak](https://sparktoro.com/blog/an-anonymous-source-shared-thousands-of-leaked-google-search-api-documents-with-me-everyone-in-seo-should-see-them/)). We can’t cherry pick keywords or websites that receive traffic; we need to know all the searches and follow-up behavior that users perform. Thank the statistical gods for Datos’ panel, which provides us with this unique insight.

Let’s begin with Google search activity in the United States.

![In 2024, what happens after Americans search Google (breakdown from the Datos & SparkToro study )](https://images.sparktoro.com/blog/wp-content/uploads/2024/07/Slide1.png)

Zero-click searches are defined as those that end without clicking on any of the results presented. It includes searches that end with the searcher satisfied, frustrated, or changing their search to perform a new one. In the United States, just under 60% of mobile web and desktop searches in Datos’ panel ended this way.

We’re almost certainly under-counting the “zero-click search” problem because this data does not account for use of voice-answered searches through Google Assistant, or searches done in the Google mobile search app (which, while similar to in-browser results, features even more rich answer results).

Equally concerning, especially for those worried about Google’s monopoly power to self-preference their own properties in the results, is that **almost 30% of all clicks go to platforms Google owns**. YouTube, Google Images, Google Maps, Google Flights, Google Hotels, the Google App Store, and dozens more means that Google gets even more monetization and sector-dominating power from their search engine.

Most interesting to web publishers, entrepreneurs, creators, and (hopefully) regulators is the final number: **for every 1,000 searches on Google in the United States, 360 clicks make it to a non-Google-owned, non-Google-ad-paying property**. Nearly 2/3rds of all searches stay inside the Google ecosystem after making a query.

For marketers, this underscores the importance of [zero-click content](https://sparktoro.com/blog/zero-click-content-the-counterintuitive-way-to-succeed-in-a-platform-native-world/): getting value from searches that don’t result in a click. For those concerned about Google’s monopoly power, it suggests that efforts thus far haven’t done much to curb the search giant’s power.

Let’s look at how that compares to the EU.

![In 2024, what happens after Europeans search Google (breakdown from the Datos & SparkToro study )](https://images.sparktoro.com/blog/wp-content/uploads/2024/07/Slide2.png)

Zero-click searches in Europe are slightly higher than in the United States, but clicks to the open web are also a bit higher. This slight improvement appears to be because Google in the EU sends less traffic to itself than it does in the US, perhaps an indication that [the European Union’s Digital Markets Act](https://www.theverge.com/2024/1/17/24041581/google-search-chrome-android-price-comparison-digital-markets-act-eu) had some impact, though perhaps less than what was hoped.

**In the EU, for every 1,000 Google searches, 374 clicks go to the open web.**

This analysis includes searches that result in clicks on multiple results (~20% of searches that result in at least one click have more than one). Below, I’ve broken down mobile and desktop devices in the US and EU, and the five types of behaviors we’re analyzing: searches where the session ends, searches where the searcher performs a new query, and clicks to a Google-property, Google ad, and/or the open web.

![Breakdown of US vs. EU Google Search Behavior](https://images.sparktoro.com/blog/wp-content/uploads/2024/07/Slide3.png)

The most notable takeaways for me are:

- Search behavior in both regions is quite similar with the exception of paid ads (EU mobile searchers are almost 50% more likely to click a Google paid search ad) and clicks to Google properties (where US searchers are considerably more likely to find themselves back in Google’s ecosystem after a query).
- Almost half of mobile searches in both the US and EU end the browsing session entirely; more than 2X the percent of such searches on desktop devices.
- Universally, ~22% of searches result in another search. A future study to categorize this by searchers who refine their existing search (using a similar term/phrase) vs. search for something entirely new would likely be interesting to marketers.

## How Can Paid Search Account for Only 1% of Clicks?

Much of the initial reactions to this report focused on this number in particular. Search marketers often manage 4%, 5%, even 10%+ CTRs on their paid search ads, which would seem to contradict the data I’ve provided here.

But, that’s not what’s being reported.

1% of all clicks includes billions of Google searches in which no paid ad was present. In fact, in 2023, Google themselves stated that [less than 20% of search queries contain a paid ad](https://www.theverge.com/2023/11/1/23941766/google-antitrust-trial-search-queries-ad-money). If we assume that number remains accurate in 2024, then paid ad CTR is at least 5%, on average, when paid/sponsored ads are visible in a Google SERP. My guess is that, when paid ads appear, especially when they’re on top of all other search results, avg paid ad CTR is between 5-10%.

![](https://fast.wistia.com/embed/medias/ezflsg8fbc/swatch)

Press O for more options

![Video Thumbnail](https://fast.wistia.com/embed/medias/ezflsg8fbc/swatch)

![Video Thumbnail](https://embed-ssl.wistia.com/deliveries/4659fd464a34899f86f41ec0bd6651ae8eb69b92.webp?image_crop_resized=1920x1080)

Click for sound

4:57

I’ve addressed this in more depth in the short video above, along with a walkthrough of the research methodology and common concerns more broadly.

## Is Google Losing in Search?

Numerous prognosticators and media analysts (including [some I deeply respect](https://www.theverge.com/23712602/google-search-25-years-anniversary-ai-artificial-intelligence)) have theorized that Google is getting worse and losing volume and/or share as a result. So far, their quarterly earnings numbers have [suggested the opposite](https://www.google.com/finance/quote/GOOG:NASDAQ?sa=X&ved=2ahUKEwj9-N7m0oeHAxXDh44IHTLFAXoQ3ecFegQIPhAh&window=5Y). So, which is it?

According to Datos’ panel, Google’s in no risk of losing market share, total searches, or searches per searcher. On all of these metrics they are, in fact, stronger than ever.

In both the US and EU, searches per searcher are rising and, in the Spring of 2024, were at historic highs. That data doesn’t fit well with the narrative that Google’s cost themselves credibility or that Internet users are giving up on Google and seeking out alternatives.

![Number of Google Searches per Desktop Searcher United States vs. European Union](https://images.sparktoro.com/blog/wp-content/uploads/2024/07/Slide9.png)

Note: Datos only provided me with mobile panel data from January-May of 2024, so I’ve used desktop numbers to give a longer historical view in the chart above.

The only slump we see in the chart above comes in the summer of 2023, and that’s almost certainly seasonality at play rather than a decline in quality/preferred-engine. Summers in the Northern Hemisphere mean less time online, fewer searches from students, and (in the EU) holidays away from desktop machines.

Next, let’s explore how Google’s traffic to the open web is going.

![Google Desktop US vs. EU Search Clicks to the Open Web 2022-2024](https://images.sparktoro.com/blog/wp-content/uploads/2024/07/Slide4.png)

The news here is not great. Despite a bump in clickthroughs to the open web in summer 2023, the overall trend is negative, and both the EU and US are at historic lows. In short, Google continues to send less and less of its ever-growing search pie to the open web.

The only saving grace is that, because that pie is growing, the overall amount of traffic Google refers to the open web (which we measured and reported on in our [Who Sends Traffic on the Web study](https://sparktoro.com/blog/who-sends-traffic-on-the-web-and-how-much-new-research-from-datos-sparktoro/) this March) remains relatively stable. Google’s getting more searches, which props up the decreasing share of searches that turn into clicks on anyone but Google themselves.

Speaking of… let’s look at how Google’s own Google-search-referral traffic has fared these past 21 months:

![Percent of Desktop Google Search Clicks that Led to a Google-Owned Property](https://images.sparktoro.com/blog/wp-content/uploads/2024/07/Slide5.png)

After a decline in 2022 and early 2023, Google’s back to referring a historically high amount of its search clicks to its own properties. That’s not great for competition in sectors like flights, hotels, videos, local reviews, and dozens of others, and it’s evident that Google continues to use its monopoly power in search to unfairly compete in other arenas. This is separate from the tactics Google’s used to maintain its advertising monopoly (the ones the [US DOJ sued Google](https://www.justice.gov/opa/pr/justice-department-sues-google-monopolizing-digital-advertising-technologies) over), but in my opinion, equally worthy of attention and redress.

This chart is, however, evidence that things are different in the EU vs. US; it is, in fact, the most substantive difference between searchers in the two regions. Perhaps the EU’s [regulations against self-preferencing](https://techcrunch.com/2024/01/23/google-dma-search-changes-edreams/) are actually working! At least a little.

It’s important to note that while the data in the chart above doesn’t include mobile searches (because we wanted to look back prior to January 2024), we do have mobile and desktop for 5 months of data (January-May 2024). Those 5 months mimic one another in terms of trendline directions, so we could reasonably expect that mobile clicks to Google properties followed a similar pattern (though at a higher percentage) over the prior 21 months.

Overall, I feel that [Cyrus’ Shepard](https://zyppy.com/cyrus/)‘s half-decade-old tweet is still the best summation of this situation.

[![Cyrus Shepard's 2019 tweet about Google](https://images.sparktoro.com/blog/wp-content/uploads/2024/07/image-1.png)](https://x.com/cyrusshepard/status/1159870778105638912)

Google is the gateway to the web, but they’re clearly using that power in ways that antitrust was designed to protect against, counting on weak regulation, political donations, and their immense coffers to immunize them from being held to account.

## Zero-Click Searches in Google: 2024

For years, search marketers have worried about how many searches Google is answering themselves, without sending a click anywhere (not even to their own properties or a paid ad). Now, for the first time, Datos’ expansive US and EU panels let us compare the two regions side by side.

**In 2024, 59.7% of European Union Google searches and 58.5% of American Google searches resulted in zero clicks.** Searchers either ended their session entirely (~37% of the time), or changed their search query to something else (~22% of the time).

![Zero-Click Searches in the European Union vs. United States 2024](https://images.sparktoro.com/blog/wp-content/uploads/2024/07/Slide6.png)

These zero-click search numbers are slightly lower than the highs [reported](https://sparktoro.com/blog/in-2020-two-thirds-of-google-searches-ended-without-a-click/) by SimilarWeb in December 2020, but considerably greater than the 2019 numbers [reported](https://sparktoro.com/blog/less-than-half-of-google-searches-now-result-in-a-click/) by the now-defunct Jumpshot panel in June 2019.

Different panels have different compositions of users, and it’s hard for me to say with certainty which clickstream panel most accurately represents what we’d find if we could magically analyze every search on every Internet-connected device in both regions. That said, my best guess is that the methodology used in the December 2020 study with SimilarWeb may have been less accurate than what I’ve done with Datos in this report or with Jumpshot in the 2019 study. I don’t have evidence of that, just a gut feel.

## Did AI Overviews Make a Big Difference in Search Behavior?

Let’s address one of the core questions journalists, search enthusiasts, Google investors, and SEOs have been asking themselves since May’s awkward US rollout (on May 14) and rollback (on May 30) of AI Overviews. There was a massive amount of variance reported on the prevalence of this feature ( [some reports](https://www.wired.com/story/google-cut-back-ai-overviews-before-pizza-glue/) showed it was on up to 63% of queries, [others](https://www.brightedge.com/blog/10-observations-about-transition-sge-ai-overviews-may-2024) claimed up to 84%). However, the general consensus seems to be that once June hit, AI Overviews show on [under 15% of SERPs](https://digiday.com/media/why-publishers-fear-traffic-ad-declines-from-googles-ai-generated-search-results/). The [most recent study](https://www.advancedwebranking.com/blog/ai-overview-study), by Philip Petrescu at AWR, showed AI Overviews in June on 12.7% of US Google results.

So, comparing May 2024 to the four months prior, we should be able to see exactly how searches per searcher and clicks per search changed:

![Google Searches/Searcher 2024 EU vs. US](https://images.sparktoro.com/blog/wp-content/uploads/2024/07/Slide7.png)

![Clicks/Google search 2024 EU vs. US](https://images.sparktoro.com/blog/wp-content/uploads/2024/07/Slide8.png)

The most visible changes in May were shared by both the EU and US (suggesting the AI Overviews might not have had the impact prognosticators feared, since only the US had them), notably:

- Desktop searches rose a little
- Mobile searches fell a considerable amount (if anything spooked Google into rolling back this feature, I’d put my money on this being it)
- Clicks per search on mobile rose
- Clicks per search of desktop were flat

I think the media’s assessment that this was a panicked move done to appease the Google leadership team’s awkward obsession with all things “AI” seems plausible. If I were running Google, that dip in mobile searches (remember, mobile accounts for almost 2/3rds of all Google queries) would scare the stock-price-worshiping-crap outta me. But, it’s important to note that, because AI Overviews rolled out broadly in May in the US and not the EU, these charts let us compare if and how they changed searcher behavior patterns… i.e. not much.

My personal takeaway? Both the fear of AI Overviews and the “death of Google search quality” are _all sound and fury, signifying nothing_. Or, at least, not very much.

## Methodology Notes

_The data displayed in this report has been provided by Datos, A Semrush Company. As a leading clickstream provider, Datos has access to the desktop & mobile browsing behavior for tens of millions of users across the globe. The data used for this article comes from Datos’_ _US & EU_ _panel, representing a diverse and statistically significant sample of users during the dates of_ _September 2022 to May 2024._

_For more information about Datos, check out their website:_ [_https://datos.live/_](https://datos.live/)

Datos provided me with numerical counts of searchers performing each of the processes described in this document: searches where a session ended, searches that led to another search, searches that led to a click (and where), etc. I used these numbers to build percentage calculations for EU and US desktop and mobile devices, then weighted these based on the average percent of desktop vs. mobile search usage in the regions.

Datos’ clickstream panel is made up of tens of millions of panelists around the world on desktop (PC and iOS) and mobile Android devices. iPhones aren’t included, and if their behavior in Google search differs statistically in significant ways from Android/PC/Mac users, these results would change (to date, we have no evidence that iPhone Google users search or click any differently from other device types).

If you have further questions about this study, feel free to contact [Rand@SparkToro.com](mailto:Rand@SparkToro.com). Permission to use the graphs and the data in this study is happily granted so long as attribution (and a link) back to this page is included (Statista, I’m looking in your direction 👀, and no, charging people for the citation does not count).

Thanks for reading the study and sharing this data. Stay tuned for more exciting research as part of the SparkToro/Datos partnership!

## Discover Our Most Recent Blogs

- [Audience Research Briefs](https://sparktoro.com/blog/category/audience-research-briefs/)
- [Marketing](https://sparktoro.com/blog/category/marketing/)

### [How We’d Market a $400 Skincare Device Before Black Friday](https://sparktoro.com/blog/how-wed-market-a-400-skincare-device-before-black-friday/)

I’ve been trying to streamline my skincare routine while still getting solid results. The 10-step Korean skincare routine?…

![Amanda Natividad](https://sparktoro.com/blog/wp-content/themes/sparktoro-v3/img/amanda-head.jpg)Amanda Natividad25 Aug 2026•10 min read

- [Marketing](https://sparktoro.com/blog/category/marketing/)
- [Product](https://sparktoro.com/blog/category/product/)
- [SparkToro](https://sparktoro.com/blog/category/sparktoro/)

### [The Best Persona Tool On the Web Is Now Live](https://sparktoro.com/blog/the-best-persona-tool-on-the-web-is-now-live/)

Starting today, SparkToro’s persona-generation tool is now live and available to all our business and agency-tier subscribers, and…

![Rand Fishkin](https://sparktoro.com/blog/wp-content/themes/sparktoro-v3/img/rand-head.jpg)Rand Fishkin17 Aug 2026•4 min read

- [5-Minute Whiteboards](https://sparktoro.com/blog/category/5-minute-whiteboards/)
- [Content Marketing](https://sparktoro.com/blog/category/content-marketing/)
- [Marketing](https://sparktoro.com/blog/category/marketing/)

### [Does Your Website Still Matter in the Zero-Click Era?](https://sparktoro.com/blog/does-your-website-still-matter-in-the-zero-click-era/)

Scholars are divided, but we’re still believers. The website may be visited less, by fewer people, but it’s…

![Rand Fishkin](https://sparktoro.com/blog/wp-content/themes/sparktoro-v3/img/rand-head.jpg)Rand Fishkin14 Aug 2026•5 min read
