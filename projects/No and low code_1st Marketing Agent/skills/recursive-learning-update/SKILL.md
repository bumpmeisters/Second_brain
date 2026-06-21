---
name: recursive-learning-update
description: Distill reusable learning after a company/product analysis, strategy sprint, claim review, framework-fit exercise, GTM map, or project run. Use when the user asks what was learned, what should be reused, how to improve the marketing agent, which workflows or skills should change, or after completing a meaningful company-analysis phase that should update the wiki, pattern library, quality rubric, source register, or log.
---

# Recursive Learning Update

## Overview

Use this skill after a company/product run or major artifact. It converts work performed once into reusable patterns, skill improvements, workflow updates, and evidence of what worked.

## Operating Principles

- Learn from completed artifacts, not vague impressions.
- Separate company-specific conclusions from reusable agent patterns.
- Record framework usefulness and workflow friction.
- Prefer small updates to workflows, skills, or checklists over broad rewrites.
- Log decisions and caveats so future runs start smarter.

## Workflow

1. Gather run artifacts.
   - Read the project index, source register, log, generated outputs, validator reports, framework-fit note, claim matrix, positioning, GTM maps, and user feedback.
   - If the project has no meaningful completed artifact, recommend the next execution step instead of forcing a retrospective.

2. Run the retrospective.
   - Read `../../frameworks/orchestration-and-learning/evidence-led-recursive-learning.md`.
   - Read `references/retrospective-template.md`.
   - Capture what worked, what was slow, what created risk, what was reusable, and what should change next time.

3. Extract reusable patterns.
   - Read `references/pattern-library-template.md`.
   - Separate reusable patterns from company-specific facts.
   - Include trigger, pattern, why it worked, evidence, and when not to use it.

4. Score quality and framework usefulness.
   - Read `references/quality-rubric.md`.
   - Score trust, usefulness, completeness, actionability, and reusability.
   - Mark frameworks as useful, premature, weak, missing, or needs testing.
   - Group repeated validator findings by category, producer skill, stage profile, and root cause.

5. Recommend updates.
   - Propose changes to `workflows/`, `skills/`, templates, context files, or tools.
   - Only implement changes that are clearly supported by the run or requested by the user.

6. Save and register learning.
   - Store retrospectives and pattern notes in `wiki/_outputs/` or durable wiki pages.
   - Update source registers only when source artifacts change.
   - Append log entries for created outputs, workflow changes, and skill updates.

## Output Shape

```markdown
# Recursive Learning Update

## Run Reviewed

## What Worked

## What Failed Or Slowed Us Down

## Reusable Patterns

## Framework Usefulness

## Quality Score

## Recommended Skill / Workflow / Tool Updates

## Next Forward Test
```

## Quality Gate

Before finishing, verify:

- Company-specific facts were not generalized without evidence.
- Reusable patterns include conditions and limits.
- Skill or workflow updates are tied to observed friction or repeated need.
- Repeated validator failures are separated from one-off artifact defects.
- Quality scores include reasons, not just numbers.
- The log records meaningful changes and next tests.

## References

- `references/retrospective-template.md`: after-run review structure.
- `references/pattern-library-template.md`: reusable pattern format.
- `references/quality-rubric.md`: scoring criteria.
- `../../frameworks/orchestration-and-learning/evidence-led-recursive-learning.md`: canonical learning and improvement framework.
