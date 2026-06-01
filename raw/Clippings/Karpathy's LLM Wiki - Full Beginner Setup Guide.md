---
title: "Karpathy's LLM Wiki - Full Beginner Setup Guide"
source: "https://www.youtube.com/watch?v=iXd0t60YmMw&t=111s"
author:
  - "[[Teacher's Tech]]"
published: 2026-04-12
created: 2026-05-28
description: "How to build Karpathy's LLM Wiki. There's a smarter way to use AI with your documents, and it comes from one of the biggest names in the field -- Andrej Karpathy. In this video, I'll show you exactly"
tags:
  - "clippings"
---
There's a problem with the way most of us use  AI right now. And once you see it, you're not  0:04

going to be able to unsee it. When you upload  documents to something like ChatGpt or Notebook LM  0:10

and ask a question, the AI searches through your  files, pulls out some relevant pieces, and gives  0:15

you an answer. That works. But here's the thing.  Ask a similar question tomorrow, and the AI does  0:21

all of that work again from scratch. Nothing  was saved. Nothing was built up. Every single  0:26

question starts from zero. Andre Karpathy, one  of the biggest names in AI, co-founder of OpenAI,  0:31

former AI director at Tesla, recently shared an  idea that fixes this problem. He calls it the LLM  0:37

wiki. And on honestly, once you understand what  it does, the old way of working with documents  0:42

starts to feel broken. In this video, I'm going  to walk you through exactly what the LLM wiki is,  0:48

why it matters, and then we're going to build  one together from scratch, step by step. You  

0:52

don't need to be technical. If you can create  a folder on your computer, you can do this.

## What is RAG and why it falls short

1:00

Hi, I'm Jamie and welcome to Teachers Tech. So,  1:03

let me explain the problem a bit more  clearly because this is important.  1:07

The way most AI tools handle your documents right  now is called RAG, retrieval augmented generation.  1:13

You upload some files, you ask a question,  the AI searches through those files,  1:18

grabs the chunks that seem relevant, and generates  an answer. And that's fine for simple questions,  1:23

but what if your questions require connecting  ideas across five different documents? The AI has  1:28

to find all those pieces and stitch them together  every single time. There's no memory. There's no  1:34

accumulation. Nothing compounds. Think about it  like this. Imagine you're a researcher and you've  1:40

been reading papers on a topic for weeks. With  Rag, every time you ask the AI a question, it's  1:45

like it's never read any of those papers before.  It starts fresh every time. That's the bottleneck.  

## How the LLM Wiki fixes the problem

1:51

Garpathy's idea flips this completely. Instead  of searching raw documents every time you ask a  1:56

question, you have the AI read your documents  once and build a structured wiki out of them.  2:02

A real persistent knowledge base made of interlink  markdown files. So when you add a new source,  2:07

say a PDF or an article, the AI doesn't just store  it for later. It actually reads it, extracts the  2:13

key ideas, and integrates them into the wiki. It  updates existing pages. It creates new pages for  2:19

new concepts. It links related ideas together. And  if the new sources contradict something already  2:24

in the wiki, it flags that too. So over time,  the wiki keeps growing and getting richer. The  2:30

connections are already there. The synthesis  is already done. When you ask a question,  2:35

the AI is not starting from scratch. It's actually  working from a pre-built organized knowledge base.  

## Karpathy's analogy -- Obsidian, LLM, and the wiki

2:40

Here's how Kaproy describes it. He says, "Think  of Obsidian as the IDE, the LLM as the programmer,  2:47

and the wiki as the code base. You rarely write  the wiki yourself. The AI does the writing and  2:53

organizing. You focus on what goes in and what  questions to ask. Now, the whole system has three  

## The three layers of the system

2:59

layers and they're very simple. Layer one, your  raw sources. These are your original documents  3:05

like PDFs, articles, meeting notes, whatever  you're working with. The important thing is  3:10

that these are read only. The AI reads them but  never changes them. This is your source of truth.  3:16

