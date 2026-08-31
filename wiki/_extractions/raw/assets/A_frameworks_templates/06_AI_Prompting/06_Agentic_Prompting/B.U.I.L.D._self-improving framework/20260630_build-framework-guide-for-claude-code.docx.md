---
type: source-conversion
status: extracted
source: 'raw/assets/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/B.U.I.L.D._self-improving framework/20260630_BUILD Framework Guide for Claude Code.docx'
original_file: 'raw/assets/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/B.U.I.L.D._self-improving framework/20260630_BUILD Framework Guide for Claude Code.docx'
source_layer: raw
source_sha256: a0bc675e4d772eb9e1011ba5b411a10113c985532627c788da38a41d422967a7
source_size_bytes: 19901
source_modified: '2026-06-30T13:30:28'
converter_profile: 2026-07-16.1
created: 2026-08-07
converter: pandoc
preservation: extraction-derivative
---

# 20260630_BUILD Framework Guide for Claude Code

## Source

- Original file: [raw/assets/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/B.U.I.L.D._self-improving framework/20260630_BUILD Framework Guide for Claude Code.docx](<../../../../../../../../raw/assets/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/B.U.I.L.D._self-improving framework/20260630_BUILD Framework Guide for Claude Code.docx>)
- Original path: `raw/assets/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/B.U.I.L.D._self-improving framework/20260630_BUILD Framework Guide for Claude Code.docx`
- Preservation note: This Markdown file is an extraction derivative for search, linking, and synthesis. Use the original file for layout, images, formulas, comments, speaker notes, or any high-stakes verification.

Conversion note: converted with pandoc (gfm)

---

## Extracted Content
# BUILD Framework Guide for Claude Code

## What BUILD actually is

Austin’s BUILD framework is best understood as a five-layer operating model for turning Claude Code from a one-off assistant into a compounding system. In your uploaded notes, the framework is explicitly organized as **Base, Upload, Inflow, Loop, and Drive**, and each layer has its own prompt templates: knowledge-base setup, ingestion skills, sync skills, improvement logic, orchestration, and routines. fileciteturn0file0

