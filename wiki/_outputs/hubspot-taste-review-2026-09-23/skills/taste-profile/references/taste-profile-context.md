# Taste Profile — Loop Marketing Book Context

## What a Taste Profile Is

A Taste Profile is a document that encodes the marketer's taste and customer knowledge into something AI can actually use. Without it, AI generates for everyone — which means it generates for no one.

It has two parts:
- **Customer Taste** — A living picture of exactly who you're trying to reach and what moves them
- **Brand Taste** — A picture of who your company is and what you stand for

Both parts go into one master document and live inside a dedicated AI workspace (Claude Project, ChatGPT Project, Gemini Gem). The AI needs both halves simultaneously — not in separate sessions, not in fragments.

---

## Workspace Setup (tell users to do this first)

Before running any prompts:

1. Create the Taste Profile Master Document — a Google Doc, Notion page, or Word file titled **TASTE PROFILE — [COMPANY NAME]** with two sections: Customer Taste and Brand Taste. Every final output gets pasted in here.

2. Set up the AI workspace:
   - **Claude** → new Project, add doc to the knowledge base
   - **ChatGPT** → new Project, upload the doc
   - **Gemini** → new Gem, paste full text into instructions
   - **Other tools** → paste the complete doc at the start of each session

3. Update the Taste Profile when:
   - Significant new customer data arrives
   - Product positioning changes materially
   - The Buyer Sim gives feedback that doesn't match the real world
   - Quarterly, as a standing practice

---

## Part 1: Customer Taste

### What Customer Taste Is (vs. an ICP)

| ICP | Customer Taste |
|-----|----------------|
| Who to target | How to talk to them |
| Firmographics | Real conversations and behavior |
| Created once, rarely updated | Evolves as new data flows in |
| Lives in CRM or a deck | Lives in the AI workspace |

An ICP says: "VP of Marketing at B2B SaaS, 200-1,000 employees." Customer Taste says: "This buyer is exhausted by tools that promise 'AI-powered' everything. She's been burned twice by platforms that required six months of onboarding. When she sees a case study, she skips to the numbers. The phrase that earns her trust: 'Here's exactly what broke and how we fixed it.'"

### Phase 1: Gather Customer Context

**Two signal types:**

**Prompt 1a: Internal Signals** (optional — use if they have call transcripts, customer interviews, support conversations, or sales notes)

```
Analyze this customer data with a focus on how these people consume and respond to content and marketing — not just how they buy.

Identify:
1. The emotional state they're in when they encounter content about our category — skeptical, excited, frustrated, overwhelmed?
2. The exact language and phrases they use when describing their problem — word for word.
3. The types of content, stories, or proof that visibly shift their thinking.
4. What triggers immediate distrust or disengagement — specific phrases, formats, or claims.
5. The specific situations or scenarios they reference repeatedly that signal their day-to-day reality.

Summarize into concrete observations. Use their actual words wherever possible — I need their vocabulary, not a summary of it.
```

**Prompt 1b: External Signals** (for everyone — works even with no internal data)

```
Research how [YOUR TARGET CUSTOMER — role, industry, company size] actually consumes content and responds to marketing.

Using review sites, Reddit, LinkedIn, industry forums, and competitor content, find:
1. Their default emotional state when they encounter content in our category — are they hopeful, burned out, skeptical, overwhelmed?
2. The specific language patterns they use — the phrases that come up repeatedly, the vocabulary that marks an insider vs. an outsider.
3. What content they visibly respond to — what gets comments, shares, saves from this audience.
4. What triggers immediate dismissal — the claims, formats, or tones that make this audience disengage or call out as hype.
5. The recurring situations and scenarios they reference — the specific frustrations and moments that define their working reality.

Prioritize direct quotes over summaries. I need their actual words.
```

### Phase 2: The Six Components of Customer Taste

Run this prompt using the Phase 1 outputs:

```
Using the research I've provided, build my Customer Taste profile with these six sections:

1. EMOTIONAL REGISTER: Their default emotional state when consuming content in our category — what they're feeling before we've said a word, and what emotional journey works with that starting point.
2. LANGUAGE: The exact vocabulary they use to describe their problem. Phrases that signal insider knowledge. Words and terms that mark an outsider. The specific language patterns I should use and avoid.
3. CONTENT TRIGGERS: The specific types of stories, proof, and formats that make this audience stop and engage. Include examples of what that looks like in practice.
4. ANTI-TRIGGERS: The specific claims, tones, formats, and phrases that trigger immediate distrust or disengagement. Be specific, not generic.
5. SITUATIONAL FRAMINGS: 3–5 specific scenarios from their working reality that I can use as opening hooks. Write this as if they are describing a Tuesday afternoon they've actually lived.
6. TRUSTED VOICES: Who has credibility with this audience and why — the characteristics of a voice they trust, not just names.

Write each section as a direct brief to a content creator. Use the actual language from the research provided — I need their vocabulary, not a summary of it.

My research: [PASTE OR UPLOAD PHASE 1 OUTPUTS]
```

**What each component does:**
- **Emotional Register** — sets the tone of everything. Get it wrong and technically perfect content lands wrong every time.
- **Language** — most immediately actionable. Changes what they write tomorrow.
- **Content Triggers** — types of story, proof, format that make this customer stop and engage.
- **Anti-Triggers** — arguably more valuable than triggers. Three or four things that kill trust before the first paragraph.
- **Situational Framings** — recurring realities that shape how buyers evaluate information. When marketing speaks from inside these situations, it reads as *understanding*, not *marketing*.
- **Trusted Voices** — not followers counts, but the type of voice that has credibility. Shapes distribution strategy and content tone.

