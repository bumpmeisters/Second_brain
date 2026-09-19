![](https://www.youtube.com/watch?v=3UWxMPUko1k)

Get my free 5-day AI playbook (what I used to build a $25M+ startup): https://the-ai-playbook.com/skl  
  
In this video, I break down Anthropic's internal playbook for how their team ACTUALLY use Claude Skills, from their engineers to their marketing team to their legal team. I analyzed every interview, blog post, and doc Anthropic published and turned it into 5 simple lessons anyone can implement today. Most people think Skills are just markdown files. By the end, you'll understand why that's the wrong mental model and how to build a skill system that compounds over time.  
  
Timestamps:  
(0:00) - How Anthropic Employees ACTUALLY Use Claude Skills  
(0:21) - Lesson 1: Understand the Categories  
(3:02) - Lesson 2: Use the Power Components  
(6:55) - Lesson 3: Focus on the Verifier  
(11:21) - Lesson 4: Write the Gotchas  
(13:30) - Lesson 5: Tune the Trigger  
  
What to watch next ⤵️  
\- How Claude Code's creator uses Skills: https://www.youtube.com/watch?v=jdLFeBkiy3M  
\- The only 6 skills you need: https://www.youtube.com/watch?v=AfKoqFwC7Ew  
\- How Anthropic Founders changed how I use Claude Code: https://youtu.be/faPA8odcjpY  
  
\--------  
FOR INDIVIDUALS:  
\- Free 5-day AI playbook (what I used to build a $25M+ startup): https://the-ai-playbook.com/skl  
\- Use BuildPartner to build 10x faster with Claude Code (try free): https://buildpartner.ai/skl  
  
FOR BUSINESSES, Ways to work with me:  
\- Apply for my Executive AI Coaching Program: https://www.theincubator.xyz/apply/skl  
\- Want to build a SaaS product without hiring a CTO? https://www.theincubator.xyz/eng/skl  
\--------  
  
If you're new here, I'm Austin Marchese. How I got here...  
16: First business (SAT Math Tutor)  
22: Graduated Stevens Tech, 4.0, College Basketball, software engineering job at JPM  
23: Bitcoin ATM company + building algorithms for a professional gambler (fun story)  
24: Started creating content, grew 100k+ followers, built first agency, The Incubator  
25: Scaled agency to 15+ team members, $75K/M while working full time  
26: Quit my job, joined a startup called IYK  
27: Became COO of a $25M+ tech startup, worked with Ed Sheeran, Chance the Rapper and more  
28: Built a $20M+ real estate portfolio in the background  
29: Transitioned from IYK, re-launched The Incubator, grew it to a 6-figure biz in 30 days. Now building BuildPartner.ai  
  
To everyone who's spending time learning and putting the work in, cheers. Anyone can make comments from the sidelines but not everyone can build...  
  
\- Austin  
  
Follow/Subscribe  
  
\- Instagram: https://www.instagram.com/austin.marchese/  
\- Youtube: https://www.youtube.com/@austin.marchese

## Transcript

**0:00** · Anthropic, the inventor of Claude, just released their internal playbook on how they use Claude skills. Their engineers, their marketing team, their legal team, they've all streamlined their technical and non-technical workflows with skills.

**0:10** · And after analyzing everything their team has posted from interviews to blog posts to official docs, I've broken down exactly how they use Claude skills into five simple lessons anyone can follow and implement today. Lesson number one is understand the categories. The anthropic team broke skills down into nine categories, which you can see on the screen. Each of these are technical because they are made by the creators of Clawude Code. But the reality is that all nine of these technical categories can be bucketed into four different skill types. And these skill types can apply to both technical and non-technical people. So skill type number one is utility skills.

**0:41** · These are small reusable things that do one specific task and they're often layered with other larger skills. So a technical utility skill, this could be how you interact with specific libraries or APIs. And a non-technical example could be draft response in my voice or simplify writing. Skill type number two is verification skills. These skills check the final output of the product.

**1:03** · Pulled directly from their blog post.

**1:05** · Verification skills have had the most measurable impact on Claude's output quality internally. So these are hyper critical. So we'll dive into them more in a later lesson. But for a technical use case, this could be product verification or code quality review. For a non-technical example, this could be something like brand voice check or style guide review. Skill type number three is data enrichment skills. This pulls external data into your system which will help enhance the final product. A technical use case could pull website performance data or conversion traffic from a website. For me, I do something very similar.

**1:34** · I have a skill called funnel digest which looks across all my websites and analyzes the traffic. A non-technical use case in this example could analyze competitors, pull recent consumer reports, etc.

**1:45** · That's the first three skill types. But the fourth is an orchestration skill.

**1:48** · These are skills that are specifically designed to chain steps and skills together. An example of what an orchestration could look like is let's say there's an orchestration skill called generate report. This would pull website analytics which could be a data enrichment skill. It'll then draft a writeup which could be a utility skill and then it'll verify branding and numbers which could be a verification skill. All of these orchestrated together to create one final report. So one command which stacks all of the other buckets together. Now I'll be going through this more in lesson five because you have to be very careful when you're doing this.

**2:17** · So, those are the four different categories, and this will help you think about what types of skills you can actually create. But as you're creating these skills, you have to avoid this one specific trap. The best skills fit cleanly into one category. The ones that try and do too much straddle several of these categories and confuse the agent. So, you want specific skills that fall into a specific skill type.

**2:35** · With this in mind and taking these four categories, here is a prompt that you can run that looks at your existing skills along with your past chat history to identify potential skills and what bucket they fall into and if any should be adjusted so that they fit clearly in a specific bucket.

**2:51** · Now, that's about how Anthropic thinks about the categories of the different skills that you can create. But once you actually decide the skills that you want to create, there are some key features that you have to include. Lesson number two is use the power components. Before you build any skill, you have to know what a skill is conceptually from Enthropic. A common misconception we hear about skills is that they are just markdown files. But the most interesting part of skills is that they're not just text files. They're folders that can include scripts, assets, data, etc. that the agent can discover, explore, and manipulate.

**3:21** · To summarize, a skill is a folder with a bunch of components inside of it. And you need to understand what these components are so you can optimize these skills. And there are three components that I think are the most important to get right. The first is scripts. So, a script is computer code that runs to complete a task. And from Anthropic, one of the most powerful tools you can give Claude is code.

**3:40** · Giving Claude scripts and libraries lets Claude spend its turns on composition, deciding what to do next, rather than reconstructing boilerplate. By creating a script, you're allowing Claude to focus on new things instead of things it's already figured out. And by creating scripts, you're able to partition deterministic and non-deterministic workflows. A deterministic workflow is where the same input will produce the same output. So 2 + 2 always equals 4. It's something that's repeatable and a script handles this perfectly. A non-deterministic workflow is it could have the same input, but it has different possible outputs.

**4:10** · And this is what you've seen when you're using AI. The more you push into scripts, the more repeatable your output will be, and the fewer tokens you'll burn. So you want to try and have your skills use code to run the deterministic parts and use AI for the non-deterministic parts. Don't worry, I'm going to give you a prompt to help you with all of this at the end of these three points. The second power feature is assets/templates.

**4:30** · Within a clawed skill, you can upload specific files as templates for the output that you want to be created. For example, if your target output is a PowerPoint presentation, you can upload a template of the past report, which will live in your assets folder. Cl will then use this as a starting point to fill in for all future reports. And that way, if you change the template, the skill will automatically change to the final output. Similar to scripts, this is about taking your skill and making it so it stops improvising and starts doing the same thing every single time. The third is setup prompts.

**4:58** · When building skills, unfortunately, you will quickly forget how the skill works. So, it is critical that you make them clear and easy to use. There's a famous saying, "Any fool can write code that a computer can understand. Good programmers write code that humans can understand."

**5:13** · Translating this to the AI world, anyone can write a skill that Claude understands. The best people write skills that humans understand, too. So, how do you do that? Well, there's three things to do when you're setting up your skills. Create a config.json file so that on the first run, if a value is missing, the skill asks for that specific information. Then once you provide it, it'll then be stored so you don't have to provide it in future runs.

**5:33** · It's a way to set up the skill so that it remembers task going forward. The next component is ask user questions.

**5:39** · The next thing you want to do is use ask user question tool. For multiple choice setups, you can tell Claude to use ask user question tool inside the skill.md file. Claude will then present a structured option instead of free form text. It's similar to the interview flow that you may have seen before on Claude, but this is how you enforce it within your skills. Here you can see me using it for one of my skills where it's directly prompting me to answer questions. And it's just a very userfriendly experience. And the last thing that will help these skills be more readable in the future is setting up arguments.

**6:07** · At the top of a skill.md file, you can declare an arguments field. When someone calls a specific skill, this will serve as a reminder to whoever using that skill for what input is needed for it to run properly. And for all these, don't think about yourself today. Think about yourself 1 2 3 years from now. Take your time and build for the future. That's who we want to think about. And if you've been watching this channel, you know that I believe in building sustainable systems that compound over time. I can't stress how important this is.

**6:34** · So, here is a prompt to audit every skill in your project and identify which of these three components they should be using to enhance these skills. So, now you know what's possible inside the folder itself. There's one bucket I touched on earlier that we need to dive deeper on.

**6:50** · And this is the one that Anthropic ranks as the most important bucket in your entire skill categories. Lesson number three is focus on the verifier. From Anthropic, verification skills have had the most measurable impact on Claude's output quality internally. It can be worth having an engineer spend a week just making your verification skills excellent. So clearly verification is important and even the creator of Claude code has said if you give Claude a way to verify it will 2 to 3x the quality of the output. So clearly it's important but most people miss this important fact. There are actually two types of verification you need to understand.

**7:20** · The first is verify for correctness. Did Claude get the facts right? Are the numbers correct? Are is the app running?

**7:28** · Like did it do what it needed to do?

**7:30** · This is the more quantifiable outputs.

**7:32** · But the second is verify for quality.

**7:34** · Does the output actually meet the bar you want? 99% of people think about AI as a multiplier. Higher quantity, same quality. But personally, I found that it's most valuable as an amplifier. The same quantity, but a higher quality. And by treating Claude skills as a quality verification layer, you raise the bar on every output you produce. So both of these verification types are important.

**7:56** · So how can you set them up? Well, right out of the box, Anthropic already has two skills built into Claude code.

**8:01** · /verify, which will run your app and confirm a code change actually does what it's supposed to, and / run launches the app so that Claude can see its own work.

**8:09** · These are both technical examples, and you have them by default, which is nice.

**8:12** · But what if you want to make your own verification skills? The key thing that any good verifier needs is an objective output, and this is something that either you or Claude can tell if the test passed or not. For example, if you have a /code reviewer skill, you want it to say pass or fail. Or if you have a report review skill, you want it to give a grade out of 10. So, you can build these verifiers from scratch, but I prefer doing something different. I prefer altering existing skills so that there's a clear verification component.

**8:38** · I call this skill-driven verification.

**8:40** · For an example, let's say you have a brand voice skill. You could add a verification component to it so that you could run /brandVoice and will tell you if it passes or fails the verification.

**8:50** · You're essentially tweaking existing skills to have an output that's easier to verify. To do this, here are two prompts. The first audits your existing skills to see which ones can be tweaked into a verifier. The second helps you build a verifier from scratch and identifies any external tools you need to pull in data to verify the output.

**9:09** · So, the prompts are on screen to help with verification. And when studying how Anthropic uses skills, there was one example that stands out the most to me about how to verify outputs. Amul Aasar, their head of growth, built a verification skill that simulates feedback from his actual manager. He fed Claude data from her public writing or her Slack conversations. And every week the skill fires and tells him what feedback she would have given him. It's essentially her judgment encoded as a reviewer. Here's him in an interview talking about how he would use a reviewer.

**9:35** · I do that for myself as well. So I basically um you know one of my manager Army Vora was I think a podcast guest of yours, right? So I say hey based on what you know of army both publicly she's written extensively about product and then internally and then our discussions what what is

**9:54** · every based on everything that I've done or not done this week what feedback do you have for me as army and like I get that every week right so like and so by the time he shows the manager anything it's already passed her AI clones quality bar once for me I do something very similar I have a skill called internal focus group and it runs through a group of advisers who will give me specific feedback on what I'm working on as a founder. I don't really have a manager, but these serve as my board of adviserss. Essentially, this has helped me so much that I actually built buildpartner.ai, which has over a thousand users to help people with exactly this.

**10:25** · You can just call /expert advice and will give you feedback from experts on whatever you're working on.

**10:30** · So, at this point, you understand some of the most important lessons to use with skills. But there's one component that I recently learned about that I started implementing in every skill that I make. But before we get to that in lesson four, if this is your first video of mine, welcome to the channel. But if this is your second or more, here is our anti-slab agreement. The visuals, the testing, the hours of research that went into this video. This is entirely built for humans, not for AI clanker robot scrapers. So, all that I ask is that you subscribe as part of this agreement to help this content reach more people.

**10:58** · Also, every video I give away a CloudMax subscription. So, comment below with what you're building to enter. This video's winner is the goat, Matthew Hinman, who's building a Monday morning report generator. Also, I do want to shout out everyone. We recently got to 50K subscribers. Thank you for everyone who watches and supports. I've been making videos for over six years and I just recently started getting traction.

**11:17** · So, I absolutely love seeing you guys in the comments saying how helpful these videos are. Anyway, enough of that. Let's go to lesson four, which is write the gotchas. This is a running list of issues Claude hits when using a specific skill. Think of this like a list of things not to do within a skill MD file.

**11:31** · From a recent blog post, the highest signal content in any skill is the gotcha section. These sections should be built up from common failure points that Claude runs into when using your skill.

**11:41** · On the screen, there are three examples of gotchas that the Claude Code team has in their skills. This is just an example of how when you're using skills, you'll realize some of the issues. So, it's clear what it is, right? It's a list of things not to do, but there is a metapoint that makes this so valuable.

**11:55** · At the end of the day, these are your skills and these skills are living, breathing documents. The reality is you're not going to get it right the first time. So, these edge cases, you just haven't lived through yet. And the more that you use the skill, the more gotchas that you'll add. And just the fact of adding gotchas becomes a forcing function to actually use the skill and test it. Here's them talking about exactly this. Most of our best skills began with a few lines and a single gotcha. Then got better because people kept adding to them as Claude hit new edge cases.

**12:22** · Here's a graphic to show the visualization of what a skill could look like month one, month two, and month three. So if your skill isn't perfect on day one, don't worry about that because these skills should improve over time.

**12:33** · And the gotchas are one of the most effective ways to do that. Think of the skill as the structure, a verifier as the leverage, and the gotchas as your personal moat. And you may be thinking, "Oh, I'll just add a list of all the gotachas to start." Well, it's super important not to try and speed this process up. You should really only include a log of things that you actually saw go wrong. If Claude hasn't done yet, you don't need a gotcha for it yet. Wait, watch, and then add to it.

**12:56** · So, to implement these gotchas into your skills, here is a prompt. And a personal preference of mine, I like formatting the output files of some of these reviews so that I can approve or deny the changes in a single file. So I'll have it create a markdown file formatted for Obsidian that looks like this. Here's a recent gotachas audit I ran.

**13:11** · And I prefer just clicking through and signing off on the specific gotchas that I actually want to implement. The reason being I don't want any gotchas that aren't actually real gotas in this part of the file. So we've learned how anthropic uses skills, how to optimize them, and then configure them with gotchas. But how do you actually call them and how do you make sure that they're being used in your day-to-day?

**13:30** · Lesson number five is tune the trigger. A trigger is what invokes the skill. This is how it's actually ran. Let's say you wanted to be the trigger. When you type /draft email into Claude and then hit send, you're triggering the skill.

**13:41** · But that's manual, right? And we'd rather Claude automatically decide when to run it on its own. Technically speaking, here is how Claude actually decides when to use a skill. When Claude Code starts a session, it builds a list of every available skill with its description. This list is what Claude scans to decide, is there a skill for this request, which means the description field is not a summary. It's a description of when to trigger this skill. When I first read that, I was extremely surprised because it's not what you would normally think it is. The description should describe what triggers it. And a good trigger condition does two things.

**14:11** · It names who it serves and when it should fire. Pulling directly from one of Anthropic's most famous skills, front-end design. Here is the description. Create distinctive production grade front-end interfaces with high design quality. Use a skill when the user asks to build web components, pages, or applications.

**14:26** · Generates creative polish code that avoids generic AI aesthetics. I won't read the whole thing, but the key thing here to notice is use this skill when the user asks to build. And then it lists typical human language that you would expect a person to say. This makes it super easy for Claude to know when to use the skill. So now if I type in create me a web page for this dashboard, Claude will automatically know to trigger the front-end design skill. So when you're creating a skill, be explicit about what it does and think about the actual words you type when invoking it. And then those are the words that Claude needs to see in the description.

**14:57** · So that's how you can get Claude to call a skill. But can skills call other skills? This goes into a skill type I mentioned earlier called orchestration skills. These string multiple skills together. And to make these, it's very simple. From anthropic, you can just reference other skills by name and the model will invoke them if they are installed. But the key with any good orchestration skill is that they should be derived from other skills. If you're building a complex workflow from scratch, ask yourself, can I break this into subutility skills?

**15:23** · Because these utility skills can be leveraged across many orchestration skills so that way you don't have things overlapping reinventing the wheel. And another benefit is if you ever update the utility skill, the orchestration skill that calls it will automatically update as well. This makes the entire system so much more maintainable. So, here is a prompt that will audit your skills and suggest improvements on everything that we covered in this lesson.

**15:44** · At this point, you understand the categories of skills and how to bucket them, the key components to optimize, how to build verifiers, configuring gotas to create your mode, and building out the right triggers. Each of these five lessons have been battle tested by myself as well as the anthropic team. So, make sure you follow everything precisely, and if you have to, go and rewatch the lessons I covered. So, if you like this video, you will love this video where I dive into how the founders of Claw determine what is worth building. It'll give you actionable advice on the things that you should and shouldn't use Claude for. I'll see you over there.