What makes the framework compelling is that it maps cleanly onto Claude Code’s current native primitives rather than inventing a separate system. Claude Code already gives you persistent project instructions through `CLAUDE.md`, automatically accumulated learnings through auto memory, reusable skills in `.claude/skills/`, hooks for guardrails, and automation through both cloud routines and Desktop scheduled tasks. In other words, BUILD is less a new product than a disciplined way to combine the product features that already exist. [\[1\]](https://docs.anthropic.com/en/docs/claude-code/overview)

The deepest idea underneath BUILD is not “let the AI run everything.” It is “separate stable context from raw material, then keep the system fed, reviewed, and scheduled.” Austin’s prompts repeatedly enforce that pattern: raw sources go into `raw/`, condensed reference material goes into `wiki/`, sync skills bring in new information, and an improvement layer reviews what should be changed automatically versus what should still require human sign-off. fileciteturn0file0

## BASE

In Austin’s formulation, **BASE** is the foundation layer: project structure, knowledge organization, and the first reusable skills. The uploaded prompt pack defines this stage around a Karpathy-style split between `raw/` and `wiki/`, plus a root guidance file (`claude.md` in the notes, which in current Claude Code practice should be `CLAUDE.md`) and a first utility skill such as `/add_new_resource`. The combined setup prompt also introduces `process/` as an optional place for intermediate artifacts and calls for documenting all skills in a dedicated wiki file. fileciteturn0file0

This aligns well with Claude Code’s official memory model. Claude Code distinguishes between `CLAUDE.md`, which you write, and **auto memory**, which Claude writes for itself. `CLAUDE.md` is for persistent instructions such as architecture, standards, commands, and workflow rules; auto memory is for learned patterns like build commands or debugging insights discovered over time. The docs are explicit that both are loaded as context at the start of sessions, but they are not hard-enforced policy. If you need a rule to be mandatory rather than suggestive, Anthropic recommends a hook instead of relying on `CLAUDE.md` alone. [\[2\]](https://code.claude.com/docs/en/memory)

A practical implication is that your BASE should stay intentionally small. Anthropic recommends keeping a `CLAUDE.md` file concise, targeting roughly under 200 lines, because everything in it consumes startup context. If your rules grow large, the docs recommend splitting them into imports or path-scoped rules rather than letting one giant instruction file become a token sink. That fits the BUILD philosophy almost perfectly: stable global rules in `CLAUDE.md`, large source material in `raw/`, and high-signal summaries in `wiki/`. [\[3\]](https://code.claude.com/docs/en/memory)

Skills are the second half of BASE. Claude Code project skills live at `.claude/skills/<skill-name>/SKILL.md`, while personal skills live under `~/.claude/skills/<skill-name>/SKILL.md`. Their descriptions are loaded so Claude knows what is available, but the full skill content is only loaded when the skill is invoked, which is one reason focused, task-specific skills scale better than one giant “do everything” skill. Anthropic also recommends concise skill bodies and moving heavyweight examples or references into supporting files in the same skill directory. [\[4\]](https://code.claude.com/docs/en/skills)

If you want to apply BUILD well, your BASE should therefore include four things and no more: a short `CLAUDE.md`, a clean folder taxonomy, one ingestion skill, and one skills index page. That gives you a stable operating system without prematurely automating the rest of your life. Austin’s notes explicitly optimize for “simplicity over complexity,” and Claude Code’s own context limits strongly reward that restraint. fileciteturn0file0 [\[5\]](https://code.claude.com/docs/en/memory)

## UPLOAD

**UPLOAD** is Austin’s bootstrap phase: the one-time or occasional bulk ingest of the material that should make your system more useful from day one. In the uploaded notes, he treats the main upload sources as Claude session history, files from your computer, email exports, and a “life story / project goals” recording. He also specifies concrete outputs such as `wiki/session_learnings.md`, `wiki/writing_style.md`, `wiki/workflows_from_email.md`, `wiki/local_files_index.md`, and `wiki/user_profile.md`. He further emphasizes privacy: skip folders the user excludes, and ask before ingesting sensitive material. fileciteturn0file0

The most important conceptual move here is that UPLOAD is **not** just dumping data into context. It is a compilation pass. Raw material goes into `raw/`, but each data source is supposed to create or update a curated wiki layer that explains what the source is, why it matters, and when it should be used. Austin’s prompts consistently ask for concise, reference-style summaries that link back to source files instead of replacing them. That is a stronger design than naive archival storage, because it preserves provenance while keeping the model-facing layer scannable. fileciteturn0file0

This is also where Claude Code’s instruction design matters. Anthropic explicitly advises using `CLAUDE.md` for rules you would otherwise repeat in every session, not for giant blobs of source material. If an instruction file gets too large, the docs recommend imports, rules, or other scoping mechanisms. That means Austin’s `raw/` + `wiki/` split is not just aesthetically neat; it is operationally compatible with how Claude Code actually handles context. [\[3\]](https://code.claude.com/docs/en/memory)

The best way to apply UPLOAD in practice is selective rather than maximalist. Austin’s own “sync curated content” prompt says to aim for **“less but better”** and to filter out low-signal material. That matters because indiscriminate ingest creates exactly the problems BUILD later has to clean up: duplication, stale knowledge, wiki clutter, and too many vaguely overlapping sources. The right mental model is not “import everything,” but “import the things that change decisions.” fileciteturn0file0

## INFLOW

If UPLOAD is the bootstrap, **INFLOW** is the maintenance layer that keeps the system alive. Austin’s prompt pack defines three core sync skills here: `/sync_claude_sessions`, `/sync_ecosystem_data`, and `/sync_curated_content`. The first digests conversation history into learnings, the second pulls recurring inputs from an ecosystem such as meetings, Slack, or YouTube, and the third ingests curated high-signal sources like newsletters. Each one is supposed to update the relevant wiki files and maintain a sync log. fileciteturn0file0

That design fits Claude Code skills especially well. Anthropic’s docs show that project skills are auto-discovered from `.claude/skills/` in the current directory and parent directories, and nested skills can also be discovered on demand in subdirectories. This is useful for BUILD because it means your sync skills can live as project-native capabilities rather than external scripts duct-taped onto the repo. It also means you can keep the skill surface modular: one skill for session sync, one for ecosystem sync, one for curated content, rather than one monolithic ingestion command. [\[6\]](https://code.claude.com/docs/en/skills)

The biggest modern decision inside INFLOW is **where the automation runs**. Anthropic now supports both cloud **routines** and local **Desktop scheduled tasks**. Cloud routines run on Anthropic-managed infrastructure, can trigger on schedules, HTTP API calls, or GitHub events, and can use connected connectors during each run. Desktop scheduled tasks run on your own machine with direct access to local files and tools, but only while the app is open and the machine is awake. Desktop tasks can also run in isolated Git worktrees, which is a strong option for recurring maintenance jobs. [\[7\]](https://code.claude.com/docs/en/routines)

That leads to a very practical BUILD choice. If your inflow depends on **local files**—for example, computer folders, exports, or anything sitting only on your laptop—Desktop scheduled tasks are the more natural fit. If your inflow depends mostly on **cloud-accessible repos and connectors** and should keep running when your laptop is closed, cloud routines are better. That is an inference from Anthropic’s current product model, but it cleanly operationalizes Austin’s original idea of recurring sync without forcing everything into a single execution environment. [\[8\]](https://code.claude.com/docs/en/desktop-scheduled-tasks)

## LOOP

The **LOOP** stage is Austin’s answer to the hardest question in self-improving systems: how do you let the system evolve without letting it mutate into chaos. His `/improve_system` prompt solves this with a three-bucket model. Bucket one is **auto-approve** for low-risk changes such as small fixes and missing links. Bucket two is **need sign-off** for higher-stakes changes like skill edits or major restructuring. Bucket three is **more context required** for proposals that need human judgment. The skill is supposed to apply Bucket one automatically, write review files for the others, and learn from the user’s approvals and rejections over time. fileciteturn0file0

This is exactly where Claude Code’s official distinction between “context” and “enforcement” matters. Anthropic states that `CLAUDE.md` instructions are not guaranteed policy; they are context. If you want hard boundaries, hooks are the right mechanism. `PreToolUse` hooks can allow, deny, ask, or defer tool calls before they execute; `UserPromptExpansion` hooks can block or annotate direct slash-command invocations; and hooks can even modify tool input or add extra context. In other words, Austin’s improvement buckets are the decision policy, while Claude Code hooks can provide the hard safety rails around that policy. [\[9\]](https://code.claude.com/docs/en/memory)

That combination is the strongest way to apply LOOP in practice. Let `/improve_system` propose and even auto-apply low-risk documentation and linkage fixes, but use hooks to block the categories that should never silently self-modify: destructive shell commands, production deploys, deletion of large directory trees, mass file rewrites outside approved folders, or direct invocation of sensitive skills. Anthropic’s docs even show `PreToolUse` being used to deny dangerous shell commands like `rm -rf`, which is exactly the sort of hard stop a self-improving repo should have. [\[10\]](https://code.claude.com/docs/en/hooks)

The subtle lesson here is that LOOP should improve **structure and reliability**, not just add more data. Austin’s prompt targets data bloat reduction, fixing obvious wiki linkages, skill refactors, new skills, and folder/routine restructuring. That is the right emphasis. A mature BUILD loop does not merely ingest more; it reduces entropy. fileciteturn0file0

## DRIVE

In Austin’s framework, **DRIVE** is the orchestration and scheduling layer. The uploaded notes define an orchestration skill called `/dataingestion` that simply runs the three inflow skills in sequence, aggregates their outputs, and writes a concise ingestion report. The notes then propose local routines around that skill: a data-ingestion routine on Tuesdays and Fridays, a system-improvement routine later the same day, and optionally a human review routine after that. fileciteturn0file0

That is a strong design because it keeps orchestration thin. Claude Code’s official automation features support exactly this kind of separation. Cloud routines can be scheduled, API-triggered, or GitHub-triggered, and they can include connectors during each run. Desktop scheduled tasks can also be created and managed inside Claude Code Desktop and are better when the task needs immediate access to local files and tools. Anthropic notes that cloud routines are still in research preview, which is worth factoring into how aggressively you depend on them for mission-critical workflows. [\[11\]](https://code.claude.com/docs/en/routines)

There is also an important access-control detail in the current product. When you create a cloud routine, your connected connectors are included by default unless you remove them, and each selected repository is cloned per run. Anthropic recommends scoping both repository permissions and connector access to what the routine actually needs. For BUILD, that means DRIVE should orchestrate tasks with the smallest feasible permission surface, not create one giant automation endpoint with universal reach. [\[12\]](https://code.claude.com/docs/en/routines)

The cleanest interpretation of DRIVE is therefore this: **BASE defines the system, UPLOAD seeds it, INFLOW feeds it, LOOP refines it, and DRIVE keeps the whole cycle moving on a cadence.** Austin’s whiteboarded mnemonic is simple, but it is actually a full lifecycle architecture. fileciteturn0file0

## A practical BUILD implementation for you

If I were applying BUILD for you today, I would start with a deliberately opinionated but compact project structure. This recommendation is directly grounded in Austin’s `raw/` + `wiki/` + `process/` pattern and Anthropic’s current placement rules for `CLAUDE.md`, skills, and hooks. fileciteturn0file0 [\[13\]](https://code.claude.com/docs/en/memory)

    your-project/
    ├── CLAUDE.md
    ├── .claude/
    │   ├── skills/
    │   │   ├── add-new-resource/
    │   │   │   └── SKILL.md
    │   │   ├── sync-claude-sessions/
    │   │   │   └── SKILL.md
    │   │   ├── sync-ecosystem-data/
    │   │   │   └── SKILL.md
    │   │   ├── sync-curated-content/
    │   │   │   └── SKILL.md
    │   │   ├── improve-system/
    │   │   │   └── SKILL.md
    │   │   └── dataingestion/
    │   │       └── SKILL.md
    │   ├── hooks/
    │   └── rules/
    ├── raw/
    │   ├── sessions/
    │   ├── computer/
    │   ├── email/
    │   ├── meetings/
    │   ├── curated/
    │   └── goals/
    ├── wiki/
    │   ├── user_profile.md
    │   ├── session_learnings.md
    │   ├── workflows_from_email.md
    │   ├── writing_style.md
    │   ├── local_files_index.md
    │   ├── ecosystem_learnings.md
    │   ├── curated_content.md
    │   ├── skills.md
    │   ├── data_ingestion_log.md
    │   └── system_improvement.md
    ├── process/
    │   ├── sessions/
    │   └── data_ingestion/
    └── output/
        └── review/

For the first pass, I would keep `CLAUDE.md` extremely short. It should explain the purpose of the repo, the meaning of `raw/`, `wiki/`, `process/`, and `output/`, how skills should read and write those folders, and the two or three rules Claude should follow in every session. Anthropic’s docs support this minimalism very strongly: `CLAUDE.md` is for stable, repeated instructions, and large or detailed material should be moved into other files or path-scoped rules. [\[3\]](https://code.claude.com/docs/en/memory)

I would then implement BUILD in three waves. The first wave is **BASE**: run `/init`, create the folder tree, write `CLAUDE.md`, and create only two skills at first: `/add_new_resource` and `/improve_system`. Anthropic’s docs note that `/init` can now generate `CLAUDE.md`, skills, and hooks interactively, which makes it a very good starting point for Austin’s “base framework” step. [\[3\]](https://code.claude.com/docs/en/memory) fileciteturn0file0

The second wave is **UPLOAD**: ingest only the highest-signal historical material. Good candidates are your own session history, the top few folders on your machine that clearly matter, one email export sample, and one structured “life story / goals” note instead of a sprawling autobiography. That follows Austin’s prompts and also protects you from the biggest BUILD failure mode: overwhelming the wiki with undifferentiated imports. fileciteturn0file0

The third wave is **INFLOW + DRIVE**: add `/sync_claude_sessions`, `/sync_ecosystem_data`, `/sync_curated_content`, then wrap them in `/dataingestion`, and only after that schedule them. If your most important inflow sources live locally, use Desktop scheduled tasks first. If they live in connected services and you want unattended execution while the laptop is closed, move to cloud routines. Anthropic’s documentation makes that local-versus-cloud distinction very clear. [\[8\]](https://code.claude.com/docs/en/desktop-scheduled-tasks)

Finally, I would harden the **LOOP** with two or three hooks. One `PreToolUse` hook should deny destructive Bash patterns. One `UserPromptExpansion` hook should guard any high-risk slash command such as deploy or large-structure refactors. And one review convention in `/improve_system` should require sign-off for skill creation, skill deletion, or folder restructuring. That pairing gives you what Austin is aiming for: a system that can improve itself, but only inside a supervised lane. fileciteturn0file0 [\[14\]](https://code.claude.com/docs/en/hooks)

If you want a concise “Austin-style but current-Claude-Code” initializer prompt, this is the version I would actually paste first. It keeps the spirit of the uploaded prompt pack but aligns the names and primitives with current official docs. fileciteturn0file0 [\[15\]](https://code.claude.com/docs/en/memory)

    You are my systems architect for a self-improving Claude Code project.

    Set up a minimal BUILD foundation for this repo.

    Create:
    - a short project-level CLAUDE.md
    - folders: raw/, wiki/, process/, output/review/
    - a project skills folder at .claude/skills/
    - a first skill called /add-new-resource
    - a wiki/skills.md file documenting the skills

    Rules:
    - raw/ stores source materials
    - wiki/ stores concise curated summaries that link back to raw/
    - process/ stores intermediate artifacts
    - output/review/ stores human review files for non-trivial proposed changes
    - keep CLAUDE.md concise and focused on repeated project instructions
    - ask before moving or deleting existing files
    - prefer simplicity over complexity

    Then summarize:
    - final folder structure
    - CLAUDE.md contents
    - created skills
    - next best BUILD steps

And if you want the single highest-leverage improvement prompt after the foundation is in place, I would use this version of `/improve_system`, because it is the part of BUILD most likely to create compounding value over time. It preserves Austin’s three-bucket logic while making the approval boundary explicit. fileciteturn0file0

    Analyze this project as a self-improving Claude Code system.

    Review:
    - CLAUDE.md
    - .claude/skills/
    - wiki/
    - process/
    - recent logs and review files

    Find improvements in three buckets:
    - auto-approve: low-risk link fixes, duplicate cleanup, naming cleanup, short doc fixes
    - need sign-off: skill creation, skill deletion, major workflow changes, directory restructuring
    - more context required: anything ambiguous, sensitive, or preference-dependent

    Apply only auto-approve changes.
    Write all other recommendations to output/review/TODAY.md with:
    - the proposed change
    - why it helps
    - risks
    - approve / reject / approve-and-don’t-ask-again checkboxes

    Also update wiki/system_improvement.md with the current summary of system strengths, weaknesses, and recurring bottlenecks.

At a strategic level, the right way to judge whether BUILD is working is simple: after a few weeks, Claude should need fewer repeated explanations, your high-signal sources should be easier to find, recurring workflows should have obvious slash-command entry points, and improvements should arrive as reviewable proposals instead of surprising repo mutations. If those four things are happening, you are applying Austin’s framework correctly. fileciteturn0file0 [\[16\]](https://code.claude.com/docs/en/memory)

------------------------------------------------------------------------

[\[1\]](https://docs.anthropic.com/en/docs/claude-code/overview) Overview - Claude Code Docs

<https://docs.anthropic.com/en/docs/claude-code/overview>

[\[2\]](https://code.claude.com/docs/en/memory) [\[3\]](https://code.claude.com/docs/en/memory) [\[5\]](https://code.claude.com/docs/en/memory) [\[9\]](https://code.claude.com/docs/en/memory) [\[13\]](https://code.claude.com/docs/en/memory) [\[15\]](https://code.claude.com/docs/en/memory) [\[16\]](https://code.claude.com/docs/en/memory) How Claude remembers your project - Claude Code Docs

<https://code.claude.com/docs/en/memory>

[\[4\]](https://code.claude.com/docs/en/skills) [\[6\]](https://code.claude.com/docs/en/skills) Extend Claude with skills - Claude Code Docs

<https://code.claude.com/docs/en/skills>

[\[7\]](https://code.claude.com/docs/en/routines) [\[11\]](https://code.claude.com/docs/en/routines) [\[12\]](https://code.claude.com/docs/en/routines) Automate work with routines - Claude Code Docs

<https://code.claude.com/docs/en/routines>

[\[8\]](https://code.claude.com/docs/en/desktop-scheduled-tasks) Schedule recurring tasks in Claude Code Desktop - Claude Code Docs

<https://code.claude.com/docs/en/desktop-scheduled-tasks>

[\[10\]](https://code.claude.com/docs/en/hooks) [\[14\]](https://code.claude.com/docs/en/hooks) Hooks reference - Claude Code Docs

<https://code.claude.com/docs/en/hooks>