Layer two is the wiki itself. This is a folder of  markdown files that the AI creates and maintains.  3:22

It's going to have things like an index page,  concept pages, entity pages, summary comparisons,  3:28

all interlin, all maintained by the AI. Layer  three, the schema. This is basically a rules  3:34

document. It tells the AI how to structure the  wiki, how to handle new sources, how to format  3:40

everything. If you're using Claude Code, this  would be your claw.md file. If you'd followed  3:45

my other Claude Code series, you already know  what that is. If you're new to Claude Code,  3:49

I'll put the link to my beginner's video right up  there. All right, let's get into the setup. Here's  

## Setting up Obsidian and the folder structure

3:54

what we're going to need. First, Obsidian. This  is a free note-taking app that works with plain  3:59

Markdown files. It's going to be our viewer. You  can download it at obsidian.md. I'll put the link  4:04

down below in the description. And don't worry  if you've never used Obsidian before. I'll walk  4:09

you through the parts that matter. Second, an AI  coding agent. I'm going to be using clawed code  4:14

for this because this is what I've been using  in my series and it works really well for this,  4:19

but you could also use OpenAI codeex cursor or  other tools that can read and write files on  4:24

your computer. Now, I just want to point out I'm  using Obsidian because it has the graph view that  4:29

makes the connections really visual, but this is  just a folder of markdown files. You could use  4:33

VS Code or any text editor, whatever you're most  comfortable with. Once you got Obsidian installed,  4:39

just go ahead and open it. And the first thing  what I'm going to do is just go and create a  4:44

new vault. You'll see it right here. And this is  just a fancy name for folder. So, I'm going to go  4:49

create and I'm going to call this one LLM wiki.  And I'm just going to save it somewhere simple.  4:55

I'm just going to put it into my documents here.  You'll see there. And you can put it where you'd  5:00

like. I'm going to go and hit create. Now, we  need to set up a folder structure. I'm going to  5:04

create three folders. The first one's going to be  raw. I'm just clicking right up here, new folder,  5:10

and I'm going to call it raw. The AI will read  from this, but never change anything in here. The  5:16

second folder is going to be wiki. This is where  the AI will build and maintain all of its pages.  5:23

And the third folder is going to be called  templates. This templates folder is optional.  5:29

If you wanted to manually create notes in Obsidian  with a consistent format, you could put a template  5:34

right in here. But since Claude is going to  be creating all of our wiki pages for us,  5:38

we don't need it for this tutorial. It's just here  as a point to tell you about. So here's what our  5:44

structure looks like. We have our wiki templates  and raw. Nothing too complicated with this.  

## Creating the schema file (CLAUDE.md)

5:50

Now, here's the important part. We need to create  the schema file, the rules document that tells  5:54

the AI how to operate the wiki. If you're using  Claude Code, you're going to create a file called  6:00

claude.md in the root of your vault. So, this is  the file that Claude Code reads automatically when  6:06

it opens a project. So, I'm going to give you a  starter template that you can copy. It's linked  6:11

down below in the description, but let me walk  you through what's in it. Now, first of all,  6:15

I'm just going to bring the claw.md file into  the root right here. So, I'm just going to drop  6:20

it so we can have it here. You can see my other  folders are here, but here's the claw.md file. So,  6:26

if I click on it, you're going to be able to see  what's in it. Now, first the purpose right here.  6:31

So, this is the purpose of the wiki. What's  the knowledge base about? So, in our template,  6:36

I've set this to planning a trip to Japan because  this is what we're going to do in the demo today.  6:41

But, uh, you need to when you download this  file, this is the one line you can change to  6:46

match whatever you're going to be building a wiki  about. If you're researching renewable energy,  6:51

change it to that. If you're wanting to  track books that you want to learn from,  6:55

change it to that. Everything else in the template  works as is. The purpose of the line is the only  7:00

thing that you really need to customize to get  started. Second, the folder structure. Where are  7:06

the raw resources? Where's the wiki output?  What goes where? Third, the ingest workflow.  7:12

