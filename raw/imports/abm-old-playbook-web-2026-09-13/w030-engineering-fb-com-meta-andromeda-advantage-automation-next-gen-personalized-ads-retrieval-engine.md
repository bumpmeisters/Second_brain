---
type: "web-source-capture"
title: "Meta Andromeda: Supercharging Advantage+ automation with the next-gen personalized ads retrieval engine - Engineering at Meta"
url: "https://engineering.fb.com/2024/12/02/production-engineering/meta-andromeda-advantage-automation-next-gen-personalized-ads-retrieval-engine"
resolved_url: "https://engineering.fb.com/2024/12/02/production-engineering/meta-andromeda-advantage-automation-next-gen-personalized-ads-retrieval-engine/"
captured_at: "2026-09-13T17:58:01.977669+00:00"
capture_method: "Firecrawl main-content Markdown; non-generative extraction"
capture_scope: "full-main-text"
source_id: "W030"
capture_receipt: "wiki/_outputs/abm-old-playbook-2026-09-13/web-ingest/receipts/w030.json"
selection_authority: "User-selected URLs from ABM old-playbook research, 2026-09-13; custody is not claim approval"
---

[Skip to content](https://engineering.fb.com/2024/12/02/production-engineering/meta-andromeda-advantage-automation-next-gen-personalized-ads-retrieval-engine/#content)

![](https://engineering.fb.com/wp-content/uploads/2024/12/Andromeda-Blog-Hero_small.png)

By [Chonglin Sun](https://engineering.fb.com/author/chonglin-sun/ "Posts by Chonglin Sun"), [Nancy Yu](https://engineering.fb.com/author/nancy-yu/ "Posts by Nancy Yu"), [Haiyu Lu](https://engineering.fb.com/author/haiyu-lu/ "Posts by Haiyu Lu"), [Liang Wang](https://engineering.fb.com/author/liang-wang/ "Posts by Liang Wang"), [Yunchen Pu](https://engineering.fb.com/author/yunchen-pu/ "Posts by Yunchen Pu"), [Gaoxiang Liu](https://engineering.fb.com/author/gaoxiang-liu/ "Posts by Gaoxiang Liu"), [Neeraj Bhatia](https://engineering.fb.com/author/neeraj-bhatia/ "Posts by Neeraj Bhatia"), [GP Musumeci](https://engineering.fb.com/author/gp-musumeci/ "Posts by GP Musumeci")

- Andromeda is Meta’s proprietary machine learning (ML) system design for retrieval in ad recommendation focused on delivering a step-function improvement in value to our advertisers and people.
- This system pushes the boundary of cutting edge AI for retrieval withNVIDIA Grace HopperSuperchip and [Meta Training and Inference Accelerator (MTIA)](https://ai.meta.com/blog/next-generation-meta-training-inference-accelerator-AI-MTIA/) hardware through innovations in ML model architecture, feature representation, learning algorithm, indexing, and inference paradigm.
- We’re sharing how Andromeda establishes an efficient scaling law for retrieval by harnessing the power of state-of-the-art deep neural networks, benefitting from the co-design of ML, system, and hardware (NVIDIA and MTIA chips) that improves performance and return on investment.

AI plays an important role in Meta’s advertising [system](https://www.facebook.com/business/news/good-questions-real-answers-how-does-facebook-use-machine-learning-to-deliver-ads) by leveraging the power of machine learning (ML) to predict which ads a person will find most interesting. This helps people learn about a business or product they are interested in while helping an advertiser meet their objectives such as increasing brand awareness, acquiring new customers, and driving sales.

Retrieval is the first step in our multi-stage ads recommendation system. This stage is tasked with selecting ads from tens of millions of ad candidates into a few thousand relevant ad candidates. In the following stage, larger and more sophisticated ranking models predict people and advertiser value to determine the final set of ads to be shown to the person.

## Challenges and opportunities in this new era of advertiser automation with generative AI

The retrieval stage is challenging primarily because of scalability constraints in two axes: volume of ad candidates and tight latency constraints.

**Volume of ad candidates:** Retrieval processes three orders of magnitude more ads than subsequent stages. Features like predictive targeting, which dramatically improve advertiser outcomes, are computationally expensive. The continued positive momentum of Meta’s [Advantage+](https://www.facebook.com/business/help/397103717129942?id=1913105122334058&content_id=YAvwvDmp3OKQagl&ref=sem_smb&utm_term=dsa-1720753164846&gclid=Cj0KCQjw1Yy5BhD-ARIsAI0RbXYPq9-cjHq5qekJJW6O98EqjXQu8GZjHIsq-1VEFWFwXD37coGHgE4aAu_KEALw_wcB&gad_source=1) suite further increases the number of eligible ads through [automation](https://www.facebook.com/business/ads/automation) of audience creation, optimal budget allocation, dynamic placement across Meta surfaces, and creative generation. Finally, with the adoption of powerful new tools based on generative AI for creating and optimizing ad creative content, the number of ads creatives in Meta’s recommendation systems is expected to grow significantly.

**Tight latency constraints:** Selecting ads rapidly is essential for delivering timely and relevant ads, as any delay can disrupt the viewers experience by not providing the most current content. As advertising becomes increasingly dynamic, frequent updates to both delivery and each person’s interests demand increased model complexity in near real-time.

Processing such a vast number of ads in so little time is capacity intensive, which requires substantial optimization and innovation to scale up model complexity for better personalization while maintaining a high return on investment (ROI) on the required infrastructure investments.

## Unlocking advertiser value through industry-leading ML innovation

Meta Andromeda is a personalized ads retrieval engine that leverages the NVIDIA Grace Hopper Superchip, to enable cutting edge ML innovation in the Ads retrieval stage to drive efficiency and advertiser performance. Key AI advancements include:

### Deep neural networks custom-designed for the NVIDIA Grace Hopper Superchip to deliver superior performance

Andromeda improves performance of Meta ads system by delivering more personalized ads to viewers and maximizing return on ad spend for advertisers. Meta’s Ads team has created a deep neural network with increased compute complexity and massive parallelism on the NVIDIA Grace Hopper Superchip to better learn higher-order interactions from people and ads data. Its deployment across Instagram and Facebook applications has achieved +6% recall improvement to the retrieval system, delivering +8% [ads quality](https://www.facebook.com/business/help/1767120243598011) improvement on selected segments.

### Hierarchical indexing to support exponential ad creatives growth from Advantage+ creative

Advantage+ automates budget allocation, audience targeting, and bid adjustments – streamlining campaign management and boosting performance through more ads in the system for different audiences.

For example, when advertisers who did not previously use Advantage+ creative turned on its AI-driven targeting features, they experienced a 22% increase in ROAS from our ads. We estimate that businesses using image generation are seeing a +7% increase in conversions. Even at this early stage, more than a million advertisers used our generative AI (GenAI) tools to create more than 15 million ads in a month. Andromeda is designed to maximize ads performance by utilizing the exponential growth in volume of eligible ads available to the retrieval stage. It introduces an efficient hierarchical index to scale up to a large volume of ads creatives, empowering the adoption of GenAI technologies by advertisers.

### AI development efficiency

Andromeda reduces system complexity by minimizing components and rule-based logic, allowing for end-to-end performance optimization. This streamlined system enhances pace of adoption for future AI innovation in the retrieval space.

## Meta’s new personalized ads retrieval paradigm

Before Andromeda, Meta’s retrieval systems were only able to apply limited personalization, relying on a process with isolated model stages and numerous rule-based heuristics to manage the vast number of ads. This approach hindered end-to-end optimization and efficient global resource allocation to maximize performance. Handling such a massive volume of ads per request was complex, memory bandwidth-intensive, and difficult to scale, resulting in low hardware-level parallelism in conventional retrieval models. This often led to suboptimal performance and slower adoption of AI innovations.

![](https://engineering.fb.com/wp-content/uploads/2024/12/Personalized-Ads-Retrieval-Paradigm-Final.png?w=1024)

Andromeda represents a significant technological leap in retrieval – addressing the above challenges with key ML and system innovations.

### A state-of-the-art deep neural network for retrieval

Andromeda is able to efficiently scale retrieval models by designing a highly customized deep neural network with sublinear inference cost, enabling a meaningful increase of model capacity (10,000x) for enhanced personalization. Complex latent relationships between people’s interests, products, and services offered through ads are captured through advanced interaction features and new algorithms, further enhancing recommendation relevance and accuracy.

The design is optimized for AI hardware, minimizing memory bandwidth bottlenecks and enabling highly parallel, computation-intensive retrieval models with high performance. GPU preprocessing is used for feature extraction, and all precomputed ad embeddings and features are stored in the local memory of the Grace Hopper Superchip. This approach addresses the traditional scaling constraints of limited CPU-to-GPU interconnect bandwidth, heavy memory IO overhead, and low GPU utilization and enables efficient handling of a larger set of diverse feature inputs.

### Hierarchical indexing for efficiency and scalable retrieval

Andromeda organizes ads into a hierarchical index with multiple layers, reducing the number of inference steps by focusing only on most relevant nodes. The hierarchical index and retrieval models are jointly trained, which aligns the index representations with neural networks; this improves both precision and recall compared to commonly used two-tower neural networks or approximate nearest neighbor search.

The hierarchical structured neural network provides sub-linear inference costs, enabling retrieval models to scale up to much higher capacity, allowing efficient handling of a larger volume of ads with high retrieval accuracy while achieving higher performance.

### Model elasticity

Andromeda enhances overall system ROI by enabling agile and efficient resource allocation. A segment-aware design leverages higher complexity models to serve high value ads segments to maximize ROI. It automatically adjusts model complexity and inference steps in real-time based on available resources, thereby allowing a more scalable retrieval system. Together with a hierarchical structured neural network, model elasticity further boosts model inference efficiency by 10x.

### An optimized retrieval model

Andromeda significantly enhances the retrieval model’s instruction and thread-level parallelism through innovations in model architecture, features, learning algorithms, and the inference paradigm. This model is built with low-latency, high-throughput, and memory-IO aware GPU operators, utilizing deep kernel fusion and advanced software pipelining techniques. This minimizes kernel dispatching overhead, avoids bottlenecks on repeated HBM-SRAM memory IO, and reduces dependency on low arithmetic intensity modules.

Unlike conventional retrieval models that rely on expert-engineered features, Andromeda leverages the NVIDIA Hopper GPU’s massive parallel computing capabilities to dynamically reconstruct latent user-ad interaction signals on-the-fly, achieving over 100x improvement in both feature extraction latency and throughput of previous CPU based components. In addition, the chip’s high-bandwidth CPU-GPU interconnection supercharges ads retrieval inference to process an enormous number of ads per request, enabling a faster and more efficient delivery of relevant and personalized Ads. The effort has enhanced end-to-end model inference queries per second (QPS) by over 3x.

## Advancing the state of art in ads retrieval

Andromeda significantly enhances Meta’s ads system by enabling the integration of AI that optimizes and improves personalization capabilities at the retrieval stage and improves return on ad spend. A hierarchical indexing solution leveraging deep neural networks co-designed with the NVIDIA Grace Hopper Superchip helps address the scalability challenges presented by the exponential growth of creatives while delivering the best experience given the strict latency and capacity ROI budgets. Andromeda capitalizes the fast industry adoption of Advantage+ automation and GenAI to deliver value for our advertisers, people who use our suite of products, and Meta.

Looking forward, the Andromeda model architecture is expected to transition to support an autoregressive loss function, leading to a more efficient and faster inferencing solution that delivers a more diverse set of ad candidates. Increased ad diversity can improve people’s experience with ads and drive better advertiser outcomes.

Integrating Andromeda with MTIA and future generations of commercially-available GPUs will continue to push the boundaries of scaling retrieval – further improving advertiser performance and achieving what we estimate will be another 1,000x increase in model complexity.

### Acknowledgements

_We would like to thank Habiya Beg, Zain Brohi, Wenlin Chen, Yan Dong, Chunli Fu, Uday Garikipati, Golnaz Ghasemiesfeh, Xingfeng He, Akshay Hegde, Liquan Huang, Liuhan Huang, Kamran Izadi, Santosh Janardhan, Karthik Jayaraman, Changkyu Kim, Santanu Kolay, Ilia Lewis, Wenqian Li, Xiaotian Li, Rocky Liu, Paolo Massimi, Kexin Nie, Sandeep Pandey, Uladzimir Pashkevich, Alexander Petrov, Varna Puvvada, Hang Qu, Melanie Roe, Vibha Sinha, Yan Shi, Matt Steiner, Alisha Swinteck, Bangsheng Tang, Jim Tao, Sunay Vaishnav, Arunprasad Venkatraman, Vidhoon Viswanathan, Sasha Vorontsov, Minghui Wanghan, Fangzhou Xu, Nathan Yan, Tak Yan, Yang Yang, Qing Zhang, Fangyu Zou, and everyone who contributed to the success of Meta Andromeda._

### Share this:

- [Share on Facebook (Opens in new window)Facebook](https://engineering.fb.com/2024/12/02/production-engineering/meta-andromeda-advantage-automation-next-gen-personalized-ads-retrieval-engine/?share=facebook&nb=1)
- [Share on Threads (Opens in new window)Threads](https://engineering.fb.com/2024/12/02/production-engineering/meta-andromeda-advantage-automation-next-gen-personalized-ads-retrieval-engine/?share=threads&nb=1)
- [Share on WhatsApp (Opens in new window)WhatsApp](https://engineering.fb.com/2024/12/02/production-engineering/meta-andromeda-advantage-automation-next-gen-personalized-ads-retrieval-engine/?share=jetpack-whatsapp&nb=1)
- [Share on LinkedIn (Opens in new window)LinkedIn](https://engineering.fb.com/2024/12/02/production-engineering/meta-andromeda-advantage-automation-next-gen-personalized-ads-retrieval-engine/?share=linkedin&nb=1)
- [Share on Reddit (Opens in new window)Reddit](https://engineering.fb.com/2024/12/02/production-engineering/meta-andromeda-advantage-automation-next-gen-personalized-ads-retrieval-engine/?share=reddit&nb=1)
- [Share on X (Opens in new window)X](https://engineering.fb.com/2024/12/02/production-engineering/meta-andromeda-advantage-automation-next-gen-personalized-ads-retrieval-engine/?share=x&nb=1)
- [Share on Bluesky (Opens in new window)Bluesky](https://engineering.fb.com/2024/12/02/production-engineering/meta-andromeda-advantage-automation-next-gen-personalized-ads-retrieval-engine/?share=bluesky&nb=1)
- [Share on Mastodon (Opens in new window)Mastodon](https://engineering.fb.com/2024/12/02/production-engineering/meta-andromeda-advantage-automation-next-gen-personalized-ads-retrieval-engine/?share=mastodon&nb=1)
- [Share on Hacker News (Opens in new window)Hacker News](https://engineering.fb.com/2024/12/02/production-engineering/meta-andromeda-advantage-automation-next-gen-personalized-ads-retrieval-engine/?share=custom-1699562127&nb=1)
- [Email a link to a friend (Opens in new window)Email](mailto:?subject=%5BShared%20Post%5D%20Meta%20Andromeda%3A%20Supercharging%20Advantage%2B%20automation%20with%20the%20next-gen%20personalized%20ads%20retrieval%20engine&body=https%3A%2F%2Fengineering.fb.com%2F2024%2F12%2F02%2Fproduction-engineering%2Fmeta-andromeda-advantage-automation-next-gen-personalized-ads-retrieval-engine%2F&share=email&nb=1)

Facebook

[![Sequence learning: A paradigm shift for personalized ads recommendations](https://engineering.fb.com/wp-content/uploads/2022/11/Eng-Blog-Self-Serve-Hero-Images-DEBUGGING-203-.jpg?w=580&h=326&crop=1)\\
\\
Prev\\
\\
Sequence learning: A paradigm shift for personalized ads recommendations](https://engineering.fb.com/2024/11/19/data-infrastructure/sequence-learning-personalized-ads-recommendations/) [![Powering AI innovation by acccelerating the next wave of nuclear](https://engineering.fb.com/wp-content/uploads/2024/12/AdobeStock_981369621.webp?w=580&h=326&crop=1)\\
\\
Next\\
\\
Powering AI innovation by acccelerating the next wave of nuclear](https://sustainability.atmeta.com/blog/2024/12/03/accelerating-the-next-wave-of-nuclear-to-power-ai-innovation/)

### Read More in ML Applications

[View All](https://engineering.fb.com/category/ml-applications/)

![](https://engineering.fb.com/wp-content/uploads/2026/08/Domain-Expert-AI-Hero-1.png?w=580&h=326&crop=1)

![](https://engineering.fb.com/wp-content/uploads/2026/05/Meta-Mult-stage-Ads-Ranking.png?w=580&h=326&crop=1)

![](https://engineering.fb.com/wp-content/uploads/2026/07/Training-GEM-at-LLM-Scale-Hero.png?w=580&h=326&crop=1)

![](https://engineering.fb.com/wp-content/uploads/2026/07/image3.jpg?w=580&h=326&crop=1)

![](https://engineering.fb.com/wp-content/uploads/2026/06/10-Years-Meta-Python-HERO-large.png?w=580&h=326&crop=1)

![](https://engineering.fb.com/wp-content/uploads/2026/06/Privacy-Aware-Infrastructure-in-the-AI-Native-Era-HERO.png?w=580&h=326&crop=1)

### Available Positions

* * *

- [Software Engineer, Product\\
\\
\\
SUNNYVALE, US](https://www.metacareers.com/jobs/9657291271065759/)
- [Software Engineer, Product\\
\\
\\
LOS ANGELES, US](https://www.metacareers.com/jobs/9657291271065759/)
- [Software Engineer, Product\\
\\
\\
REMOTE, US](https://www.metacareers.com/jobs/9657291271065759/)
- [Software Engineer, Product\\
\\
\\
BELLEVUE, US](https://www.metacareers.com/jobs/9657291271065759/)
- [Software Engineer, Product\\
\\
\\
REDMOND, US](https://www.metacareers.com/jobs/9657291271065759/)

[See All Jobs](https://www.metacareers.com/)

### Technology at Meta

- ![footer-fb-engineering](https://engineering.fb.com/wp-content/themes/code-fb-com/img/meta_logo.png)



Engineering at Meta - X



Follow


- ![footer-AI](https://engineering.fb.com/wp-content/themes/code-fb-com/img/meta_logo.png)



AI at Meta


[Read](https://ai.meta.com/blog/)

- ![footer-developers](https://engineering.fb.com/wp-content/themes/code-fb-com/img/meta_logo.png)



Meta Quest Blog


[Read](https://www.meta.com/blog/quest/)

- ![footer-developers](https://engineering.fb.com/wp-content/themes/code-fb-com/img/meta_logo.png)



Meta for Developers


[Read](https://developers.facebook.com/)

- ![footer-bug-bounty](https://engineering.fb.com/wp-content/themes/code-fb-com/img/meta_logo.png)



Meta Bug Bounty


[Learn more](https://bugbounty.meta.com/)

- ![footer-rss](https://engineering.fb.com/wp-content/themes/code-fb-com/img/rss.png)



RSS


[Subscribe](https://code.facebook.com/posts/rss/)


### Open Source

Meta believes in building community through open source technology. Explore our latest projects in Artificial Intelligence, Data Infrastructure, Development Tools, Front End, Languages, Platforms, Security, Virtual Reality, and more.

- ![android](https://engineering.fb.com/wp-content/themes/code-fb-com/img/android.png)

ANDROID


- ![ios](https://engineering.fb.com/wp-content/themes/code-fb-com/img/ios.png)

iOS


- ![web](https://engineering.fb.com/wp-content/themes/code-fb-com/img/web.png)

WEB


- ![backend](https://engineering.fb.com/wp-content/themes/code-fb-com/img/backend.png)

BACKEND


- ![hardware](https://engineering.fb.com/wp-content/themes/code-fb-com/img/hardware.png)

HARDWARE



Learn More

To help personalize content, tailor and measure ads and provide a safer experience, we use cookies. By clicking or navigating the site, you agree to allow our collection of information on and off Facebook through cookies. Learn more, including about available controls: [Cookie Policy](https://engineering.fb.com/privacy)

Accept
