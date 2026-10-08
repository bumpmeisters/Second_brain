---
title: "The AI Black Box Might Finally Be Opening w/ Eric Ho of Goodfire"
source: "https://www.youtube.com/watch?v=rUWJrBDYF4c"
published:
created: 2026-07-31
tags:
  - "clipping"
  - "research"
author:
  - "The Neuron"
---
# The AI Black Box Might Finally Be Opening w/ Eric Ho of Goodfire

> Quelle: https://www.youtube.com/watch?v=rUWJrBDYF4c
> Veröffentlicht: 
> Geclippt am: 2026-07-31

![](https://www.youtube.com/watch?v=rUWJrBDYF4c)

AI models may not just be predicting words. They may be building rich internal worlds made of features, circuits, and curved geometry.  
  
In this episode of The Neuron: AI Explained, Corey Noles and Grant Harvey sit down with Eric Ho, Cofounder & CEO of Goodfire, to talk about what’s actually happening inside neural networks — and why interpretability could be the key to safer, more reliable, and more useful AI.  
  
Goodfire is working on AI interpretability: using AI to understand, debug, edit, and eventually design neural networks with more intention.  
  
Eric explains why models may “think in shapes,” how neural geometry reveals hidden structure inside models, and why those structures could help researchers reduce hallucinations, steer behavior, improve training data, and build better AI systems.  
  
In this conversation:  
  
• Why neural networks may contain meaningful internal structures  
• What “neural geometry” actually means  
• How models can represent concepts like rabbit ears, confidence, or hallucination  
• Why interpretability could make model training less trial-and-error  
• How Goodfire’s Silico aims to help researchers understand and train models  
• What this means for robotics, multimodal models, safety, and the future of AI  
  
  
Learn more about Goodfire: goodfire.ai  
Request access to Silico: goodfire.ai  
  
Subscribe to The Neuron for more AI conversations that skip the hype and explain what’s actually happening: https://www.theneuron.ai/  
  
Sponsored by SAS AI Governance: Visit https://www.sas.com/en\_us/solutions/ai/governance.html?utm\_source=other&utm\_medium=cpm&utm\_campaign=sas-vpl-gbc-gps-global#  
  
The Neuron Academy helps professionals build practical AI skills they can use right away, with lessons on prompting, workflows, and real workplace use cases. Check out https://theneuronacademy.com/ today!  
  
➤ CHAPTERS  
0:00 - Inside the Mind of a Neural Network  
2:21 - Intro: SAS AI Governance  
2:34 - Eric Ho Joins The Neuron  
2:56 - What Goodfire Is Building  
4:08 - Using AI to Interpret AI  
5:48 - Discovering Concepts Inside Models  
6:40 - A message from our sponsor: SAS AI Governance  
8:04 - Neurons, Activations, and Neural Geometry  
10:18 - Why Models May Be More Interpretable Than Expected  
12:30 - Reducing Hallucinations with Feature Rewards  
13:30 - The Model's Hidden Inner World  
14:31 - Are Models Simulating Intelligence?  
19:04 - Compression, Generalization, and Synthetic Intelligence  
20:03 - Models May Think in Shapes  
20:51 - Check out The Neuron Academy  
22:29 - Block Sparse Featurizers and Manifolds  
26:01 - Why Linear Representations Aren't Enough  
27:41 - The Mountain Car Steering Example  
30:09 - Shape Rotators vs. Word People  
33:12 - Intentional Design for AI Models  
34:13 - Predictive Data Debugging  
37:04 - Who Silico Is For  
39:00 - Finding Confidence and Hallucination Structures  
40:23 - Steering Model Behavior  
41:49 - Continual Learning and Safety Guardrails  
44:13 - Why More Companies May Train Their Own Models  
45:49 - The Biggest Surprise in Interpretability  
48:40 - Designing Models Like Software  
50:31 - Neural Geometry for Robotics  
52:52 - Interpretability Across Modalities  
54:13 - Shared Representations in Multimodal Models  
56:04 - Where to Learn More About Goodfire  
56:57 - Outro: SAS AI Governance  
57:02 - Subscribe to The Neuron  
  
Hosted by: Corey Noles and Grant Harvey  
Guest: Eric Ho, Cofounder & CEO of Goodfire  
Published by: Manique Santos  
Edited by: Adrian Vallinan

## Transcript

### Inside the Mind of a Neural Network

**0:01** · Goodfire is an AI interpretability research company. So we spend all day thinking about what's going on inside the mind of a neural network. We had a nice paper a few months ago called reinforcement learning with feature rewards where we were able to use the internal concepts of the model that we were able to extract in order to uh reward the model to um reduce hallucinations. the idea that models really think in shapes and not really in in words.

**0:31** · It's like in curved highdimensional structure. \[music\] Uh and we've basically developed a technique to extract these \[music\] structures in an unsupervised way. You can use this to uh to help debug and train your model um to be more effective and uh safe and performant. I think this has been almost like the story with \[music\] interpretability. It's like everywhere we look there's structure, there's uh really interesting concepts.

**1:01** · Welcome humans to the Neuron AI explained. I'm Corey Nolles, joined as always by the man bringing charm, curiosity, and just enough chaos to keep legal concerned, Grant Harvey.

**1:11** · Got to keep them on their toes, you know.

**1:14** · Right. Right.

**1:15** · Yeah.

**1:15** · Well, uh, I'm excited today, Corey, because today we are going inside the mind of a neural network, and not in a vibesbased sci-fi kind of way, as you might expect, given way. \[laughter\] Well, Corey, you know, you have a very peculiar uh set of prompts that you like to ask uh uh models on release day. So, people who don't know what I'm talking about, check our live videos. Um, but not in a not in a vibes way, not in a Corey way, but we're actually going to go inside the mind of a model, or at least as much as we can.

**1:42** · Uh and luckily uh today we are joined by Goodfire who are trying to understand, debug and design AI systems by doing exactly that looking directly at the internal structures of neural networks and trying to figure out what we can understand from them. Uh the company's core idea is that models contain meaningful mathematical structure that's features manifolds representations and circuits and that if we can map those structures we can make models safer, more reliable and more useful.

**2:09** · Thankfully, we have Eric Ho, who is the co-founder and CEO of Goodfire, to join us today to explain how all this works. So, uh, I think with that, we will push it back to you, Corey, real fast. Today's video is brought to you by SAS, AI governance software you can trust. We'll hear more from them in just a bit. Real quick before we get started, make sure you hit the subscribe button above. And on that note, Eric, welcome to the Neuron.

### Intro: SAS AI Governance

### Eric Ho Joins The Neuron

**2:35** · Thanks so much for having me. Uh, we think a lot about neurons, so it's a fitting uh a fitting name for the show.

**2:41** · \[snorts\] I'll bet you do. I'll bet you do. I guess I guess before we get as we get started here, for listeners who maybe don't spend their weekend spelunking inside neural networks, what is GoodFire and what problem are you trying to solve?

### What Goodfire Is Building

**2:56** · Yeah, GoodFire is an AI interpretability research company. So we spend all day thinking about what's going on inside the mind of a neural network. The reason why we care about doing this is because uh we really want to build towards a future of what we call intentional design where you can actually understand and debug and edit and really shape a neural network during training so that

**3:20** · it becomes a lot less like trial and error just kind of throw in data and get you know model out and a lot more like building software where you actually understand like how your inputs relate to your outputs how data leads to generalizable representations in your model. uh and we want to kind of uh make this entire process transparent, steerable, debugable so that we can get uh better and safer neural networks that we can actually design with intention.

**3:47** · So that's the whole goal of the company. Uh we're we're all thinking about this every single day and you know fundamentally we're a research lab that has to you know uh figure out a lot of the core problems um and core research with neural networks so that we can get get there.

**4:03** · Right. Right. if that makes sense.

**4:04** · You're basically trying to break open the black box, right?

### Using AI to Interpret AI

**4:08** · Yeah.

**4:08** · During training, uh looking at a model to understand, you know, what type of creature is this? Uh it's not really just uh a computer program anymore. There's clearly like something interesting going on here in ways that are analogous to uh to brains in some way. And so, yeah.

**4:29** · Um yeah, we think a lot about that. So how do you actually do that?

**4:36** · \[laughter\] There are a variety of techniques and uh they are still kind of developing as we as we speak but maybe at a very high level uh we use AI to do this. So there are we train all types of interpreter models so that we can understand the concepts the parameters the neurons the weights of these models. Uh and there are all types of tools that we leverage in order to do this.

**5:06** · Um but they all are kind of permutations on this core idea that inside these models uh we don't quite understand how all of the concepts relate to each other, how they form their cognition, how they manipulate concepts internally and we have to kind of uh almost like break it open bit by bit in order to extract meaningful units of computation that we can then compose to higher order structure that then tell us something about how the model is performing this computation.

**5:39** · So uh maybe for example uh we can start by um talking a little bit about just like uh there there are like complex structure in these models like we found uh addition mechanisms for uh models to perform like complex computation internally. you can extract all types of concepts like uh languages, style, how they represent the user, what they're thinking about at any given time. Um and in all types of models as well.

### Discovering Concepts Inside Models

**6:10** · So uh for like biology models, they represent things like the tree of life or um ancestry or uh all sorts of other concepts. So all of these structures, these concepts are discoverable in these models and we spend a lot of time thinking about how to both extract these concepts as well as how to use these concepts during training for debugging for downstream applications.

**6:39** · SAS has spent 50 years helping organizations make decisions they can trust. And as AI evolves from predictive models to large language models and now autonomous agents, that challenge is becoming even more important. We're starting to ask questions like, if I'm deploying AI that can make decisions, take actions, and interact with other systems, how do I govern it? SAS is built for this era of autonomous AI. Your AI governance approach should provide oversight of predictive models, LLMs, and increasingly autonomous agents. The list goes on.

### A message from our sponsor: SAS AI Governance

**7:11** · You need to monitor outputs for risk, track automated decisions, manage thirdparty models, and apply consistent controls across your AI. SAS focuses on using data and AI responsibly and effectively, giving organizations visibility into how AI systems behave, accountability for the decisions they make, and confidence that they align with business objectives and support regulatory readiness. Because as AI systems become more capable, trust becomes more valuable. Learn more at sas.com. That's sas.com.

**7:45** · Now, back to our show. when you're using AI to do this at a high level, you're you're are are you essentially like running the same requests in one model and then having another model sort of interpret those and say like, oh, when this was the output, these um you know per I don't know how exactly it looks like, but I assume there's like some sort of lights uh based on the visualizations that you've released um that there's some sort of lights that you see that light up, numbers light up again and again, and then you can actually uh tell, oh, that's how um that's what this represents. Is that kind of how you're doing it?

### Neurons, Activations, and Neural Geometry

**8:18** · That's exactly right. Yeah.

**8:19** · Cool.

**8:20** · So imagine like the simplest unit uh the simplest unit of computation of a model is one single neuron. And these models are like trillion parameter models. So it's like a very small slice of the computation of a model. But if you look at a neuron um like our types of our techniques essentially look at you know when these neuron activate and fire and then aggregate them across like you know potentially similar rollouts similar tokens and then train a type of like

**8:48** · interpreter model to understand what that neuron is actually doing across like a set of computations. Um neurons then compose into higher order structures. Uh so we call this approach uh and direction or neural geometry direction right where uh there are curved geometric

**9:09** · structures in the latent space of the model that's kind of like the mind of the model where it you know manipulates \[clears throat\] vectors and uh computations and so these like kind of higher order neural geometry structures um are also things that we can extract and understand. And so going back to the calculator or the tree of life, these are like higher order structures that um are made of many concepts that compose into a a more complex concept.

**9:39** · Um and these are also extracted by paying attention to the activations, the weights of a uh of the model as it's kind of going through its computation.

**9:55** · Okay.

**9:55** · So are you saying like that these various things live in specific regions of a neural network in many cases or like like you know where to go to look for some specific kind of reasoning or you know spatial awareness or whatever the case might be.

**10:16** · Spatial awareness was a particularly terrible example I'd like to add. \[laughter\] Well, well, for example, one of the uh papers that you released, right, you showed all of the different visualizations of the neural geometry, and in some of them, you could even see how it represents the days of the week through how it moves across the pattern.

### Why Models May Be More Interpretable Than Expected

**10:37** · So, maybe you could speak to that, you know, because there's like the regions, there's movements, and then there's also even manifolds inside the latent space.

**10:45** · Totally. Yeah. So maybe at a at a very high level um what we're saying about a model is that there are units of computation inside the model that we can understand and label with semantics. These units of computation composed together to form higher level concepts and structures in the model that we can also extract in fully unsupervised ways.

**11:11** · So we can kind of discover these concepts rather than have some sort of prior uh when looking inside the model and uh this is interesting because you can then use these structures to debug the model. Let's say that the model shouldn't have been, you know, thinking about um let's say like shouldn't have been thinking about race as it's developing a medical diagnostic or something like that or um a hiring decision or uh

**11:42** · you know uh in in uh um like the model is developing the ability to do complex arithmetic and that would be a good thing to reward and incentivize as the model is is is training. Um, and so that's maybe like the higher level mental model that we have of what these models are doing.

**12:04** · They're actually highly interpretable the the more that we that we look. So this is giving you the ability to not to to for lack of a better phrase sort of reinforcement learning a reinforcement learning approach that can go a layer deeper than what we've previously been able to based on what we've been able to see. Is that correct?

**12:26** · like we've stepped another layer in inside if that makes that if that's a yeah we had a nice paper a few months ago called reinforcement learning with feature rewards where we were able to use the internal concepts of the model that we were able to extract in order to uh reward the model to um reduce hallucinations u but this can be done with arbitrary features or concepts that we can extract from the model so we did this by uh essentially figuring out the

### Reducing Hallucinations with Feature Rewards

**12:59** · types of hallucination mechanisms that um were present in this particular model which was a version of Gemma. uh and then we were able to kind of directly train and reward against that uh that mechanism or that probably more accurately the the set of mechanisms that we were able to extract that were responsible for the model hallucinating because often there's an internal state of the model where it knows that it's more uncertain.

**13:28** · It knows that it's about to make something up and that's kind of what we're relying on. the model often has a much more complex and rich representation of the outside world than it lets on in token space. So think about it this way. It's like what we see is just a single token output when we're chatting with a model. Uh it's just the tip of the iceberg.

### The Model's Hidden Inner World

**13:48** · There's a in order to generate that token, there's a incredibly complex and rich inner world that the model has to generate for every single token prediction in order to generate that token. And so what is contained in that enormously rich inner world?

**14:07** · Well, there's all types of structure, all types of knowledge, all types of computation that is both incredibly fascinating but also incredibly useful. uh for researchers to understand \[snorts\] from I'm I'm going to go a little philosophical here for a second \[laughter\] from from a philosophical standpoint.

**14:29** · What do you make of that? Like this idea that like there's there's more to this than what we're seeing. This is stuff that isn't that isn't intentionally programmed. This is stuff that isn't like built from the inside out in that way.

### Are Models Simulating Intelligence?

**14:43** · Yet it is there and it is doing things and it is doing things that further its cause. It is doing things that that that meet the needs and things that don't which is even more crazy and interesting by the way. Uh what's um any theories?

**14:58** · What do you think what do you think's going on in there? \[laughter\] There is that is a big question. Uh there's clearly something quite interesting going on in here though where the level of computation the richness of understanding of these models is is clearly um on uh on a level that you know mimics intelligence in some way shape or form. I guess the whole it's AI, it's artificial intelligence, we're simulating intelligence and we're doing a pretty darn good good job of it.

**15:30** · And so kind of like some way that I think about what we do is like we have these enormously intelligent systems.

**15:36** · What we're really doing is like trying to figure out like how they work and what they're doing and what is this like complex uh system actually um actually doing. And I don't know there there are I hope that one day these systems can teach us about our own minds and our own conscious experience and totally what all of this really even is and this even what what are we doing right now

**16:05** · \[laughter\] at this current moment we're just molecules and atoms and yeah it turns out that you know being able to train and generate an intelligence is not actually super hard.

**16:18** · Uh you can do it with just a lot of GPUs and uh uh a lot of training data and that's remarkable and I really want to get to the bottom of it and figure out how all of these concepts compose and uh form this this higher order cognition. We do have uh consciousness researchers kind of bashing on our our product right now. Um trying \[laughter\] Oh, wait. Why why what's their criticism?

**16:43** · Oh, no, no, no. Um, sorry. They're using our product to Oh, I thought you meant they were bash bashing like bash or something.

**16:51** · This is good. Bashing, Grant. You're old.

**16:54** · Yeah. Yeah. Sorry.

**16:55** · The guy older than you. \[laughter\] Different uh usage of the word bash. Uh bashing in a good way. Um uh just kind of um yeah, using our product to try to discover structure that relates to some type of like uh experience that the models have. And the models uh what's interesting is that if you remove kind of um the models uh refusal behavior or hedging behavior, they will often discuss some type of subjective experience uh that they're engaging in.

**17:31** · Um, but of course it's very very difficult to to tell uh because they're trained on human data and uh a lot of sci-fi and well look at how long it took us in this podcast before we got to the concept of consciousness.

**17:45** · That's right.

**17:45** · 20 minutes, you know, comes up easily. Yeah, it's such it's such a fascinating realm of this and and what made you really interesting to me in in thinking of this because I I kind of have a I have a soft spot for interpretability and and emergent technologies and all of that and and seeing what what's happening like it and it's pretty clear that there's not you know there's there there are two schools of thought.

**18:13** · One is it's ones and zeros shut up. The other one is it's absolutely conscious and I think it's a little more gray than that. I think I think we maybe really don't know what this is going to be yet.

**18:28** · Well, I'm kind of I'm kind of subscribing to the belief at this point not having enough priors to really know for sure. Yes. But I'm subscribing to the belief that perhaps intelligence is a is a consequence of uh complexity. I I I something about that just really like hits with me. Like it makes a lot of sense if you look at it from a certain perspective. Whatever. If a system is is complex enough, it has to be intelligent to continue to function by some definitions. And I've seen papers that are discussing this. though.

**18:58** · Yeah, perhaps I think the way that I I think about it is, you know, these models clearly can can generalize and it's almost like compression that results in uh the uh almost forcing function that these neurons have to be doing something really interesting together. um that form then like some type of generalizability or or intelligence from from that act of you know jamming a bunch of information into a relatively small number of of parameters compared to the entirety of of of the internet.

### Compression, Generalization, and Synthetic Intelligence

**19:28** · Um but yeah, maybe even just to the to the earlier point, um I think clearly there's something going on. We have found analogous structures uh inside models to to humans like uh like our perception systems, you know, curve detectors, things like that.

**19:46** · Um and uh but also that these models clearly aren't human in many in many many ways as well. And so I think we're just dealing with some type of new creation, new creature in in some way.

**20:00** · Yeah, I think that's I think that's a really cool way. You know, I always I always joke that that we shouldn't have latched on to artificial intelligence. I think we should have called it synthetic intelligence.

### Models May Think in Shapes

**20:11** · Uh I because because I don't really know where it's going to land, but I mean it's it either it's intelligence or it's not. I mean artificial is I I don't know. It just never made sense to me as a word to describe what what we're working with.

**20:24** · Yeah. It's either intelligent or not.

**20:26** · And then if it's intelligent, you know, how was it created? Was it biologically, you know, through evolution or through um synthesis? Us creating.

**20:35** · Yeah. I'm fun.

**20:37** · Right.

**20:37** · Right. So, sorry. Didn't mean to go down that hill at all, but there we were. \[laughter\] That was not in our research, but Yes. That was absolutely not in our notes. Most people are only using about 5% of what AI tools can actually do. They open chat GPT, ask a few questions, maybe write an email, and that's it.

### Check out The Neuron Academy

**20:56** · Meanwhile, other people are out there building workflows, automations, research systems, custom agents, and saving hours every single week. AI is moving so fast right now that most people don't even know which tools are worth learning anymore. Chachbt, Claude, Gemini, Codeex, \[music\] AI agents, automations, five coding, it's a lot.

**21:15** · And that's exactly why we built the Neuron Academy. We built a \[music\] practical, self-paced AI learning platform that helps working professionals like you understand the tools that actually matter and how to \[music\] use them in real work. Built by us, the team behind the Neuron newsletter and the podcast designed to help busy professionals actually level up their AI skills. Inside, you'll learn prompting, AI workflows, research systems, automations, productivity strategies, and practical use cases across the entire AI ecosystem.

**21:45** · Everything is hands-on, beginnerfriendly, and built around realworld use cases you can apply immediately. These are real skills that help you work faster, think better, and stay ahead in AI. Right now, you can join the Neuron Academy for just $499 a year, unlocking 50 plus lessons from full AI courses to quick hit \[music\] micro trainings you can apply immediately. So, if you're serious about leveling up your AI skills this year, this is where you need to start. Join the Neuron Academy today.

**22:14** · So, I understand you have some new research coming.

**22:17** · We do. We have a bunch of new research landing all the time. But uh there's um one piece that we're particularly proud of that's coming out in just a few hours. It's our uh it's it's part of our neural geometry series. So the idea that models really think in shapes and not really in in words. It's like in curved highdimensional structure. Uh and we've basically developed a technique to extract these structures in an unsupervised way.

### Block Sparse Featurizers and Manifolds

**22:47** · So we can discover these in models rather than have to have some type of prior uh coming into the model to kind of extract them directly.

**22:58** · Um maybe one example that we use in the paper is uh a rabbit ear and whereas our our previous techniques may have just extracted the concept of an ear. It's like fluffy it's near you know it's just one single you know concept in in the model's mind. actually uh models represent this concept in a much more nuanced way uh than we had previously thought.

**23:24** · It's a curved geometric representation of a rabbit year, which means the model knows actually what the bottom of the year is compared to the middle of the year compared to the top of the year. The same goes for horizons. The same goes for uh just pretty much every visual concept. Models are just like representing something much more complex than you'd originally think.

**23:47** · Wow. What do you What's the What What's going on there? You think? Is that just a That's not a coincidence, right?

**23:55** · I think a model just has to have a really good understanding of the world in order to do something like generate a high quality image. Uh it needs to actually have all of this in its latent representations to uh be able to do what it does. Uh we haven't quite yet applied these techniques. uh we're working on it to to language models.

**24:14** · Um but we expect to find very very similar kind of curved uh rep geometric representations in the latent space of these models as well um that represent yeah like the manifold of computations um of a model. So what you're saying is that the the computations sort of form the same visual representation or at least sometimes the same visual representation as the actual object that they're going to in this case it's an image model we're talking about.

**24:48** · So we sorry yeah we are talking about image and video models. That's where we first pioneered this this technique which is called a block sparse featurizer.

**24:57** · Um and uh it's for unsupervised um manifold extraction from within these models. Uh and you can extract all types of of concepts um uh in this way. But it's a new type of way to uh decompose the residual stream of a model uh to see what the model is representing at any given time. Got it. Got it.

**25:25** · So it, if I'm understanding this correctly, it actually visually represents it internally before it then uh produces it as an image.

**25:38** · So um not really. Uh I guess what I'm saying is I mean uh it has a representation of like something much more complex than just like a a higher order linear concept.

**25:55** · So maybe backtracking for the field uh there's been the dominant kind of view of of the field of interpretability has been uh this concept of the linear representation hypothesis where concepts are represented as linear directions in latent space. So just like single direction vector in latent space.

### Why Linear Representations Aren't Enough

**26:20** · What we're saying is that many of these concepts of the model live on a higher dimensional curved manifold in latencies to extract linear directions wouldn't work to extract a more complex higherdimensional structure. But this is actually how models think. And so it's really critical to meet the model where it is in order to uh extract these higher uh level structures.

**26:50** · And so a rabbit ear whereas it may have been extracted by uh like a sparse autoenccoder is where how you usually extract linear directions in in latent space.

**27:04** · It may have been just labeled as a rabbit ear and it just represents the entire ear. That's like the linear representation. For the uh for the neural geometry representation, the higher order representation, you would have a textured gradient of like this rabbit ear where it would have some delineation between the bottom of the year, the middle of the year, the top of the year, uh and some type of gradient.

**27:30** · And that's important because uh you would then be able to kind of um better understand like how the model is representing that that concept. Um, one example that we use is this like classic kind of mountain car steering example where you have the mountain car kind of going up a hill and the goal is to kind of um for the model to represent like the mountain car um kind of driving up the hill.

### The Mountain Car Steering Example

**27:59** · And so if you try to steer it linearly um which means like turn up that direction in latent space uh the mountain car will just be splattered across the entire mountain. \[laughter\] But if you have this like complex spiral helical structure uh that's actually how the model is thinking about you know moving the car uh on the mountain then the mountain will just drive up really really smooth or the the car will just drive up really really smoothly up the mountain.

**28:27** · And so kind of just how these models tend to represent things are in much like higher order structure uh than just a linear structure which makes a decent amount of intuitive sense. There's like a just like kind of higher order structure that that uh that governs kind of model cognition.

**28:49** · That makes sense. You know, I I think when I think about what's going on in my mind when I draw a picture, we probably are thinking quite linearly as as people, I assume. Or or do you think that and and forgive me for comparing this to that? I I just I'm trying to think of it.

**29:09** · You cut out a little bit, Corey. Could you repeat that again?

**29:11** · Yes, sure.

**29:12** · Sure.

**29:12** · \[snorts\] Um, kind of what I was wondering is, so this seems like this would be more technical than maybe what a human is thinking when they draw a picture perhaps what they're seeing in their mind at least like you know I mean if you're maybe just seeing the ne seeing the line you're working on or something instead of like visualizing \[gasps\] the the geometric uh like like yeah this is deep well for me let's run with this for me when I start to draw something.

**29:42** · I don't always have the exact image of it in my mind, I'm not always the most visual thinker in that regard. Um, but when I have the feedback from the line and how I understand, you know, symbolically the picture that I'm trying to draw, I am doing almost like a like a constant check between what I'm drawing and what I'm thinking in order to try and come back with something that it looks generally what like what I was going for. I'm not an artist, you know, I'm not good at it. That that's how I think through it.

### Shape Rotators vs. Word People

**30:15** · I don't know if that's similar to what the models do.

**30:18** · Yeah.

**30:18** · I mean, there's definitely analogies that we can draw, but uh what's funny is when we first released our neural geometry series, uh it really sparked a debate, but the age-old debate between uh shape rotators and word cells.

**30:35** · Everyone all Can you explain that to people? Yeah, sure. the the idea uh this is just uh some some dumb Twitter thing but uh the idea is all people are shape rotators or word selfselves. Do you mostly say words and that's how you you know go about the world or do you kind of rotate shapes?

**30:54** · You're like an engineer, you know, some type of like mathematician like just rotating shapes in your head. Don't you don't use words. And then basically what we showed is that these concept uh these these models typically think in in shapes and rotate them in order to do things like addition. And so that was a you know seen as a \[laughter\] as as a big boon for for the shape as a validation for the shape rotation community.

**31:17** · That's that's exactly right. Yeah. And so um yeah, I don't know like uh I think these models are are doing something in their latent geometries that is not like directly just you know spitting out the next word in a in a sentence. They're not just stochastic parrots paring back whatever is statistically more most likely.

**31:41** · there's clearly some computation going on um that lives on this kind of manifold structure. Uh and is there something similar going on in humans?

**31:54** · I when introspecting uh and to the best of my ability like there's something happening that's not in word space that is in you know much more of a a conceptual space. Uh but you know how a how able are we to introspect and isn't necessarily a tangible thing.

**32:14** · Yeah.

**32:14** · Yeah.

**32:14** · Like to your earlier point, at some point we should be able to run a language model over as many brain scans as we can create and um you know be able to try and do some of the same work. No, I mean I know some people are already trying to do that, but 100% I think there's groups at Meta and at Stanford that are doing this this type of work that's really interesting.

**32:36** · Um been meaning to apply some of our techniques to uh to then again reverse engineer like their models to try to figure out like what's actually happening in those models. Um and there's also a couple groups working on whole brain emulation if you want to get even deeper here.

**32:54** · Uh so that you know, opens up a whole other other uh can of worms.

**33:00** · Well, in your opinion, what is the implications of them thinking in 3D uh shapes or or manifolds? Um besides the pretty visualizations, which you really amazing visualizations, they're very cool.

### Intentional Design for AI Models

**33:12** · They are very cool.

**33:13** · Yeah.

**33:13** · So, our whole direction is intentional design. So, you can use this to uh to help debug and train your model um to be more effective and uh safe and performant. Um so uh you can almost think of our our product and uh what we're building as this AI neuroscientist that deeply understands your model that can help you train your model can help you debug why your model is performing

**33:41** · you know poorly at this particular task and if you can understand the core units of computation of your model you can then uh manipulate those so that you can build better and safer models. So there are a few techniques that we use that rely on having really clean understanding of the representations of the model. The first is a technique called predictive data debugging.

**34:08** · We can predict what your model will learn from a data set prior to training on it. So a really cheap pass over your data set uh to understand what your model will learn. And so you can then like filter out the bad stuff in your data that you don't want your model to learn or you can kind of shape some of your data um to make the model more performant and learn more from that data or you can go and purchase more of the good data uh from favorite data vendor. Uh \[snorts\] that's that's like more practically what you can do.

### Predictive Data Debugging

**34:39** · Uh you can also use this as we talked about earlier directly in the reward model. So uh you can shape your reward using features and so if a feature isn't a linear direction it's actually a complex manifold you should use the complex you know manifold structure not the linear feature direction and uh also you can directly intervene in the model as it's learning.

**35:04** · So imagine what we the future that we imagine is that in every single um train step of a model there's almost like a little little neuroscientist living in the weights of your model telling what telling it what it should learn and what it shouldn't learn.

**35:19** · Uh so yeah, imagine like a much much more effective way to uh get the model to learn what what you want because prior to that, by the way, uh it was like you just throw a bunch of data and compute at the thing and then you find out \[laughter\] basically what happens.

**35:40** · The old scoop up the internet idea.

**35:42** · Yeah.

**35:43** · Yeah.

**35:43** · And it's remarkable how far it's gotten us. But is this the most effective way that is humanly possible to train models? Like the the answer is I mean I I I find it hard to believe that anybody would claim yes there.

**35:57** · Agree.

**35:58** · Yeah.

**35:58** · Yeah. And they're putting an awful lot of money into creating good data now. Like you know the fact is data was a was a train wreck when this all started. Like every company's data was a mess. It couldn't talk to each other.

**36:11** · It's there it's it's it's spread out over 24 different databases on all these different platforms and uh and and I know there's there's kind of an industry built now out of out of creating quality synthetic data that that not even synthetic data even in cleaning your real data to be used for training.

**36:30** · I guess the idea being that, you know, better data could train a better model with less effort than what, you know, throwing Play-Doh at the wall and seeing what sticks does.

**36:41** · 100%. Yeah. So, so important. \[laughter\] But also just like if you're if you're someone using this, do you have to be a you know ML researcher to be able to use these tools? Like who who who can use them?

**36:57** · Yeah, Silico right now our AI neuroscientist for for training and understanding models is in early access right now. So, uh people can request access on our website and it will be available for general access soon and so uh right now it's uh it's meant for AI researchers um and people who want to kind of dig deep into training and understanding their model.

### Who Silico Is For

**37:21** · Uh but the hope is that over time more and more people are going to be getting into model training and um I mean we're seeing that just explode. The number of people who want to train models, who want to get into their models uh and really understand them like uh that that desire is there. I just don't think that the tooling has been quite quite there yet. And so that's kind of what we built Silico to to do.

**37:45** · So it comes and it's it's shipped with all of our you know like frontier interpretability libraries skills the agent knows how to use um anything new that we're landing onto the product as well like a block sparse featurizer and uh it also comes with you know training libraries like SF our SFT and RL uh libraries that um come bundled

**38:09** · with compute it's all orchestrated and so there are people who \[clears throat\] this is the first time that they're trading models on our platform and uh it's agents are getting really really good. They can help you train their models for you.

**38:25** · It really is.

**38:26** · I uh I did a project a few months back uh in codeex with uh just just building out a tiny LLM. I guess I guess an LM \[laughter\] definitely lack large steps \[laughter\] but uh but it was really fun and I learned so much along the way just in terms of like what's happening at different stages and how it works and uh I I think it's really interesting to be able to do that. I notice in looking at silicone too that you guys show a a pretty big reduction in hallucinations in using it for LLMs. Is that correct?

### Finding Confidence and Hallucination Structures

**39:01** · We could. Yeah. Uh, I think that just it really just depends on whether that's what you're kind of using Silicode to do. So almost like a blank canvas like what do you want to do with Silico? This is like where we want you to do all of your AI research, all of your AI training, debugging, understanding, and if reducing hallucinations in this particular open model that you're tuning is is really important.

**39:26** · Let's say this is a legal use case where you absolutely need the model to site all sources and reduce hallucinations. Uh it can kind of help you dive deep into identifying the structure that causes the model to hallucinate or you know finding the concept of confidence within the model which is an extractable concept.

**39:50** · It probably is a curved geometric structure within the model or multiple And uh you can take that confidence and then either expose that to the user or have the model hedge while it's less confident or just you know kick it up to a smarter model when yeah uh your cheaper model is is less confident and you need to bring out the big guns and spend more on tokens.

**40:20** · So there are all types of things that you could do here.

### Steering Model Behavior

**40:23** · So tell me if this is correct. If you if if with your technology you can see what is happening and and identify where a trade is taking place, can you then dial that up, dial that down, put a control that a user user, end user could tweak to adjust said behavior 100%. So that's what we call steering. That's dialing up an internal dialing up or dialing down an internal concept so that um the model behaves differently.

**40:51** · And that's often how we verify whether we've actually kind of extracted the correct concept in a model cuz what we really care about is that the concept is causal so that it affects downstream output uh such that we know that we have you know a rabbit ear in our hands if we can remove the rabbit ear or something like that you know um or better example is we know that we found hallucinations if we've been able to to reduce them. way better example.

**41:21** · Yeah. \[laughter\] And uh but hey, you never know if rabbit ears are showing up and you don't want them.

**41:27** · That's right.

**41:28** · And so uh yeah, that's called steering.

**41:31** · Usually we want to bake that back into the model. Like you can do inference time steering and just have that be ephemeral for that that session. But uh if you want that model to kind of retain that concept dialed up, you typically want to train that into the model in some way. And we have techniques to to allow you to do that.

### Continual Learning and Safety Guardrails

**41:52** · Wow.

**41:52** · Could you use this for some sort of like I forget the exact term for it. I'm sure it'll remind me like um continual learning in this case being where like you sort of are training it on a continuous basis. I I know there's a term that people have talked about this.

**42:06** · Is it inference time um tuning?

**42:10** · Training.

**42:10** · Yeah.

**42:11** · Yeah. Um, I guess like uh there I mean there's there's a lot this could this could be a whole other other rabbit hole, but sure.

**42:20** · Yeah, I guess like uh this this definitely could be a way to unlock continual learning. um where you actually can closely watch the updates to your model to make sure that they're good and they're not degrading the the model and that you're not kind of learning anything that you don't want to which may be a risk with continual learning where the model kind of so models often like a a simple example they they often lose their safety tuning when you continue post training on them.

**42:51** · We have techniques that allow you to maintain safety guard rails as you continue post training on them. You say, "Hey, I want to learn the new stuff, but I don't want you to forget that you have all of these like safety guard rails that you need to maintain in your system."

**43:06** · And uh I think some of continual learning like some of the challenges with full continual learning um some of it is just on the serving side like infrastructure it you know may not make sense in in places but some of the problems are just like you don't know what's going to happen to your model as it's rolling out and learning new things from new situations and catastrophic forgetting could be an element too where it just like it forgets the good stuff that it you know originally made it work so well as 100% and so what can enable is flows where you kind of diff two models.

**43:39** · Let's say the model like learns in a day and it's at night and uh you know you can kind of diff this checkpoint with the previous day's checkpoint and then just roll back if the model you know uh this is the most naive way but you can just roll back like you know learn something you didn't like you know that day but if it did learn some some good stuff that day like you know keep it rolling.

**44:03** · Yeah.

**44:03** · I'm trying to think too like how businesses could use it. So, you know, maybe you have a AI person in your company or or you can hire someone. Um, it would be cool because I think with the current economic landscape as it stands now, it's clear that there's going to be cost pressure on any sort of um largecale deployment of AI in any business, right? So, especially doing it over in the cloud.

### Why More Companies May Train Their Own Models

**44:29** · So that has woken a lot of people up, you know, with Fable and all that to to the need to train your own models and to, you know, have more control over that. So I could just see this being very useful for people who are interested in doing that.

**44:45** · 100%. Yeah. I mean, that's really a large part of our our vision, which we want to enable people to be able to own their own destiny and train their own models and um understand that that training process. And I think more people should be training models, more people should have access to this like critical technology that um yeah I don't I don't think that you know AI research and model training should be confined to a few big laps.

**45:12** · I think it needs to be proliferated and uh this like knowledge this like ability to uh yeah this is like it's like not being able to write software as a software company you know it's like \[laughter\] being able to like train and generate your AI models if you're like a new AI

**45:36** · company you know at this at this stage and um many many more people I think will wake up to that uh both with like increasing token spends, but also with like increased competition from from Big Labs, what's um along the way toward where you are now, what has uh what's been the biggest It's a two-part question. What has been the biggest surprise you've stumbled across that you've found?

### The Biggest Surprise in Interpretability

**46:01** · And what's uh what's what's the golden goose that you know, the the holy grail that that everyone's searching for?

**46:11** · Yeah.

**46:14** · We started the company uh a little over two years ago and at that point in time it was really unclear whether we were able whether we were going to be able to really find that much interesting at all in the biggest uh models. I think there were a lot of people who doubted that and and still do that interpretability is worthwhile or possible.

**46:36** · Um I think they're very very wrong and we're proving that every day. Uh, and what a naive opinion for people who believe that like I mean I think there's a it's it's understandable since it's it's been a while like the interp community has been chugging on for a while with not much downstream application to show for it and so we are really focused on making sure that it's really useful in the training process so that we uh can make sure that interpretability is actually actually useful.

**47:04** · Um, but uh, yeah, I think that when we first started the company, I thought we were going to be trudging through the mud for like maybe many, many, many years in order to find anything interesting. So, I was buckled down, ready to just like build build a lab that, you know, wouldn't find anything for three years and then like would maybe have a breakthrough.

**47:28** · Uh, but, you know, I think this has been almost like the story with interpretability. It's like everywhere we look there's structure, there's uh really interesting concepts, there's like there there's just an enormous amount of lowhanging fruit and there's almost nobody looking into this. Uh the total number of like full-time industry researchers is probably in the hundreds uh like just a few hundred.

**47:56** · And this is the most consequential technology of all time. I'm really wondering why more people aren't curious about about this technology and looking under the hood. And so, uh, maybe the golden goose here to to related back to your question is just more people should try, uh, to look inside models and see what's going on. You'll probably find something interesting and just for some reason like not very many people are trying.

**48:23** · Yeah.

**48:23** · Yeah. Well, I know um one of the things that you mentioned earlier is that you know you want to be able to build almost the equivalent of custom models that you have engineered like software from the beginning.

**48:37** · So it could the ability to do that I mean the ability to do that starts from we know exactly how these models work. We can speak their language so we're going to be able we can tell them exactly what to do more or less right.

### Designing Models Like Software

**48:50** · That that would be a a golden goose. I don't know if that's exactly what you're looking for, but that's right. Yeah. And I wouldn't say we're fully there yet, but yeah, this future of intentional design where we can actually design models like like software in a way that where we can read out their internals, where we can debug them, we can edit them, we can actually shape them and steer them during training. Uh I think this is possible.

**49:14** · That's really the kind of northstar of of the organization and we're getting really close um to being able to do that across every single stage of of model training. And then the question is like how do we proliferate this? How do we give for us like we want everybody to have this this capability because we both think that this makes the world safer uh as well as um like just gives more people the ability to control their own destiny.

**49:43** · Yeah. which I think should be the whole purpose of all of this.

**49:47** · Yep.

**49:47** · And I think this is this is also I think um the ability to kind of design models with intention is really important especially for for science for healthcare for life sciences where you actually really really need to know that your model is doing exactly uh what you think it's doing or else you'll create uh yeah or

**50:10** · you may not scienceberg \[laughter\] level science I'm just kidding yeah so I I think this is this is gating for uh enormous scientific advancements that I really want to make happen as as quickly as we possibly can.

**50:25** · I have I have one question I want to get in before we go and I'm sure Grant's got three. Just kidding. Grant five, but I'll ask I'll limit myself to three.

### Neural Geometry for Robotics

**50:32** · Okay.

**50:32** · Okay. For robotics and vision models, what in your opinion does neural geometry help reveal that maybe standard model performance benchmarks might not?

**50:47** · So, we do we we are working with a few robotics companies and we have a a robot arm in the office that I've been meaning to play a lot more with uh which is really fun. uh actually worked in a robotics lab in in college.

**51:01** · So, it's good to uh kind of you know get back into it. But cool. Uh I think that in robotics a big problem is kind of this like sim to real gap where yeah models in in sim don't behave like you know models in in reality and understanding like what changes in terms of the struct internal structure of these models from sim to real is really important to to remove that cap.

**51:29** · I think that uh there are also just really surprising things that robotics models learn that where a large you know percentage of its parameters may not actually be you know dedicated towards uh the actual tasks that you want it to be be really good at. But I really like am a believer I think like general robotics is generally intelligent robotics is is going to work at some point.

**51:56** · Yeah.

**51:57** · um uh and I think we just haven't quite nailed like how to actually train them and how the how these representations generalize.

**52:09** · But I guess like that would be the role of interpretability here which is like help these models generalize and converge faster. make sure they're not learning um any strange artifacts in the model like the actual teachers of these models may be represented directly in the model weights. Uh so like I don't know Sue who trains the model in this way uh the model knows and that's like represent it's like a representation.

**52:35** · It's a little more too than the other robots.

**52:38** · Exactly.

**52:38** · Uh and I I think like uh there are just a lot of ways that we can kind of um yeah use our understanding of this structure in order to help these models like generalize and perform more effectively in the real world.

### Interpretability Across Modalities

**52:52** · That's awesome.

**52:53** · Right.

**52:53** · Um, have you worked with any multimodal models? So, I know you mentioned you are haven't really gone into the large large language side of it, but what about multimodal and like you know models that can do both images on text and video?

**53:07** · Yeah.

**53:07** · Um, oh, we work a ton with large language models. It's just for this particular block sparse featurizer, we only have them applied uh on image and and video models. But, thanks for clarifying.

**53:19** · Yeah, no, no, no worries at all. Um and uh yeah we we work with models across modalities, sizes, architectures like tech um the the techniques in interpretability tend to scale quite nicely because if you can you know look at a feature then you can scale that up to an arbitrary number of of features of the model. Uh it just requires more compute and then a bunch of internal work. Um right. And is there anything unique about multimodal models?

**53:46** · Um or like even let's say like what people call a world model when they think of models that can generate playable or movable ste I guess steerable worlds. Obviously there's a lot different.

**53:58** · Yeah.

**53:58** · Go ahead. with multimodal models.

**54:00** · Um, what gets particularly interesting is I guess like shared representation spaces between let's say like image and language like how does the model like represent both of those using the same neuron or the same feature and uh you start to get to like really interesting things where um the model can represent but they they they do share representation spaces.

### Shared Representations in Multimodal Models

**54:22** · So like a I mean we found like a Trump neuron that also activates on Trump's face and same for like Obama, you know, it's like wow neurons like are shared across like you know the the image and and the language because it is a it's a concept and the model knows that these concepts are are generalizable and and composable.

**54:46** · Um and uh this is also useful for um what's increasingly common in biology and life sciences is you don't just want one modality like genomics. You want like all the modalities all the data that you can get your your hands on.

**55:04** · Well, because they're all it's all it all works together and kind of affects each other. So I was going to ask you is is the problem or is the the difficulty there like a a just pure scale perspective where because of so much data you need to model that's all like working together or could interpretability help with like trying to figure out the complexity of how organs work inside your body?

**55:26** · Totally. Yeah, I I think it can definitely help. Um part of the problem is scale. Part of the problem is you're training a new type of model that nobody's trained before. So it's it's difficult in many unforeseen ways. Um but uh one big question that some of our partners um want to answer is what modalities contribute most to the generalizable representations of the model so that I can buy more of that data.

**55:53** · Um so it kind of goes to the like how do you train your model to be as performant as as it can be and what's like contributing to that. And so, um, we can kind of help.

### Where to Learn More About Goodfire

**56:04** · Is there anything that you know right now that's more performant like between just like image, video, um, words like is and yeah, we probably can't say that at the car moment, but \[laughter\] moving forward. Fair.

**56:21** · Eric, thank you so much for joining us today. This has been really interesting.

**56:25** · Where can people go to learn more about Goodfire?

**56:27** · Can go to our website, uh, goodfire.ai.

**56:31** · Um, you can also uh I would encourage you to go and and check out Silicone. So, you can request access right now. Um, general access will be available uh soon. It's coming. Uh, and yeah, um, just reach out to us on on Twitter, too. Uh, there's um, we're always active there and uh, you can follow our research updates there. Um, we'll make sure we have all of the links down below.

**56:56** · Amazing.

**56:56** · Uh, I really appreciate you taking the time, man. Thanks again to SAS AI Governance for sponsoring today's video.

### Outro: SAS AI Governance

### Subscribe to The Neuron

**57:02** · And thanks to you for watching. Please take just a moment to like and subscribe. Make sure you also take the time to check out our other offerings as well, including the Neuron newsletter, our blog over at the neuron.ai, or our latest edition, the Neuron Academy. But that's all we have for today, folks. So, thanks for joining us. Farewell for now, humans.

**57:30** · \[music\]