When you add a new source document, what should  the AI do? The basic steps are read the document,  7:18

extract key concepts, create the update wiki  pages, update the index, and log what changed.  7:24

Fourth, page formatting rules. things like  every page should have a summary at the top.  7:28

Every claim should reference its source. Pages  should link to related concepts. And fifth,  7:35

the question answering behavior. When you ask the  AI a question, it should consult the wiki first,  7:42

cite its sources, and tell you when something is  uncertain. Now, don't overthink this. The template  7:48

I'm giving you gives you a solid starting  point. You can always refine it as you go.  7:52

That's actually part of the process. The schema  evolves as the wiki grows. I'm also going to add  7:58

this Obsidian extension here. It's a web clipper.  So, I'm going to go ahead and add this to Chrome.  

## Installing the Obsidian Web Clipper

8:03

It's free to do and what it's going to do is  convert any web articles into a markdown file. So,  8:08

it's super handy. All right. Now, here comes  the fun part. Let us feed the wiki with its  

## Ingesting your first source document

8:12

first document. Now, I'm going to drop an  article into the RAW folder. And for this demo,  8:17

I'm going to be planning a trip to Japan.  So, I'm going to start with a travel blog  8:21

post about visiting Tokyo. things to do like  neighborhoods to explore, that kind of thing.  8:26

I I'm going to save this as a markdown with  the extension that we just installed. So,  8:31

if I go up top, you can see I have the extension  here and I could go directly to Obsidian or I can  8:38

download it. So, I am going to just or I could  copy paste it over too. I'm going to hit save as.  8:42

Now, I'm going to hop back over to Obsidian here.  So, that's just in my downloads folder right now.  8:49

So, I can see it. I can drag it over. And where  do I want it? I want to put it in my raw. So, if  8:56

I click here, it is now. Here's that article. All  that information right in here into my raw folder.  9:03

And by the way, your sources don't have to be  markdown files. If you have PDFs, just drag them  9:08

straight into the raw folder. Claude Code can  read PDFs natively. Same with text files. Same  9:13

with Markdown. Whatever your format documents are  in, just drop them in and Claude will handle it.  9:19

Now, I want to go and open Claude. But before I  do that, I need to make sure that I'm pointing  9:23

towards where we have this all set up.  So, I'm going to just change my directory  9:28

to this right through here. You can see I put  it in my documents and this is what it's called.  9:34

So, we have our directory changed. Now,  I'm going to go ahead and open up Claude.  9:40

Okay. So, now I'm going to tell it to  ingest the new source. So, I'm just going  9:45

to say I just added a new source to the raw  folder. Please read it and update the wiki.  9:51

And watch what's happening. Claude is reading the  article. It's creating the wiki pages. And there's  9:57

the summary of the article. Here's the pages for  different neighborhoods. Like all through here,  10:03

you can see all the different wiki pages here that  it's planning to create. And if this looks good,  10:09

I'm going to tell it to go ahead. But you  can see how I can adjust the scope as well.  10:12

I'm just going to say go ahead. Okay. You can  see after about 3 minutes, it's all done. But  10:17

let's go check out Obsidian and what's happening  over there. All right, let's open up the wiki.  

## Exploring the wiki and graph view

10:23

See, look at this. We have structured  pages. If we click on any of these here,  10:28

we have links to all of these. And if I go over  to graph view, take a look at this. You can see  10:36

the connections forming. This is one document.  Imagine what this looks like after 20 sources.  

## Adding a second source and watching it update

10:42

Now, this is where it gets really interesting.  Let me add a second source. We're going to do this  10:47

food guide here to Japan. I'm going to do what  I did last time. I'm just going to go ahead and  10:51

make sure that I save it and I'll bring it back  over obsidian. Then I'll tell Claw to ingest it.  10:59

Let's say the exact same thing. I just added new  sources to the raw folder. Please read it and  11:03

update the wiki. Now look at this. So Claude isn't  just creating new pages. It's actually updating  11:10

