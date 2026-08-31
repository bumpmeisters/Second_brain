---
type: source-conversion
status: extracted
source: 'raw/assets/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/B.U.I.L.D._self-improving framework/20260629_BUILD_Self-improving framework by Ausin Machese.docx'
original_file: 'raw/assets/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/B.U.I.L.D._self-improving framework/20260629_BUILD_Self-improving framework by Ausin Machese.docx'
source_layer: raw
source_sha256: a6421463836681902411cae91e04b584896b0767bee5d7a62dd9accb07e56966
source_size_bytes: 49758
source_modified: '2026-06-29T16:36:28'
converter_profile: 2026-07-16.1
created: 2026-07-16
converter: pandoc
preservation: extraction-derivative
---

# 20260629_BUILD_Self-improving framework by Ausin Machese

## Source

- Original file: [raw/assets/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/B.U.I.L.D._self-improving framework/20260629_BUILD_Self-improving framework by Ausin Machese.docx](<../../../../../../../../raw/assets/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/B.U.I.L.D._self-improving framework/20260629_BUILD_Self-improving framework by Ausin Machese.docx>)
- Original path: `raw/assets/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/B.U.I.L.D._self-improving framework/20260629_BUILD_Self-improving framework by Ausin Machese.docx`
- Preservation note: This Markdown file is an extraction derivative for search, linking, and synthesis. Use the original file for layout, images, formulas, comments, speaker notes, or any high-stakes verification.

Conversion note: converted with pandoc (gfm)

---

