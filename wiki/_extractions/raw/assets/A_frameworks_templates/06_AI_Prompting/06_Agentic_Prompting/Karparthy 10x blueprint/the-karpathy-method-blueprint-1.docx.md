---
type: source-conversion
status: extracted
source: 'raw/assets/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/Karparthy 10x blueprint/The Karpathy Method Blueprint (1).docx'
original_file: 'raw/assets/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/Karparthy 10x blueprint/The Karpathy Method Blueprint (1).docx'
source_layer: raw
source_sha256: 23287fa39e41f3dc5dc60b3c756a245b2844844d1e9bd9bf885a9a0fba0959ae
source_size_bytes: 2972912
source_modified: '2026-06-11T23:16:30'
converter_profile: 2026-07-16.1
created: 2026-07-16
converter: pandoc
preservation: extraction-derivative
---

# The Karpathy Method Blueprint (1)

## Source

- Original file: [raw/assets/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/Karparthy 10x blueprint/The Karpathy Method Blueprint (1).docx](<../../../../../../../../raw/assets/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/Karparthy 10x blueprint/The Karpathy Method Blueprint (1).docx>)
- Original path: `raw/assets/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/Karparthy 10x blueprint/The Karpathy Method Blueprint (1).docx`
- Preservation note: This Markdown file is an extraction derivative for search, linking, and synthesis. Use the original file for layout, images, formulas, comments, speaker notes, or any high-stakes verification.

Conversion note: converted with pandoc (gfm)

---

## Extracted Content
# The Karpathy Method: AI Blueprint for Claude

*“You can outsource your thinking, but you can't outsource your understanding.” – Andrej Karpathy*

This blueprint is designed to shift your AI workflow from simple "prompting" to **Context Engineering**. It treats AI not as a human worker with intrinsic motivation (an "animal"), but as a highly capable contextual engine (a "ghost" or "robot librarian") that relies entirely on the structure, precision, and boundaries you provide.

## Core Mental Models

1.  **Animals vs. Ghosts:** Humans (animals) have intrinsic motivation and will "figure it out" if given a vague goal. AI (ghosts) have no internal compass. Yelling at them or pleading doesn't work. They only act on the exact context and rules provided.

2.  **Context Engineering \> Prompt Engineering:** Stop trying to write the perfect single prompt. Instead, assemble the perfect *environment* and *context* for the AI to operate within.

3.  **Outsource Thinking, Keep Understanding:** AI can write the code or draft the report, but *you* must own the goal, the architecture, and the definition of success.

## Layer 1: The Spec (Bridging Your Context to AI)

*Do not just give tasks (e.g., "Write a report"). Give goals (e.g., "Help me decide if we should launch this feature").*

### 1. Uncover the Real Goal

Force Claude to extract the underlying purpose of your request before it builds anything.

- **The Blueprint Prompt:***"Interview me to find the real goal of this project. Bias toward small, compartmentalized specs. Make me verify key decisions explicitly so nothing is missed."*

### 2. Be Agile, Not Waterfall

Don't ask Claude to build the whole project at once. Break it down.

- **The Loop:** Tight Scope <img src="media/image1.png" style="width:0.21422in;height:0.25317in" /> Clear Checkpoint <img src="media/image1.png" style="width:0.21422in;height:0.25317in" /> Review Output <img src="media/image1.png" style="width:0.21422in;height:0.25317in" /> Adjust & Repeat.

### 3. Be Precise & Explicit

Assume nothing. Every assumption Claude makes is an opportunity for it to drift from your goal.

## Layer 2: The Verifier (The Quality Control Loop)

*AI fumbles when it lacks signal. You must build verification explicitly into the workflow.*

### 1. Set Evaluation Criteria Upfront

Define exactly what "good" looks like *before* the work starts.

- **Bad:** "Make this look good."

- **Good:** "The report must have 3 sections, each ending with an actionable recommendation based on data."

- **The Blueprint Prompt:***"Before you start, define the precise criteria for a great result, use a past example as the format to match, and have a second AI check the final output."*

### 2. Pull External Signal

Ground the AI's output in reality.

- **Coding:** Connect to your deployment system to verify the build actually passed.

- **Writing:** Feed it historical reports as a reference format to match.

### 3. Use an AI Critic

Use a secondary agent or a fresh context window to review the work of the first agent. (e.g., "Run the final output by an expert coding agent to ensure both systems agree.")

## Layer 3: The Environment (Your Workspace)

*Don't start from scratch every time. Build a workspace that compounds and improves.*

### 1. The CLAUDE.md File (The System Brain)

Create a CLAUDE.md (or claude.md) file at the root of your project/repository. Claude reads this automatically upon initialization.

**Include these sections:**

- **How This Repo Works:** High-level project summary.

- **Skill Routing:** When to use which tools or scripts.

- **Knowledge Architecture:** Where to find rules and data.

- **Working Rules:**

  - *"Before building anything multi-step, include a verification plan."*

  - *"Think before coding: state assumptions instead of hiding them."*

  - *"Simplicity first: No abstractions unless required. Write only what is needed."*

  - *"Surgical changes: Clean up only what your changes break. Do not refactor unrelated code."*

### 2. The LLM Knowledge Base (No Vector DB Needed)

Create a local folder system to build your own intellectual data moat.

- /raw/: Immutable source material (PDFs, transcripts, articles, datasets).

- /wiki/ (or /notes/): Claude-generated synthesized markdown files, summaries, and back-linked concepts.

- /frameworks/: Actionable guides and rules you and Claude collaborate on.

- *Workflow:* Drop new info into /raw/, and ask Claude to "compile" it into the /wiki/ directory.

### 3. Build Custom Skills

If you do a task repeatedly (e.g., writing a thumbnail script, analyzing a specific type of dataset), create a dedicated prompt template or script for it. Mention these in your CLAUDE.md.

### 4. Set Hard Guardrails

Categorize actions to prevent the AI from making critical mistakes:

- **Always Do:** Autopilot tasks (e.g., linting, formatting).

- **Ask First:** Actions with consequences (e.g., deleting files, complex architecture changes).

- **Never Do:** Lines that cannot be crossed (e.g., editing production databases, exposing API keys).

- *Pro-tip:* For critical files, use pre-tool hooks or system-level permissions to physically block the AI from editing them, rather than just asking nicely in a prompt.

### 5. The System Audit Prompt

Run this periodically to ensure your environment is robust:

- **The Blueprint Prompt:***"Check my CLAUDE.md, my knowledge base, my skills, and my guardrails. For each of the top 5 gaps, name the file, the problem, and the exact fix - and flag which risky actions need a hook so I can't bypass them."*
