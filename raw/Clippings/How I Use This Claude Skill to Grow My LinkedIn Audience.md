---
title: "How I Use This Claude Skill to Grow My LinkedIn Audience"
source: "https://www.kieranflanagan.io/p/how-i-use-this-claude-skill-to-grow?utm_source=post-email-title&publication_id=3918782&post_id=208252457&utm_campaign=email-post-title&isFreemail=true&r=4qf1z&triedRedirect=true&utm_medium=email"
published: 2026-07-24
created: 2026-08-01
tags:
  - "clipping"
  - "research"
author:
  - "[{\"@type\":\"Person\""
  - "\"name\":\"Kieran Flanagan\""
  - "\"url\":\"https://substack.com/@kieranflanagan\""
  - "\"description\":\"SVP Marketing @HubSpot"
  - "podcast host"
  - "investor"
  - "advisor\n\""
  - "\"identifier\":\"user:185293\""
  - "\"image\":{\"@type\":\"ImageObject\""
  - "\"contentUrl\":\"https://substackcdn.com/image/fetch/$s_!628O!"
  - "f_auto"
  - "q_auto:good"
  - "fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2Fd4ee4e56-f72b-4769-9b30-c87a8d07196c_1086x1086.jpeg\""
  - "\"thumbnailUrl\":\"https://substackcdn.com/image/fetch/$s_!628O!"
  - "w_128"
  - "h_128"
  - "c_limit"
  - "f_auto"
  - "q_auto:good"
  - "fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2Fd4ee4e56-f72b-4769-9b30-c87a8d07196c_1086x1086.jpeg\"}}]"
---
# How I Use This Claude Skill to Grow My LinkedIn Audience

> Quelle: https://www.kieranflanagan.io/p/how-i-use-this-claude-skill-to-grow?utm_source=post-email-title&publication_id=3918782&post_id=208252457&utm_campaign=email-post-title&isFreemail=true&r=4qf1z&triedRedirect=true&utm_medium=email
> Veröffentlicht: 2026-07-24T13:06:17+02:00
> Geclippt am: 2026-08-01

### It scrapes your LinkedIn analytics, shows in-network vs. out-of-network reach, and reveals which posts actually break out of your bubble.

Anyone building a personal audience through content has, at some point, been whacked by algorithmic changes. This is happening on LinkedIn all the time as they attempt to deal with the onslaught of AI-generated content.

The Pangram Labs study (published July 9, 2026) scanned over 1 million posts across five platforms. LinkedIn was the most AI-saturated by a wide margin: over 40% of long-form posts (250+ words) were fully AI-generated, and LinkedIn accounted for 62% of all AI-flagged content across the five platforms studied.

It’s not just LinkedIn; I stopped really investing in X when the algo update no longer rewarded the kind of content I enjoyed posting. We’ve recently seen our YouTube channel take a huge hit as the algorithm has changed to account for AI-generated videos.

And so, this month, I’ve seen a huge drop in the performance of my posts on LinkedIn, and I thought, huh, I wonder why. LinkedIn’s content analytics suck. So, I got busy and built my own dashboard featuring a new metric that I believe is the most important to track if you want to grow an audience on that platform.

***IMPORTANT NOTE:** People over on LinkedIn pointed out you’re not allowed to use browser extensions to scrape data from LinkedIn. My recommendation is not to use the Claude skill; instead, take screenshots of your posts’ analytics. Have Claude then parse the images for the metrics cited below. Will leave Claude skill below as can be adapted for other purposes.*

In this post, I’ll walk you through it, and you can download a templatized version of the dashboard and a Claude Skill to build your own version.

