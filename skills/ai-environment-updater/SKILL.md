---
name: ai-environment-updater
description: Improve the reusable AI work environment after a workflow by updating templates, wiki pages, rules, examples, logs, or future skill ideas. Use when a repeated AI task reveals a pattern, a recurring mistake, a reusable prompt, a needed guardrail, a new template opportunity, or a workflow that should become durable knowledge in the vault.
---

# AI Environment Updater

Use this skill after a workflow when something should become easier next time.

Environment means the durable working system around AI: rules, knowledge base, templates, examples, logs, skills, and guardrails.

Mature environments have four parts:

- operating instructions
- knowledge base
- procedural skills
- deterministic guardrails

## Workflow

1. Identify what was learned.
   - Repeated friction, useful prompt, missing source, common review criterion, or recurring decision.
2. Choose the smallest durable update.
   - Template, wiki page, source summary, log entry, rule, example, checklist, or future skill idea.
3. Classify the guardrail.
   - `Always do`: safe default.
   - `Ask first`: needs human judgment.
   - `Never do`: hard boundary.
4. Update the appropriate place.
   - In this vault, prefer `templates/` for reusable forms, `wiki/` for durable knowledge, and `skills/` for repeated agent procedures.
5. Log the change when it affects the wiki or operating system.

## Decision Table

| Pattern found | Best update |
|---|---|
| Same fields are requested repeatedly | Create or revise a template. |
| Same reasoning workflow repeats | Create or revise a skill. |
| New durable concept emerges | Create or update a wiki page. |
| Source status or evidence changes | Update source summary and `wiki/sources.md`. |
| Risky action needs review | Add an `Ask first` rule. |
| Critical mistake must be blocked | Add a `Never do` rule or tool-level guardrail if available. |
| Good output should guide future work | Save as an example or reference. |

## Environment Audit Prompt

```text
Check my AI working environment:
1. operating instructions
2. knowledge base
3. templates and skills
4. verification routines
5. guardrails

For the top 5 gaps, name the file or location, the problem, the exact fix,
the guardrail bucket, and whether a hard block is needed.
```

## Output Pattern

```markdown
## Environment Update

### What We Learned
-

### Durable Update
- Type:
- Location:
- Change:

### Guardrail
- Always do:
- Ask first:
- Never do:

### Follow-up Skill Or Template Ideas
-
```

## Vault-Specific Rules

- Never modify `raw/`.
- Treat `research/` as secondary synthesis unless verified.
- Use lowercase hyphenated filenames for wiki pages.
- Update `wiki/log.md` after meaningful wiki or operating-system changes.
