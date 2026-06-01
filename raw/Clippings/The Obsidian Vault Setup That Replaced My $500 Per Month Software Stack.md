---
title: "The Obsidian Vault Setup That Replaced My $500 Per Month Software Stack"
source: "https://x.com/cyrilXBT/status/2060540804230267050"
author:
  - "[[@cyrilXBT]]"
published: 2026-05-30
created: 2026-05-30
description: "I used to pay for 9 different apps to manage my work, my notes, my tasks, and my reading.Notion for docs. Roam for thinking. Evernote for cl..."
tags:
  - "clippings"
---
![Image](https://pbs.twimg.com/media/HJg1eMyXQAgjD2Z?format=jpg&name=large)

I used to pay for 9 different apps to manage my work, my notes, my tasks, and my reading.

Notion for docs. Roam for thinking. Evernote for clipping. Todoist for tasks. Bear for quick notes. Readwise for highlights. Cron for calendar. Craft for writing. Superhuman for email triage.

Every one of them solved a real problem. Every one of them also created a new one.

My information was scattered across 9 different places. Switching between them cost me 20 minutes a day minimum. And every month, $500 left my account for the privilege of feeling productive without actually being productive.

Then I moved everything into Obsidian.

One app. Local files. No subscription. No syncing issues between platforms. No "your account has been downgraded" emails.

That was 18 months ago. I haven't looked back.

This is the exact vault setup I use — the folder structure, the templates, the plugins, the workflows. All of it. Take what works and ignore the rest.

## Why Obsidian Wins Before You Even Open It

Most productivity apps are built on a business model that works against you.

They need you dependent on their servers. They need your data locked in their proprietary format. They need you paying every month. And when they get acquired, shut down, or change their pricing — which they all eventually do — you're stuck.

Obsidian is different at the foundation level.

Your notes are plain markdown files stored locally on your machine. You own them. You can open them in any text editor. You can back them up anywhere. You can switch tools tomorrow and take everything with you. Obsidian is just a lens — a very powerful lens — over files you already own.

That's the first reason it wins.

The second reason: it's built for how knowledge actually works.

Most note apps are built around hierarchy. Files go in folders. Folders go in folders. You navigate by location. The problem is that ideas don't work that way. An idea about writing connects to an idea about psychology which connects to a project you worked on two years ago. Linear folder structures can't capture that.

Obsidian is built around links. You connect ideas the same way your brain does — associatively. The result is a vault that actually reflects how you think instead of fighting it.

The third reason: it's free. Sync is $4/month if you want it. Publish is $8/month if you want it. The core app — which is all you need for everything in this guide — costs nothing.

Let's build.

## The Philosophy Before the Setup

Before you touch a single folder or install a single plugin, you need to decide what your vault is for.

This sounds obvious. It isn't.

Most people build a vault that tries to do everything — and ends up doing nothing well. They create an elaborate system for a version of themselves that doesn't exist. A hyper-organized, always-reflecting, never-in-a-hurry person who has time to tag every note with 7 metadata fields before moving on.

You are not that person. Neither am I.

The vault needs to serve who you actually are: busy, inconsistent, sometimes distracted, but genuinely trying to think better and work smarter.

That means building around three real behaviors:

**Capture fast.** If it takes more than 10 seconds to write something down, you won't. You'll tell yourself you'll remember. You won't.

**Process occasionally.** You don't need to organize every note the second it lands. You need a system that handles the backlog without collapsing under it.

**Surface automatically.** The best ideas aren't the ones you write down. They're the ones you find again three months later when they're suddenly relevant. Your vault needs to make that happen.

Everything in this setup is built around these three behaviors. When you're deciding whether to add something — a folder, a plugin, a template — ask yourself: does this make capturing faster, processing easier, or surfacing more likely? If not, skip it.

## The Folder Structure (4 Folders, Not 40)

Open Obsidian. Create four folders.

00 - Inbox 01 - Notes 02 - Projects 03 - Resources

That's the whole structure. I know you want more. Resist.

Here's the logic behind each one.

**00 - Inbox**

This is where everything lands first. Ideas, tasks, links, quotes, half-formed thoughts, things you need to do later, things someone told you on a call. No organization. No tagging. Just capture.

The inbox exists to eliminate the decision of "where does this go" when you're in the middle of something and don't have time to think about it. You process the inbox later — during your daily review or weekly review. Not now.

One rule for the inbox: never let it get above 50 notes. When it does, you've fallen behind on processing. That's your signal to do a cleanup session before adding anything new.

**01 - Notes**

This is your permanent collection of ideas. Evergreen notes. One idea per note. Named clearly in plain language.

A note earns its place in 01 - Notes when you've processed it from the inbox and decided it's worth keeping as a standalone idea. It's not a raw capture anymore — it's a developed thought with links to other thoughts.

These notes are the core of your vault. Everything else exists to support them.

**02 - Projects**

One subfolder per active project. A project is anything with a defined outcome and a deadline — a piece of content, a client engagement, a product launch, a personal goal with a timeline.

02 - Projects/ └── Q3 Content Calendar/ └── New Website Copy/ └── Course Launch — October/

When a project ends, archive it. Move the folder to a top-level Archive folder with the year. Don't delete it. Future you will want to reference it.

The key discipline: if something is not actively happening right now, it doesn't belong in 02 - Projects. A project that's been sitting untouched for 3 weeks is not a project. It's wishful thinking. Archive it or kill it.

**03 - Resources**

Reference material you'll want to find later but don't actively think about. Book notes. Article summaries. Documentation. Research. Saved recipes for thinking.

The difference between 01 - Notes and 03 - Resources: Notes are your ideas. Resources are other people's ideas that you've captured for future reference.

03 - Resources/ └── Books/ └── Articles/ └── Courses/ └── People/

That's it. Four folders. You might add a fifth after 6 months of using this system and hitting a genuine limitation. But you probably won't.

## The Note Formats That Make Everything Click

A consistent format does two things. It makes writing notes faster because you're not reinventing the structure every time. And it makes reading notes easier because you know where to look for what.

Here are the three formats I use for everything.

**The Evergreen Note (for 01 - Notes)**

\# Note Title \*\*Date:\*\* {{date}} \*\*Tags:\*\* [#topic](https://x.com/search?q=%23topic&src=hashtag_click) \*\*Related:\*\* \[\[Link\]\] · \[\[Link\]\] --- ## The Idea One clear statement. Write it like you're explaining it to yourself in 12 months. ## Why It Matters Why does this idea matter to you right now? What does it change about how you work or think? ## Connections - \[\[Related Note\]\] - \[\[Related Note\]\] - What question does this open up?

The most important field is Related. Every time you write a new note, spend 60 seconds asking: what does this connect to? Then link it. This is how your vault becomes a knowledge graph instead of a pile of documents.

**The Daily Note (your command center)**

\# {{date}} ## Focus - \[ \] Priority 1 - \[ \] Priority 2 - \[ \] Priority 3 ## Captures \*Drop everything here during the day — no organizing\* ## Notes to Process \*What from inbox needs to move somewhere?\* ## End of Day - What actually shipped? - What carries to tomorrow? - One thing worth remembering?

The daily note is not a diary. It's a working surface. You open it in the morning, you close it at night. Everything that happens during the day runs through it. Captures go here first, then move to inbox for later processing.

**The Project Note (for 02 - Projects)**

\# Project Name \*\*Status:\*\* Active / On Hold / Complete \*\*Deadline:\*\* {{date}} \*\*Goal:\*\* One sentence. What does done look like? --- ## Context Why does this project exist? What problem does it solve? ## Tasks - \[ \] Task 1 - \[ \] Task 2 - \[ \] Task 3 ## Notes and Decisions \*Running log of decisions made and why\* ## Links - \[\[Related note\]\] - \[\[Resource\]\]

Every project gets one of these as its home note. Everything related to the project links back to it. When the project ends, this note becomes the single source of truth for what happened and why.

## The 5 Plugins That Do Real Work

Plugins are where Obsidian users lose themselves. There are over 1,000 community plugins. You need 5.

**1\. Templater**

Templater lets you create templates with dynamic content — automatically inserting today's date, the current time, the note title, and custom variables. Without it, you're manually filling in the same metadata fields every time you create a note.

Install: Settings → Community Plugins → Browse → "Templater"

Once installed, create a Templates folder at the root of your vault. Put your note templates in there. Then set Templater to use that folder in its settings.

From then on, creating a new note with a template is one keyboard shortcut.

**2\. Dataview**

Dataview lets you query your vault like a database. Write a simple query and pull up every note with a specific tag, every task that's incomplete, every project created in the last 30 days.

Install: Settings → Community Plugins → Browse → "Dataview"

Here's a query I use in my weekly review note to see all active projects:

table status, deadline from "02 - Projects" where status = "Active" sort deadline asc

You don't need to know how to code to use Dataview. The syntax is simple enough to pick up in an afternoon and the documentation is excellent.

**3\. Tasks**

The Tasks plugin turns Obsidian into a full task manager. You can add due dates, recurrence rules, and priorities to any checkbox in any note. Then you can query all your tasks across the entire vault in one view.

Install: Settings → Community Plugins → Browse → "Tasks"

A task with a due date looks like this:

\- \[ \] Write newsletter draft 📅 2026-06-01

And you can pull every task due this week into your weekly review note with one query:

due before next monday not done

This replaced Todoist for me entirely. My tasks live next to the context they belong to — inside project notes, inside daily notes, inside meeting notes — instead of in a separate app that has no idea what the task is actually about.

**4\. QuickAdd**

QuickAdd lets you capture to specific places in your vault from anywhere, with a single keyboard shortcut. Press the shortcut, type your thought, hit enter. It lands in your inbox without you ever leaving what you were doing.

Install: Settings → Community Plugins → Browse → "QuickAdd"

Set up a "Quick Capture" command that adds to your Inbox with a timestamp. This is the single biggest friction reducer in the whole setup. Once you have it, you'll wonder how you ever captured anything without it.

**5\. Obsidian Git**

Automatic backups to a private GitHub repository. Set it up once, configure it to commit every 30 minutes, and never think about losing a note again.

Install: Settings → Community Plugins → Browse → "Obsidian Git"

This replaced every cloud backup service I was paying for. Your vault is versioned. You can roll back to any previous state. And because your notes are plain markdown files, they're perfectly readable in GitHub's interface if you ever need to access them from somewhere without Obsidian.

## The Workflows That Tie It Together

Structure and plugins mean nothing without consistent workflows. Here are the three that make this system actually function.

**The Daily Workflow**

Morning — open your daily note. Write your three priorities. Nothing else. Don't check email first. Don't open Slack. Three priorities. That's your north star for the day.

During the day — capture everything to your daily note first. Ideas, tasks, things you need to look up, things someone told you. Use QuickAdd for anything that comes up while you're in the middle of something else.

Evening — spend 10 minutes closing the loop. Mark what's done. Move unfinished tasks to tomorrow. Look at what you captured during the day and send anything important to your inbox for processing.

This takes 20 minutes total across the whole day. It keeps the vault alive and useful without requiring you to live inside it.

**The Inbox Processing Session**

Once a day or once every two days, spend 15 minutes processing your inbox.

For each note, make one decision: develop it into a proper note in 01 - Notes, attach it to a project in 02 - Projects, move it to 03 - Resources for future reference, or delete it because it was a passing thought that doesn't need to live anywhere.

The goal is to get the inbox to zero — or at least under 20 notes. If you're processing regularly, this takes 15 minutes. If you let it pile up for two weeks, block an hour.

**The Weekly Review**

Every Sunday. 20 to 30 minutes. This is non-negotiable.

\## Weekly Review ### Clear - \[ \] Process inbox to zero - \[ \] Review and close out daily notes from this week - \[ \] Update project statuses ### Review - \[ \] Open 3 random notes from 01 - Notes Ask: what does this connect to? Is this still true? - \[ \] Check all active projects. Is anything stuck? - \[ \] Review last week's priorities. What actually happened? ### Plan - \[ \] What are the 3 most important outcomes for next week? - \[ \] What projects need attention? - \[ \] What note do I want to develop further?

The "open 3 random notes" step sounds trivial. It isn't. It's the mechanism that makes your vault compound over time. Old ideas surface. Unexpected connections appear. Things you wrote 6 months ago suddenly become relevant to what you're working on now.

This is what separates a vault that gets smarter the longer you use it from one that just gets bigger.

## What This Replaced and What I Saved

Here's the exact software I cancelled after moving to this setup:

**Notion — $16/month.** I used it for project management, docs, and wikis. Obsidian with the Tasks plugin and project notes handles all of it. The only thing Notion does that Obsidian doesn't is collaborative editing. If you work solo, you don't need Notion.

**Roam Research — $15/month.** Roam is brilliant. It's also slow, expensive, and entirely dependent on their servers. Obsidian does everything Roam does for free, locally, faster.

**Evernote — $15/month.** Evernote has been dying slowly for a decade. Obsidian's web clipper extension does everything Evernote's clipper does. Resources folder handles the rest.

**Todoist — $4/month.** Replaced by the Tasks plugin. My tasks now live inside the context they belong to instead of in a disconnected list.

**Bear Notes — $30/year.** Beautiful app. But it's just a notes app without the linking, the graph view, or the plugin ecosystem. Obsidian does everything Bear does and more.

**Readwise — $8/month.** I still think Readwise is excellent. But I stopped paying for it because I found that manually adding highlights to my Resources folder made me engage with them more than having them automatically synced somewhere I'd never look.

**Total cancelled: ~$500/year.** Or ~$42/month. Not quite the $500/month headline but across the full stack of productivity software most builders are running — add in the premium tiers, the add-ons, the "just $2 more per month for this feature" — it adds up faster than you think.

The real saving isn't the money. It's the mental overhead of managing multiple tools, multiple accounts, multiple places where your information lives. Moving into one vault collapsed that overhead entirely.

## The One Thing That Makes or Breaks This System

You can have the perfect folder structure, the best plugins, the most elegant templates. None of it matters without one habit.

The weekly review.

This is the thing most people skip. It's the thing that makes the difference between a vault that compounds and a vault that just grows.

Without a weekly review, notes pile up in your inbox. Projects drift without anyone checking on them. Ideas you wrote down get buried and never surface again. The vault becomes a very sophisticated way to feel like you're doing something while your actual thinking stays shallow.

With a weekly review, your vault becomes a partner. It holds what you can't hold in your head. It makes connections you would have missed. It reminds you of what you said you cared about.

30 minutes per week. That's the whole investment.

Everything else in this guide is infrastructure. The weekly review is the habit that makes the infrastructure pay off.

## Where to Start

If you've read this far and want to set this up today, do it in this order.

First: install Obsidian. Create four folders — Inbox, Notes, Projects, Resources.

Second: install QuickAdd and set up your capture shortcut. This is the highest-leverage first step.

Third: create your daily note template. Use it tomorrow morning.

Fourth: install Templater and set up your evergreen note template.

Fifth: use the system for 30 days before adding anything else. No new plugins. No new folders. Just the basics.

At the end of 30 days, you'll know exactly what's missing because you'll have hit the real limitations of the setup. Add only what you actually need.

The vault that works is not the most complex one. It's the one you actually use.

Start simple. Stay simple. Let it grow only as fast as your needs demand.

Follow [@cyrilXBT](https://x.com/cyrilXBT) for more on AI tools, productivity systems, and the workflows that actually compound.