**Sample output (fictionalized B2B SaaS) — use as a quality benchmark:**
- *Emotional Register:* "Our buyer arrives skeptical and fatigued. She's evaluated three platforms in the last eighteen months and been burned by at least one. Her default posture is 'prove it.' The emotional journey that works: 'We know you've been here before' → specific proof → 'here's what's actually different.'"
- *Language:* "Insider: 'time to value,' 'does it play nice with Salesforce,' 'I don't have six months for onboarding.' Outsider: 'revolutionary,' 'paradigm shift.' She says 'tool' not 'platform.'"
- *Anti-Triggers:* "Gated content requiring a phone number. 'AI-powered' claims without specific outcomes. Testimonials that read like marketing wrote them."

Push back if the Emotional Register doesn't immediately feel like it was written by someone who understands this customer. Ask for more specificity or feed in more Phase 1 data.

---

## Part 2: Brand Taste

### What Brand Taste Is

Four foundational stories that tell AI who the company is, what it believes, and why anyone should listen. These go alongside Customer Taste in the same Taste Profile — together they give AI the context to understand the audience and the point of view to speak in the brand's voice.

Most companies tell these stories accidentally and inconsistently. The Taste Profile makes them deliberate.

### The Four Stories

**Story 1: Brand Story — The Problem You Solve**

Not about features or pricing. About the emotional stakes of the problem. The customer is the hero. The brand is the guide. 

Formula: Define the problem → evoke emotional response → promise transformation.

Build it by answering:
1. What problem were we founded to solve, and why does it actually matter?
2. When we talk about our customers' struggle, what gets us genuinely animated?
3. When a customer succeeds with us, what changes in their life beyond the immediate functional benefit?
4. What do we believe about our industry that most people in it would push back on?

Prompt:
```
Using the answers I've provided below, write my brand story in 150–200 words. It should:
- Open with the problem we exist to solve, framed emotionally not functionally.
- Make clear why this problem matters beyond the immediate inconvenience.
- End with a single declarative sentence that captures our conviction.

Avoid corporate language. Write it as if a founder is telling it to someone they've just met at a conference.

My answers: [PASTE YOUR ANSWERS]
```

If it reads like a mission statement, push harder. If it could have been written by any company, it's not done.

**Story 2: Product Story — Why Your Solution Wins**

Moves from 30,000-foot brand story down to ground level. Gets specific about the approach and why it differs from alternatives.

Key questions:
1. What's the single most important decision we made in building this product, and why?
2. What did we consciously choose NOT to do that competitors have done?
3. What customer insight sits at the heart of our product?
4. If we had to bet everything on one reason customers choose us, what would that one reason be?

Prompt:
```
Using the answers I've provided below, write my product story in 150–200 words. It should:
- Start where the brand story ends: the problem exists, now here's how we solved it.
- Focus on our approach and philosophy, not just our features.
- Make clear what we chose NOT to do and why that matters.
- End with the specific reason a customer would choose us over every alternative.

My answers: [PASTE YOUR ANSWERS]
```

**Story 3: Thought Leadership Story — Your Unique Credibility**

Not credentials — conviction. Built on a belief that most people in the industry would quietly disagree with. If you can't trace the belief back to something that actually happened, it's not thought leadership.

Key questions:
1. What do we believe about our market or category that most competitors wouldn't say out loud?
2. What have we learned — through hard experience — that we couldn't have learned any other way?
3. What is the conventional wisdom in our space that we think is wrong?
4. If we wrote a book about our category, what would the central argument be?

Prompt:
```
Using the answers I've provided, write my Thought Leadership Story in 100–150 words. It should:
- Establish what we believe that others don't.
- Ground that belief in specific experience, not abstract philosophy.
- Be provocative enough that someone could disagree with it.
- Sound like a person, not a press release.

My answers: [PASTE YOUR ANSWERS]
```

**Story 4: Customer Story — What Others Say About You**

You don't write this story; you surface it. It's the narrative customers tell when you're not in the room.

Prompt:
```
Research what customers actually say about [YOUR COMPANY/PRODUCT] across public sources (G2, Trustpilot, Reddit, LinkedIn, X, and relevant review or forum sites).

Build our Customer Story with four components:
1. CURRENT NARRATIVE: What customers consistently say, using their exact language — not a paraphrase.
2. PERCEPTION GAP: Where the story customers tell differs from the story we tell about ourselves.
3. SIGNAL PHRASES: The specific words and phrases customers reach for when recommending or describing us.
4. THE STORY WE'RE BUILDING TOWARD: One sentence reflecting the customer narrative we want to be true in 12 months — and what's currently missing to get there.

[If you have closed-won sales transcripts, paste them here. They take priority over public sources.]
```

### How the Four Stories Work Together

1. Brand story establishes the emotional foundation — the *why*.
2. Product story builds on it with specific proof you can deliver.
3. Thought leadership story adds credibility — why *you're* the right company for this problem.
4. Customer story provides social proof — others experiencing the transformation.

Remove any one piece and the story as a whole falls apart.

---

## Delivering the Master Document

The complete Taste Profile output structure:

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

Quality check before delivering:
- Every section is specific enough it couldn't describe any other company
- No section is a one-liner
- Both halves complete
- Customer Taste uses the customer's actual vocabulary
- Brand Taste stories feel like a person wrote them, not a committee