[See the live demo dashboard →](https://searchbrat.github.io/linkedin-dashboard/linkedin-dashboard.html)

![](https://substackcdn.com/image/fetch/$s_!GiK9!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F4670c86e-3f23-4ef9-b982-10b6573b02be_2540x1504.png)

## What You Get

A single interactive dashboard that lives inside Claude as an Artifact you can update anytime, populated by a single Claude skill that uses Claude computer.

The interactive dashboard features:

- Monthly trend charts for impressions, reach, followers, gained, and engagements.
- Click any month to see an overview of performance for that month, broken out at the post level.
- Top 10 leaderboards broken out by impressions, engagements, and virality.
- In-network vs. out-of-network reach so you can see which posts break out of your bubble. THIS is the most important metric for LinkedIn that no one tracks. The dashboard makes it easy.
- A 🔥 viral badge on posts where more than half the reach came from outside your network
- Full post content you can click to expand and re-read

A living dashboard inside Claude that updates every time you run the skill.

---

*As per above, the following has been updated to account for the fact using Claude’s Chrome extension to gather data is against LinkedIn’s TOS.*

## Step 1: Screenshot Your LinkedIn Analytics

Go to your LinkedIn analytics page. You need to capture two things for each month you want to track:

**Your post list.** Open your analytics, filter by the month, and screenshot the table showing all your posts with their impressions, engagements, and other stats. If your posts don’t fit in one screenshot, take multiple ones. Get every post.

**Individual post analytics.** For your top-performing posts, click into the detailed analytics view and screenshot the breakdown showing in-network vs out-of-network reach, followers gained, and members reached.

Don’t overthink this. If you can see the numbers on your screen, Claude can read them.

## Step 2: Build Your Dashboard

Open a new Cowork session in Claude. Upload all your screenshots and use this prompt:

> “Extract all the LinkedIn analytics data from these screenshots. For each post, capture: the post content (or first line), date published, impressions, engagements, followers gained, members reached, and in-network vs out-of-network percentage. Then build me an interactive HTML dashboard as an Artifact with monthly trend charts, a leaderboard of top posts, and month-by-month post breakdowns. Flag any post where more than 50% of reach came from outside my network as viral.”

Claude will read every number from your screenshots, structure it all into data, and build the full dashboard. The whole process takes a couple of minutes.

## Step 3: Keep It Updated

Next month, take fresh screenshots and open a new Cowork session. Upload them alongside your existing dashboard Artifact and say:

> “Here are my LinkedIn analytics screenshots for August 2026. Add this month’s data to my existing dashboard and rebuild it.”

Each time you do this, your dashboard grows. More months, more data, more patterns.

The reason you’d want to go back and update previous months is that content on LinkedIn has a long tail. Old posts continue to gain impressions and engagement. I’d suggest always refreshing the previous month’s screenshots when you add a new one. When I populate August 2026, I’ll also re-screenshot July’s numbers to catch the late-arriving metrics.

---

## How this helps you do better at LinkedIn

There is so much great analysis you can do with this dashboard, let me go through 3 great ones:

1\. **In-Network vs Out-of-Network Reach:** I remember feeling like there was a similar drop in my posts performance around February. But, I wasn’t sure, until I saw this chart:

![](https://substackcdn.com/image/fetch/$s_!G_8H!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbdf645fa-4b7d-48b3-9735-fc063032045b_2210x1020.png)

How much of your posts engagement are coming from within your followers (In) vs. outside (Out). The more coming from outside, the better you’ll perform. You’ll see July-26 is trending to be a poor month, similar to Feb-26. This tells me LinkedIn, for some reason, is showing my posts to less people from outside of my followers.

**2\. Chat with Live Artifact**: Chat to your live artifact and gather insights about the data it’s showing you. For example, I want to know why July is performing so poorly on ‘In-Network vs. Out-of-Network” vs. June. After going back and forth it told me:

- My last 3 posts were to ‘inside baseball’ targeting my existing followers vs. people who’d sit outside my network. I loosely agree. I do believe LinkedIn changed something 7 days ago.
- It pulled out a couple of posts in June’26 that would appeal to a much broader audience and gave me ideas of experiments to run.
- It said to cut the self-promotion lol. I don’t believe this is accurate, it’s because in July I referenced things I built. It marks them as self-promotion.

It’s incredibly helpful to chat about the data and gather insights. The fact all post text is added to the interactive dashboard allows you to derive real insights from writing patterns that are working vs. not working.

![](https://substackcdn.com/image/fetch/$s_!FkaK!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F9a0b1da0-158f-41d8-a5b5-ff5f9083112d_2252x1284.png)

**3\. Top Leaderboards:** I love this tab, it allows you to see your top 10 posts across impressions, engagements, and virality (posts with > 50% out-of-network engagements). Add the chat feature and you can gather insights into what is working, not working and what’s changed.

![](https://substackcdn.com/image/fetch/$s_!Y96x!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fa5250231-61c6-4e6b-9074-3384c6e428b4_2218x1108.png)

---

The key to getting better at anything, including growing your audience on LinkedIn, starts with looking at the right data & insights.

[» Get the skill and preview the dashboard](https://github.com/searchbrat/linkedin-dashboard)

Until Next Time,

Happy AI’fying

Kieran