## Extracted Content
Yes. Here are all the explicit prompts he gives in the video, cleaned up so you can copy‑paste them into Claude or adapt them for your own setup.\[[<u>youtube</u>](https://www.youtube.com/watch?v=2fc0NX9vIJ8)\]

**BASE – project, knowledge base, skills**

**1. LLM knowledge base setup (raw + wiki)**

Use this to have Claude set up the Karpathy‑style knowledge base folders and the claude.md framework file. The video references this as “Here’s a prompt which will help you set this up from scratch or in an existing project.”\[[<u>youtube</u>](https://www.youtube.com/watch?v=2fc0NX9vIJ8)\]

text

You are helping me set up an LLM knowledge base inside my Claude Code project.

Goals:

\- Create a clear folder structure for a knowledge base

\- Separate raw data from curated/wiki references

\- Document the framework in a claude.md file so you always understand how to use it

Do the following step by step:

1\. Scan my current project structure and list any existing folders/files that look like:

\- raw input (call transcripts, notes, exports, documents, etc.)

\- curated or structured documentation (notes, wikis, specs)

2\. Propose a minimal folder structure based on Andrej Karpathy’s “LLM knowledge base” idea:

\- \`raw/\` for any unprocessed source files

\- \`wiki/\` for curated, reference-style files that point into \`raw/\`

\- any additional subfolders you think are useful (but keep this simple)

3\. Create:

\- a short description of what belongs in \`raw/\`

\- a short description of what belongs in \`wiki/\`

\- 3–5 concrete examples of files that should live in each

4\. Generate or update a file called \`claude.md\` in the project root that explains:

\- the knowledge base structure (\`raw\`, \`wiki\`, and any other relevant folders)

\- how you, Claude, should use \`raw\` vs \`wiki\` when answering questions

\- how future skills should read/write data so we keep the structure consistent

5\. Ask me any clarification questions you need before making changes, then apply the changes:

\- create folders if they don’t exist

\- move obvious files into \`raw/\` or \`wiki/\` where appropriate

\- write/update the \`claude.md\` file with the framework and guidelines

When you are done, summarize the final structure and the key rules you will follow when using this knowledge base in future sessions.

**2. Utility skill – “add new resource”**

This is the first skill he sets up with everyone: take a raw file, ingest it into raw/, then create/update wiki entries.\[[<u>youtube</u>](https://www.youtube.com/watch?v=2fc0NX9vIJ8)\]

text

Create a Claude Code skill called \`/add_new_resource\`.

Purpose:

\- Take any new file or resource I provide

\- Ingest it into the \`raw/\` folder

\- Update or create any relevant entries in the \`wiki/\` folder that should reference it

Requirements for the skill:

1\. Inputs:

\- \`resource_path\` or direct content of the resource

\- optional \`tags\` or \`topic\` to help with classification

2\. Behavior:

\- If I give you a file path:

\- Copy or move the file into \`raw/\` with a clear, descriptive filename

\- If I give you text/content directly:

\- Save it as a new markdown or text file in \`raw/\` with a descriptive filename

\- Analyze the content and:

\- Identify the main topics, entities, and potential use cases

\- Decide which existing \`wiki/\` files should reference it

\- If no suitable wiki file exists, create a new one in \`wiki/\`

3\. Wiki updates:

\- For each relevant wiki file:

\- Add a concise bullet or section that:

\- describes the resource

\- links or references the file in \`raw/\`

\- explains when and how this resource should be used

\- Keep wiki entries short, high‑signal, and easy to scan

4\. Logging:

\- Maintain or update a simple change log section in \`claude.md\` or a dedicated \`wiki/changes.md\`:

\- date/time

\- resource ingested

\- wiki entries touched

5\. Safety:

\- Before making large structural changes, briefly summarize what you plan to do and ask for confirmation.

\- Avoid duplicating wiki entries if the link/description already exists.

Return:

\- A summary of what you ingested

\- Which \`wiki/\` files you updated or created

\- Any follow‑up skills or refinements you recommend based on this resource

**3. Combined project setup prompt (knowledge + skills)**

He describes “a single prompt that combines the two” to create the base project, knowledge, and skills.\[[<u>youtube</u>](https://www.youtube.com/watch?v=2fc0NX9vIJ8)\]

text

You are my systems architect AI for a self‑improving Claude Code project.

Objective:

Set up the base framework for my system, including:

\- project structure

\- LLM knowledge base (\`raw\` + \`wiki\`)

\- core utility skills for repetitive tasks

Please:

1\. Inspect my current Claude Code project and summarize:

\- existing folders

\- existing files

\- anything that looks like knowledge, notes, or logs

2\. Design and create a minimal, opinionated structure:

\- \`raw/\` for all source data

\- \`wiki/\` for curated references into \`raw/\`

\- \`process/\` for intermediate processed artifacts (if helpful)

\- any small number of additional folders you think are necessary

3\. Create or update \`claude.md\` to document:

\- the purpose of the project

\- how the knowledge base works

\- how skills should read and write data

\- conventions for filenames, tags, and folders

4\. Define and implement at least these utility skills:

\- \`/add_new_resource\` – ingest new files/content into \`raw/\` and update \`wiki/\`

\- \`/sync_claude_sessions\` – later we will use this for conversation history

\- any other utility skills you think I obviously need based on my existing data

5\. For each skill:

\- Describe its purpose, inputs, outputs, and side effects

\- Implement the skill so it can be reused in orchestration skills

\- Add brief documentation for the skill into \`wiki/skills.md\` or similar

6\. Ask me any clarifying questions you need, then:

\- Apply changes

\- Show me the final project structure

\- List all created skills with one‑sentence descriptions

Optimize for:

\- simplicity over complexity

\- human‑readable structure

\- something I can extend over time without breaking.

**UPLOAD – bulk ingest of existing data**

**4. Analyze Claude session history**

He references “Here’s a prompt that you can run that will analyze your session history for you and provide your project with clear learnings and skill suggestions.”\[[<u>youtube</u>](https://www.youtube.com/watch?v=2fc0NX9vIJ8)\]

text

You have access to my local Claude Code session history file.

Task:

Analyze my historical conversations and extract learnings to improve my self‑improving system.

Steps:

1\. Load and scan the session history:

\- Identify common patterns in what I ask

\- Group conversations by topic, project, or workflow

\- Detect recurring pain points, confusions, and back‑and‑forth loops

2\. Produce:

\- A list of my top 10 recurring workflows or tasks

\- A list of my most common questions or information needs

\- Any habits you notice (e.g., how I debug, how I plan, how I research)

3\. From this analysis:

\- Propose at least 5 specific utility skills I should create

\- For each skill, explain:

\- what problem it solves

\- input/output structure

\- where it should read/write in the project folders

4\. Most important:

\- Suggest ways we can improve my system

\- Prioritize improvements into:

\- quick wins (can be implemented immediately)

\- medium changes

\- bigger architectural changes

5\. Save the results into:

\- \`wiki/session_learnings.md\` (summary + recommended skills)

\- optionally \`process/session_analysis/\` for any detailed artifacts you want to keep

Return a short, actionable summary of:

\- who I am as a user based on the sessions

\- what this system should optimize for

\- the top next steps to make the system better.

**5. Mine local computer + email exports**

He gives explicit wording like “analyze my computer and identify any files you think would be helpful…” and “analyze my writing style and any potential places to use AI…” plus “This prompt will help you ingest these two data sets.”\[[<u>youtube</u>](https://www.youtube.com/watch?v=2fc0NX9vIJ8)\]

text

You are helping me ingest existing data from my personal ecosystem into my Claude Code project.

Data sources:

\- Files on my local computer

\- Email history exports (Google Takeout, Outlook Export, etc.)

Tasks:

1\. Local computer mining:

\- Scan accessible directories for high‑signal files such as:

\- documents, notes, PDFs

\- meeting notes, specs, strategies

\- project documentation, research, brainstorms

\- Identify any files you think would be helpful to ingest into the system.

\- For each candidate file, decide:

\- whether it should go into \`raw/\`

\- whether it needs a curated summary in \`wiki/\`

2\. Email exports:

\- Ingest the email export file(s) I provide.

\- Analyze:

\- my writing style (tone, structure, typical phrases)

\- repeated processes or workflows

\- potential places to use AI that I’m not already using it

3\. For both data sets:

\- Create a plan for ingestion:

\- which files/emails to ingest

\- how to tag and group them

\- Then ingest:

\- store source materials in \`raw/\`

\- create or update \`wiki/\` entries that:

\- summarize key patterns

\- reference important source files

\- document my writing style and workflows

4\. Output artifacts:

\- \`wiki/writing_style.md\` – my writing patterns and style guide

\- \`wiki/workflows_from_email.md\` – recurring processes found in email

\- \`wiki/local_files_index.md\` – index of important local files ingested

5\. Respect privacy:

\- If I tell you to skip certain folders or email categories, do not analyze them.

\- Ask before ingesting anything that looks sensitive.

Finally, summarize:

\- what you ingested

\- the main insights

\- specific suggestions for new skills or automations based on this data.

**6. Life story + project goals recording**

He gives a direct prompt template: “Analyze this recording and interview me to fill in anything I may have missed, and once finalized, add this as training data to my project.”\[[<u>youtube</u>](https://www.youtube.com/watch?v=2fc0NX9vIJ8)\]

text

I will give you a transcript or recording of me talking about:

\- my life story

\- my project goals

\- what I want to accomplish

Tasks:

1\. Analyze this recording and interview me to fill in anything I may have missed.

\- Read or transcribe the recording.

\- Identify gaps, inconsistencies, or missing context.

\- Ask me targeted follow‑up questions to complete the picture.

2\. Once the interview is finalized:

\- Create a structured markdown file in \`raw/\` that contains:

\- my life story

\- my values and preferences

\- current projects and long‑term goals

\- constraints and non‑negotiables

3\. Create or update a curated summary in \`wiki/\` (e.g., \`wiki/user_profile.md\`) that:

\- summarizes the most important information for future AI use

\- explains how this context should influence:

\- recommendations

\- prioritization

\- tone and communication style

4\. Make sure this training data is easy for you (Claude) to consume in future sessions.

\- Add clear headings and sections.

\- Add links to related resources already in \`raw/\` or \`wiki/\`.

Use concise language and focus on what will help the system make better decisions for me.

**7. Single bulk ingest session**

He mentions “Here is a prompt that will run the entire bulk ingest in one session.”\[[<u>youtube</u>](https://www.youtube.com/watch?v=2fc0NX9vIJ8)\]

text

You are orchestrating a single bulk‑ingest session to create my initial data lake for a self‑improving system.

Scope:

\- Claude session history

\- personal computer files

\- email exports

\- life story / project goals recording

Steps:

1\. Briefly audit my project structure and confirm:

\- locations of \`raw/\`, \`wiki/\`, and \`process/\`

\- where you will store analysis artifacts

2\. For each data source:

\- Claude session history:

\- load and analyze it

\- extract workflows, patterns, skill ideas

\- Local computer:

\- scan agreed‑upon folders

\- select high‑signal files

\- Email exports:

\- ingest and analyze

\- derive writing style and recurring workflows

\- Life story recording:

\- analyze, interview me for gaps

\- finalize the narrative

3\. Ingest:

\- store source materials in \`raw/\`

\- create/update \`wiki/\` files that:

\- summarize insights per source

\- link back to the raw files

\- recommend concrete skills or improvements

4\. At the end of the session:

\- Produce a single \`wiki/data_lake_overview.md\` that includes:

\- what was ingested

\- the most important insights

\- prioritized list of skills to build next

\- any risks or TODOs

5\. Throughout:

\- Keep changes atomic and clearly logged.

\- Ask for confirmation before any large destructive move or reorganization.

Run this as a single, coherent ingestion process that leaves my project in a clearly improved, documented state.

**INFLOW – pipelines and sync skills**

**8. Skill – /sync_claude_sessions**

He states: “So, to do this, we’re going to create a skill called sync Claude sessions … Here’s a prompt that will create this sync Claude session skill.”\[[<u>youtube</u>](https://www.youtube.com/watch?v=2fc0NX9vIJ8)\]

text

Create a Claude Code skill called \`/sync_claude_sessions\`.

Purpose:

Continuously ingest my past and new Claude conversation history into the project and process it for learnings.

Skill requirements:

1\. Inputs:

\- optional time window (e.g., since last run, last 7 days, etc.)

\- optional filters (project tags, workspace, etc.)

2\. Behavior:

\- Locate the local Claude session history file(s).

\- Select sessions that match the time window and filters.

\- Copy relevant session data into a \`process/sessions/\` folder as structured files.

\- For each batch:

\- summarize key topics and decisions

\- extract recurring patterns, frustrations, and opportunities

3\. Processing:

\- Append high‑signal insights to \`wiki/session_learnings.md\`.

\- Update or create any skill recommendations in \`wiki/skills.md\`:

\- what new skills are suggested

\- what existing skills should be improved

4\. Logging:

\- Maintain a lightweight log in \`wiki/session_sync_log.md\`:

\- date/time of sync

\- number of sessions processed

\- key insights

5\. Safety and idempotency:

\- Avoid re‑processing the exact same sessions unless explicitly asked.

\- Use simple markers (timestamps, IDs) to track what has already been ingested.

Return:

\- Summary of sessions processed

\- Top 3–5 new insights or recommendations from this sync.

**9. Skill – sync ecosystem data**

He says: “Here is a prompt that will create a sync ecosystem data skill based on whatever you’re trying to connect.”\[[<u>youtube</u>](https://www.youtube.com/watch?v=2fc0NX9vIJ8)\]

text

Create a Claude Code skill called \`/sync_ecosystem_data\`.

Purpose:

Pull new data from my personal ecosystem on a recurring basis and ingest it into the project.

Data sources may include:

\- meeting transcripts (e.g., Grainola via MCP)

\- Slack messages

\- YouTube video transcripts or other content I publish

\- any other external connectors I configure

Skill requirements:

1\. Inputs:

\- list of enabled connectors (e.g., \`meetings\`, \`slack\`, \`youtube\`)

\- optional time window (e.g., since last sync)

2\. Behavior per connector:

\- Meetings:

\- fetch new transcripts

\- store raw transcripts in \`raw/meetings/\`

\- summarize key decisions and lessons into \`wiki/meetings.md\`

\- Slack:

\- pull new messages from selected channels

\- store in \`raw/slack/\`

\- extract important threads or decisions into \`wiki/slack.md\`

\- YouTube:

\- fetch transcripts for new videos I’ve published

\- store in \`raw/youtube/\`

\- summarize main themes and insights into \`wiki/youtube.md\`

3\. General processing:

\- For each new item:

\- tag with date, source, and topic

\- highlight anything that should influence skills or project structure

\- Append relevant insights to:

\- \`wiki/ecosystem_learnings.md\`

4\. Logging:

\- Write a short summary per sync run to \`wiki/ecosystem_sync_log.md\`.

5\. Flexibility:

\- Make it easy to add or remove connectors by editing a single configuration section.

Return:

\- What sources were synced

\- How many new items ingested

\- Any notable insights or suggested system changes.

**10. Skill – sync curated content**

He describes: “The skill that will power all of this is sync curated content … This will pull newsletters from alias inbox, extract the key claims, and process it into our wiki.”\[[<u>youtube</u>](https://www.youtube.com/watch?v=2fc0NX9vIJ8)\]

text

Create a Claude Code skill called \`/sync_curated_content\`.

Purpose:

Ingest high‑signal external content (especially newsletters) into the knowledge base without flooding it.

Scope:

\- newsletter emails from an alias inbox (e.g., \`name+newsletter@gmail.com\`)

\- optionally other curated sources (RSS feeds, blogs, etc.)

Skill requirements:

1\. Inputs:

\- source type(s) to sync (e.g., \`email_newsletters\`, \`rss\`)

\- optional date range

\- optional maximum number of items per run

2\. Behavior:

\- Fetch new curated items since the last sync.

\- For each item:

\- extract title, author, date

\- extract key claims, frameworks, and actionable ideas

\- discard low‑signal or repetitive content where possible

3\. Storage:

\- Save full content or cleaned versions to \`raw/curated/\` with descriptive filenames.

\- Create or update a summary file in \`wiki/curated_content.md\` that:

\- organizes content by topic

\- lists key claims as bullets

\- links back to the raw files

4\. Signal filtering:

\- Be deliberately selective; aim for “less but better.”

\- If a source seems low value, note this so I can unsubscribe or adjust.

5\. Logging:

\- Update \`wiki/curated_sync_log.md\` with:

\- items ingested

\- topics strengthened by new content

Return:

\- List of new curated items processed

\- Key new ideas that entered the system

\- Any suggestions for future ingestion rules or filters.

**11. Combined sync skills creation prompt**

He says: “Here is a single prompt that will create all three of these sync skills that I’ve mentioned.”\[[<u>youtube</u>](https://www.youtube.com/watch?v=2fc0NX9vIJ8)\]

text

You are my systems engineer AI.

Objective:

Create and wire up three sync skills for my self‑improving system:

\- \`/sync_claude_sessions\`

\- \`/sync_ecosystem_data\`

\- \`/sync_curated_content\`

Tasks:

1\. Inspect my project:

\- confirm locations of \`raw/\`, \`wiki/\`, and \`process/\`

\- check existing skills so we don’t duplicate functionality

2\. For each skill:

\- define its purpose, inputs, outputs, and data flow

\- implement the logic to:

\- fetch new data from its source(s)

\- store raw data in the appropriate \`raw/\` subfolder

\- write summarized insights into \`wiki/\`

\- log sync runs

3\. Create or update documentation:

\- \`wiki/skills_sync.md\` with:

\- description of each sync skill

\- how and when it should be run

\- where it reads and writes data

4\. Make all three skills compatible with:

\- orchestration skills (so they can be chained)

\- Claude Code routines (so they can be scheduled)

5\. Validate:

\- run a dry‑run or test for each skill

\- summarize test results and any fixes applied

At the end, present:

\- the three skill definitions

\- any config files or constants you created

\- a short guide on how I should use these sync skills day‑to‑day.

**LOOP – improvement skill and bucketing**

**12. Skill – /improve_system with buckets**

He describes: “I like having a single skill called improve system … Here’s a prompt to set it up, which once set up will categorize any improvement … into three buckets.”\[[<u>youtube</u>](https://www.youtube.com/watch?v=2fc0NX9vIJ8)\]

text

Create a Claude Code skill called \`/improve_system\`.

Purpose:

Analyze ingested data and propose improvements to my system, categorized into three buckets:

\- Bucket 1: auto approve (low‑risk)

\- Bucket 2: need sign off (higher‑stakes)

\- Bucket 3: more context required

Skill requirements:

1\. Inputs:

\- optional time window or data scope to analyze

\- optional focus area (e.g., \`knowledge_base\`, \`skills\`, \`routines\`)

2\. Analysis:

\- Review:

\- recent data in \`process/\` and \`raw/\`

\- logs and learnings in \`wiki/\`

\- Identify potential improvements, such as:

\- reducing data bloat

\- fixing obvious linkages in \`wiki/\`

\- refactoring skills

\- creating new skills

\- restructuring folders or routines

3\. Bucketing logic:

\- Bucket 1 (auto approve):

\- low‑risk changes like:

\- adding missing links

\- cleaning up obvious duplicates

\- small text fixes

\- apply these changes automatically

\- record them in a change log (e.g., \`wiki/change_log.md\`).

\- Bucket 2 (need sign off):

\- changes that could affect output quality:

\- editing existing skills

\- creating or deleting skills

\- major restructuring

\- write proposals to \`output/review/DATE.md\` with:

\- description of change

\- rationale

\- checkbox with options:

\- \[ \] approve

\- \[ \] reject

\- \[ \] approve and don’t ask again

\- Bucket 3 (more context required):

\- improvements that require my judgment or extra info

\- add them to the same \`output/review/DATE.md\` file with:

\- clear questions for me to answer

\- any options you recommend

4\. Output:

\- Apply Bucket 1 changes automatically.

\- Generate \`output/review/DATE.md\` containing:

\- bucketed suggestions

\- checkboxes for decisions

\- Update or create any helpful summary in \`wiki/system_improvement.md\`.

5\. Behavior over time:

\- Learn from my approvals/rejections:

\- gradually expand what counts as “auto approve” where safe

\- Keep the system on the spectrum you and I agree on

(not full automation, not reviewing every minor change).

Return:

\- Summary of auto‑applied changes

\- Link to the latest review file

\- Top 5 suggested improvements needing my attention.

**DRIVE – orchestration skill and routines**

**13. Orchestration skill – /dataingestion**

He says: “To help simplify all the data ingestion into a single routine, I create a skill called /dataingestion … an orchestration skill that runs the three skills we created earlier.”\[[<u>youtube</u>](https://www.youtube.com/watch?v=2fc0NX9vIJ8)\]

text

Create a Claude Code orchestration skill called \`/dataingestion\`.

Purpose:

Run all relevant data‑ingestion sync skills in a single shot so it can be scheduled as a routine.

Behavior:

1\. When invoked, sequentially run:

\- \`/sync_claude_sessions\`

\- \`/sync_ecosystem_data\`

\- \`/sync_curated_content\`

2\. For each sub‑skill:

\- pass reasonable default parameters (e.g., “since last run”)

\- collect summaries of:

\- items processed

\- key insights

3\. Aggregated output:

\- Write a concise ingestion report to \`wiki/data_ingestion_log.md\`:

\- date/time

\- which sub‑skills ran

\- high‑level summary of new data ingested

\- Optionally write a more detailed report to \`process/data_ingestion/DATE.md\`.

4\. Make sure:

\- the skill is idempotent enough to run on a schedule

\- any errors in one sub‑skill are logged but do not silently stop the others

Return:

\- Short textual summary of ingestion

\- Pointers to any detailed logs or artifacts created.

**14. Routine prompts (for Claude desktop app)**

He describes how he sets routines:\[[<u>youtube</u>](https://www.youtube.com/watch?v=2fc0NX9vIJ8)\]

- Routine 1: data ingestion, running /dataingestion Tuesdays and Fridays at 09:00.

- Routine 2: system improvements, running /improve_system at end of day Tuesdays and Fridays.

- Routine 3: human review, optionally with /human_improve_system.

You’d typically express these as instructions inside Claude Code or its routines UI, but here’s a textual prompt you can reuse while configuring:

text

Set up three local routines in the Claude Code desktop app for my self‑improving system:

1\) Routine: Data ingestion

\- Type: local routine

\- Skill to run: \`/dataingestion\`

\- Schedule: every Tuesday and Friday at 09:00

\- Goal: keep the data lake up to date by running

\- \`/sync_claude_sessions\`

\- \`/sync_ecosystem_data\`

\- \`/sync_curated_content\`

2\) Routine: System improvements

\- Type: local routine

\- Skill to run: \`/improve_system\`

\- Schedule: every Tuesday and Friday at the end of my workday

\- Goal: analyze newly ingested data and propose improvements

with buckets:

\- auto approve

\- need sign off

\- more context required

3\) Routine: Human review

\- Type: local routine

\- Optional skill to run: \`/human_improve_system\` (if implemented)

\- Schedule: shortly after the system improvements routine

\- Goal: prompt me to review \`output/review/DATE.md\`,

check boxes (approve/reject/etc.), and keep me in the loop.

Make sure each routine:

\- references skills by name, not hard‑coded logic

\- is easy to update if we change the underlying skills.

**15. Optional skill – /human_improve_system**

He suggests: “If you want, you can make a /human improve system skill, which will help you walk through the process or notify you through Slack…”\[[<u>youtube</u>](https://www.youtube.com/watch?v=2fc0NX9vIJ8)\]

text

Create a Claude Code skill called \`/human_improve_system\`.

Purpose:

Guide me through reviewing and applying improvements proposed by \`/improve_system\`.

Requirements:

1\. Inputs:

\- path to the latest review file (e.g., \`output/review/DATE.md\`)

\- optional notification channel (e.g., Slack)

2\. Behavior:

\- Load the review file.

\- Present each suggestion in a human‑friendly way:

\- bucket (need sign off / more context)

\- description

\- recommended action

\- Walk me through each item interactively:

\- ask whether to approve, reject, or “approve and don’t ask again”

\- for “more context required”, ask follow‑up questions and update the suggestion.

3\. Apply decisions:

\- For approved items:

\- trigger or call the underlying actions (e.g., update skills, modify files)

\- For rejected items:

\- mark them as rejected and record rationale.

\- For “approve and don’t ask again”:

\- update rules so similar changes can be auto‑approved in future runs.

4\. Notifications (optional):

\- If I enable Slack or any other channel:

\- send me a reminder when there is a new review file

\- include a short summary of pending decisions.

5\. Logging:

\- Append a human‑review log to \`wiki/system_improvement_review_log.md\`.

Return:

\- Summary of decisions made in this session

\- Any new rules or thresholds for future auto‑approvals.

If you want, I can turn these into a single, strongly‑opinionated “drop‑in” project initializer prompt tailored to your second‑brain/PKM + e‑commerce use case with Obsidian and Claude Code.
