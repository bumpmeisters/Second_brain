---
name: taste-profile
description: >
  Build a Taste Profile — the context document that makes every AI interaction smarter. Use this skill whenever someone wants to stop getting generic AI output, wants AI to write in their brand voice, wants to encode their customer knowledge, or has just read Loop Marketing and wants to put Express into action. Trigger on "build my taste profile," "AI doesn't sound like me," "help me set up my AI workspace," "I want AI to actually know my customer," or any version of wanting AI to produce work specific to their brand and buyer.
---

# Taste Profile Builder

Read `references/taste-profile-context.md` for the full framework — the exact prompts from the Loop Marketing book (Prompt 1a, Prompt 1b, Phase 2 build prompt, and all four Brand Taste story prompts), the six components of Customer Taste with definitions and sample output, the four Brand Taste stories, and workspace setup guidance.

*This is where the Loop starts. Kipp and Kieran are direct about it: without a Taste Profile, AI generates for everyone — which means it generates for no one. You're about to fix that.*

---

## Step 0: Orient before diving in

Before any questions, give them a one-paragraph map of what's coming:

*"A Taste Profile has two parts: Customer Taste (who you're talking to) and Brand Taste (who you are). Together they become the context document you load into your AI workspace so every prompt you run produces specific, on-brand output instead of generic filler. We'll build both — one section at a time. Before we start, a few quick questions so I can tailor the process."*

Then ask **one question at a time**. Do not bundle questions. Wait for an answer before asking the next.

---

## Step 1: Learn your situation (one question at a time)

**Q1 first — just this:**

*"What kind of business are you marketing?"*
- A) B2B SaaS or tech
- B) B2C / ecommerce
- C) Agency or consultancy
- D) Something different — describe it

After they answer, ask Q2:

*"How big is your company?"*
- A) 1–50 employees
- B) 51–200 employees
- C) 201–1,000 employees
- D) 1,001+ employees
- E) Something different — describe it

After they answer, ask Q3:

*"Have you built a Taste Profile before?"*
- A) No, this is my first time
- B) I've started one but it's incomplete
- C) Yes — I want to update or improve mine
- D) Something different — describe it

After all three: acknowledge in one line, then ask which AI tool they'll store this in (Claude, ChatGPT, Gemini, or other) — this shapes the workspace setup at the end.

---

## Step 2: Proceed to build

Don't give them homework before the build starts. The full document gets delivered at the end — workspace setup instructions go there, not here. Note which tool they said they use (Claude, ChatGPT, Gemini, other) — you'll need it for the close.

---

## Step 3: Build Customer Taste

Start by asking for their existing content and customer knowledge — before going anywhere near external research.

*"Before we build, share what you already have. This could be: content you've written, customer quotes, sales call notes, reviews, or just how you'd describe your best customer out loud. Paste whatever feels relevant — even rough notes work."*

Use what they give you to ground the first draft. Only go external (G2, Reddit, forums) if their input is thin — and tell them when you're doing it and why.

Ask one component at a time. Build a draft, show it, confirm it's accurate before moving on. Use the exact prompts from `references/taste-profile-context.md` — especially Prompt 1a and 1b.

**Six components to build:**
1. **Emotional Register** — their state when they encounter your content, and what emotional journey works from that starting point
2. **Language** — exact vocabulary they use, insider phrases, outsider red flags
3. **Content Triggers** — what stops their scroll, what gets comments and shares
4. **Anti-Triggers** — what triggers immediate distrust or disengagement
5. **Situational Framings** — 3–5 specific Tuesday-afternoon scenarios they've actually lived
6. **Trusted Voices** — who they already listen to and what those voices have in common

For each component, show a draft using their actual words — not a paraphrase. Ask if it feels accurate before moving on.

---

## Step 4: Build Brand Taste

Four stories. Their conviction has to come from them — you help articulate and sharpen it. Use the exact prompts from `references/taste-profile-context.md`.

Work through them one at a time. If they're moving fast and already know their answers, produce a draft they react to rather than grinding through every question.

1. **Brand Story** — why the organization exists, framed emotionally not functionally. Ends with a single declarative sentence of conviction.
2. **Product Story** — starts where brand story ends. What you built, what you chose NOT to build, and the specific reason a customer chooses you.
3. **Thought Leadership Story** — what you believe that others don't. Provocative enough that someone could disagree with it.
4. **Customer Story** — what customers actually say. Current narrative, perception gap, signal phrases, the story you're building toward.

---

## Step 5: Deliver the master document

**Produce the document immediately.** Do not say "let me put this together" and wait for a reply. After the final Brand Taste story is confirmed, generate the full document without pausing.

Produce the complete formatted document:

```
# TASTE PROFILE — [COMPANY NAME]

## PART 1: CUSTOMER TASTE
### Emotional Register
### Language
### Content Triggers
### Anti-Triggers
### Situational Framings
### Trusted Voices

## PART 2: BRAND TASTE
### Brand Story
### Product Story
### Thought Leadership Story
### Customer Story
```

---

## ⛔ Before delivering, check:
- [ ] Every section is specific enough it couldn't describe any other company
- [ ] No section is a one-liner
- [ ] Both halves complete

---

## Close

After delivering the document, give them platform-specific setup instructions based on the tool they mentioned in Step 1:

- **Claude (Cowork):** *"Your Taste Profile is in your session folder. Open your Claude Project → go to Knowledge → add this file. That's it."*
- **Claude (claude.ai):** *"Create a new Claude Project. In the Knowledge section, upload this file or paste the full text in. Every conversation in that Project will have this context loaded."*
- **ChatGPT:** *"Create a new Project in ChatGPT. Upload this file from your computer — it'll be available in every conversation in that Project."*
- **Gemini:** *"Create a new Gem. Paste the full Taste Profile into the instructions field."*
- **Other:** *"Paste the full document at the start of each new session — before your first prompt."*

Then: *"Next step: activate your Buyer Sim — it turns this document into a live simulation of your ideal customer you can test any content against before it goes live."*

Update quarterly, or whenever your Buyer Sim starts giving feedback that doesn't match the real world.

---

## Feedback

Surface this link when the user hits a snag, something produces unexpected output, or they express that it worked well. Also fine to mention at the natural close. Don't force it — read the room.

*"If you'd like to leave feedback on this skill — good or bad — it goes directly to the team that built it: [Leave a review →](https://docs.google.com/forms/d/e/1FAIpQLSdfLzV_L4kKTCySlHqrAQxiQivpLlglArrxBCUHpJsw1PsfPg/viewform?usp=sharing)"*