the neighborhood pages as well that it already  made. And you can kind of look specifically at  11:15

the details how they're making those adjustments  to each of these. This is the wiki doing its job.  11:20

Now look at the graph view now. More nodes, more  connections. The wiki is getting smarter with  11:26

every source we add. Now let me ask a question  that requires information from both sources.  

## Asking cross-source questions

11:31

What neighborhood should I stay at if I want to  be close to the best food and still near the major  11:37

temples? And look at the answer. Claude's not  searching the raw articles. It's pulling from  11:43

the week from the neighborhood pages, the food  pages, the temple page. It's connecting dots  11:47

that were spread across completely different  sources. It's citing specific wiki pages. This  11:52

is completely different from what you get with  basic rag setup. One more thing I want to show  

## Linting your wiki for quality

11:57

you that I think is really clever. Karpathy talks  about this idea of linting your wiki. Just like  12:03

how a code llinter checks your code for problems,  you can periodically ask the AI to edit the whole  12:09

wiki. It will look for things like contradiction  between pages, claims that might be outdated,  12:14

pages that have no links pointing to them or like  orphan pages and concepts that are mentioned but  12:20

don't have any of their own page yet. We can just  say something like this. Please lint the wiki.  12:26

Now Claude's going to go through  everything and give you a report.  12:30

This is how you keep your wiki healthy as it  grows. And look what it gives me back here.  12:37

the different checks from orphan pages to broken  links. This is telling me that it's structurally  12:41

sound, which I expected since we only have two  different articles in this. And it points out the  12:46

biggest gap here is the unested food source, and  even makes the offer to fix the citation issues.  

## Use case ideas for students, teachers, and businesses

12:52

So, what would you actually use this for? Here are  some ideas. If you're a student or a researcher,  12:57

build a wiki as you read papers and articles on  a topic. By the end, you have this structured  13:02

knowledge base, just not a pile of highlighted  PDFs. If you're a teacher, feed in curriculum  13:07

documents, professional development materials  and articles. Build a personal teaching wiki  13:12

that grows over time. If you're a business, feed  in meeting notes, customer call transcripts,  13:18

and project documents. So, this allows new team  members to browse this organized wiki instead of  13:23

digging through Slack history. If you're just a  curious person who reads a lot, use it to track  13:29

what you learn from books, podcasts, and articles.  It's like building your own personal encyclopedia.  13:34

The pattern works anywhere you're accumulating  knowledge over time and you want it organized  13:39

rather than just scattered. Okay, let me be  straight about the limitations because this  

## Limitations to keep in mind

13:43

isn't magic. First, this works best at personal  scale. Karpathy talks about having weeks of around  13:50

100 articles. If you're trying to build something  with tens of thousands of pages, you're going to  13:54

want more infrastructure than just some markdown  files. Second, garbage in, garbage out. The wiki  14:00

is only as good as the sources you feed it.  You still need to curate what goes in. Third,  14:06

you do need a coding agent to make this work.  Obsidian by itself doesn't do any of this. The AI  14:11

is the engine. So, you need to access something  like Claude Code, codeex, or a similar tool.  14:16

And fourth, the AI can make mistakes. It might  miscatategorize something or misconnection. That's  14:22

why the lint feature exists. If you want to review  what it builds, especially earlier on. But with  14:27

all that said, this is genuinely one of the most  practical AI workflows I've seen. It solves real  14:33

problems. It's free to set up and your data stays  on your computer in plain text files that you own.  

## Wrap up and next steps

14:39

And that's the LLM Wiki, a personal knowledge  base that the AI builds and maintains for you  14:44

that actually gets better over time instead  of starting from scratch on every question.  14:49

I'll have the schema template and all the links  you need in the description below. If you want to  14:54

learn Claude Code so you can use it for yourself,  my beginner's guide is down there. Also, thanks  

14:59

for watching this time on Teachers Tech. We'll see  you next week with more tech tips and tutorials.