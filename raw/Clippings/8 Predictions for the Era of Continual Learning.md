---
title: "8 Predictions for the Era of Continual Learning"
source: "https://www.youtube.com/watch?v=iewm45atodE"
published:
created: 2026-08-17
tags:
  - "clipping"
  - "research"
author:
  - "Dwarkesh Patel"
---
# 8 Predictions for the Era of Continual Learning

> Quelle: https://www.youtube.com/watch?v=iewm45atodE
> Veröffentlicht: 
> Geclippt am: 2026-08-17

![](https://www.youtube.com/watch?v=iewm45atodE)

Read the essay here:  
https://www.dwarkesh.com/p/era-of-continual-learning

## Transcript

**0:00** · I've explained elsewhere why I think actual continual learning is needed. I don't think you can have AIs that perform whole jobs as competently as humans if they are forced to just write markdown files from session to session. Just to give an illustrative example, imagine if this is the way that students learn to play the saxophone. You have one student, he's never played the saxophone before. He goes into the music hall, he tries to play it. Of course, this is his first time, so he fails, and he writes down a bunch of notes about what went wrong. And there's a next student who's waiting outside the music hall.

**0:27** · He comes in, he reads all these notes. He's also never played, so of course he messes up, and he continues to add on to these notes. And you have an infinity of students outside the music hall who keep writing notes to the next person. I don't think there's any sequence of text they could write to each other that would allow the subsequent student to just nail the saxophone from the first try. At some point, you actually have to accumulate the relevant experience into your brain. I think the same thing will be true for a lot of skills that we want AIs to actually accumulate from all the different workplaces in which they're deployed.

**0:58** · Okay, so what changes once we have actual continual learning?

**1:01** · One, I think that a lot of proposals that have been put forward about regulating AI assume that you train a model and then you deploy it. And therefore, if you run a bunch of checks on the model before it is deployed, we can make sure that it's not going to aid in cyber attacks or do something crazy. I don't think this assumption necessarily makes sense in the future, and this is one of the many reasons I'm worried about locking in some kind of safety regulatory regime right now — because we don't know what kind of technology we're going to be dealing with even within a year, let alone within five or ten years. What if the model is improving every single day based on the millions of sessions of work it does in that day?

**1:35** · If that happens, we could potentially be locking in an archaic and potentially counterproductive approach to dealing with the threats from AI. To the extent the government wants some way to do safety evaluation on model providers, I think it would make more sense to do monthly or quarterly risk inspections rather than trying to single out some special moment that occurs after training is done but before deployment begins, because that will not be a meaningfully distinct category in the future.

**2:02** · Two, how the labs do technical alignment would probably totally need to change. Right now, a lot of research is focused on the question of how we make sure that a frozen set of weights behaves well during deployment. But I'm not aware of much research on the question of how we make it so that even with constant weight updates, the AI system never falls prey to jailbreaks or changes into a deceptive or evil persona. And if AIs are consolidating learnings between users as well, how do we prevent users from injecting backdoors or some kind of malicious inclination into the base model? In some sense, this is what the human alignment problem is, right? Humans improve in a self-directed way.

**2:36** · If you have kids — I don't have kids, but I imagine this is what happens — they go out, they learn new things. Sometimes they go crazy. They get one-shotted by crazy ideologies, they take the wrong drug, they become super weird.

**2:52** · But you hope that you've given them enough common sense and basic values that they improve as people in a self-directed way without ending up with some super weird beliefs or misanthropic ideas.

**3:04** · Three, the diversity of AI minds will increase. Right now, there are less than five prominent AI minds, by which I mean the base models which are served to millions or hundreds of millions or billions of users at once. And they're all quite similar to each other, by the way, because they've all been trained on roughly the same data. But if AIs are learning from experience, and that experience is different between not only different AI companies but also between different instances of the same AI model, we could see a lot of diversity come out the other end in this world.

**3:35** · And this would be, I think, a net good outcome. One of the things to worry about in the future is having this monolithic singleton that's quite boring. A world where we have continual learning would hopefully be more interesting than the mode collapse of different models we see in the world right now. Four, when deployment becomes part of training, the returns to being ahead in the AI race accelerate. If you have the best model and more people are using your AI for more complicated and useful work, and as a result they're giving it lots of feedback that it can integrate beyond the session window, then your model will become even smarter.

**4:07** · Five, if the model learns mainly from deployment, then labs will feel a lot of pressure to deploy their smartest models earlier.

**4:16** · Anthropic has reportedly been using Mythos internally since February, but it only shipped the model to the public in June. In the regime with actual continual learning, this kind of thing would just not be possible. You could not keep a four-month gap between internal and external deployment and still be competitive, because a competitor who ships a worse model on release date will have a smarter model based on actual real-world experience.

**4:38** · Six, continual learning will create a clear moat for the leading AI labs that they currently lack.

**4:45** · Many people have been asking, "How will the AI labs actually make money?" I have been asking this. When I had Dario on the podcast, I asked him this question, and he made the analogy to cloud providers. He made the point: look, the cloud providers are offering many undifferentiated services, but they're earning high profit margins nonetheless.

**5:01** · You will have noticed this if you look at Amazon or Google's quarterly earnings — they're doing just fine. But the reason that the cloud margins are so high is that it's really time-consuming and expensive to switch from one cloud to another. Currently, there's nothing stopping me from starting a software repository with Codex, then doing more work on it with Cursor, and then finishing it up with Claude Code. But once we have actual continual learning, and the model you're working with is actually getting better as it interacts with you from session to session, then there are pretty significant switching costs.

**5:29** · If you want to change the AI that you're using, you basically have to fire an employee that has accumulated months of context on your organization, and replace them with a very fresh, very unexperienced new intern that you've got to retrain from scratch. And once you have this kind of lock-in, model providers can demand pretty hefty margins. Sorry. Really emphasis on the fresh intern.

**5:56** · Seven, of course, enterprises will be wise to this kind of dynamic. They will try to avoid this kind of lock-in. But what if the choice is that you either get locked into a model provider or you lose out on this super valuable feature where your model improves for you from session to session?

**6:10** · If real usage ends up being the main way the models improve, then the AI labs may subsidize users and enterprises which allow the model to train on their sessions. This is already happening if you look at the kinds of deals that are offered to new users of coding products. This is very similar to why Google gives away search. And conversely, the labs may say that any enterprise that refuses to let them train on the sessions can't have access to the very best models. With both carrots and sticks, the labs can do a lot to get users to allow AIs to learn from experience.

**6:39** · Now, of course, I'm glossing over the fact that there's a difference between updating one user's set of weights and pooling all these different weight forks back into the main model, and the latter may be more technically challenging. But in due time, this too will be solved.

**6:52** · Eight, AI training already has large economies of scale. You get to amortize all this expensive training across more users, and you see the evidence for this in the fact that the lab revenues are increasing far faster than their compute. But continual learning may also lead to economies of scale in inference for end users, namely from batching. You might have seen my episode with Reiner Pope where we discussed this in detail. But if per-company information require full weight updates rather than living in low-rank adapters, there are huge advantages from batching.

**7:21** · Back-of-the-envelope math suggests that the optimal inference batch size for a sparse model like, say, DeepSeek v3 is more than 2400 concurrent sequences being generated at once.

**7:33** · If you don't do this, then you're underutilizing your compute. And if you want to understand why, again, I highly recommend that episode with Reiner on inference economics.

**7:40** · But anyways, the point here is that a given set of weights is only served efficiently when thousands of sequences are being decoded against it all at once. A large company with lots of employees and agents who are doing lots of different kinds of things can very efficiently serve their weight fork, whereas an individual user who's only running a batch size of one may suffer more than two orders of magnitude worse efficiency on their compute. So the economics of serving personalized weights strongly favor big organizations.

**8:06** · Obviously, plenty more will have changed by the time that continual learning actually works, and the most important changes are probably the ones that are hardest to anticipate in advance. But the ones above seem clear even now.

**8:21** · This was a narration of a blog that I also published on my website. Go check it out at dwarkesh.com. Otherwise, I will see you on the next podcast.