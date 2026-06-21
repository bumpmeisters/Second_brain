---
type: retrospective
status: active
sources:
  - user input, 2026-06-19
  - frameworks/framework-document-standard.md
  - frameworks/audience-understanding
  - skills/audience-understanding/SKILL.md
created: 2026-06-19
updated: 2026-06-19
---

# Framework Builder Retrospective

## Summary

The Audience Understanding framework migration proved that question-driven canonical framework documents create more inference value than short framework summaries. It also exposed that a durable Framework Builder needs stronger provenance, classification, evaluation, versioning, and learning governance.

## What Worked

### Frameworks became first-class assets

Moving frameworks from scattered Second-Brain references into a local `frameworks/` layer reduced runtime retrieval dependency and gave skills stable canonical inputs.

### Questions preserved the reasoning mechanism

The Crestodina framework worked best when the document preserved open diagnostic questions, follow-ups, counter-questions, and evidence checks. This is more useful than naming fields such as "fears" or "motivations".

### Progressive disclosure was appropriate

A domain router plus individual framework documents lets a skill compare options and load only the selected methods.

### ContextOps boundaries improved composability

Use/do-not-use rules, output contracts, and handoffs reduced leakage into positioning, campaigns, or execution.

### Attribution caution prevented false authority

The HubSpot/Kieran case showed the value of avoiding unsupported personal attribution and relying on verifiable institutional sources.

## What Did Not Work Well

### Research depth was uneven

Some framework documents were based on strong primary sources; others leaned on broad public pages, internal examples, or secondary syntheses. Source confidence was not encoded consistently.

### Official methods and project adaptations were blurred

Documents often named an expert while mixing source-faithful elements with project-created extensions. Disclosure existed, but framework type and field-level provenance were not formal.

### The first standard optimized structure more than lifecycle

The document standard required good sections but not versioning, lifecycle state, evaluation evidence, known weaknesses, or evolution triggers.

### Question quantity could masquerade as quality

Counting open questions showed depth potential, but not whether questions were discriminating, redundant, conditional, or worth their context cost.

### Branching and stop rules were underdeveloped

Most documents provided long question lists without distinguishing minimum questions, optional modules, weak-answer recovery, wrong-fit conditions, or when to stop.

### Business-model adaptations risked boilerplate

Several B2B/B2C/D2C adaptations named different roles but did not always alter the reasoning path or required evidence.

### Evaluation was structural, not empirical

Link checks and heading checks passed, but the frameworks had not yet demonstrated consistent value across realistic cases, weak-evidence cases, or wrong-fit cases.

### No framework learning ledger existed

There was no application trace, improvement backlog, version policy, or threshold for changing a framework or the builder itself.

## Universal Builder Requirements

The universal skill must:

1. Classify frameworks as source-faithful, adapted, composite, or original.
2. Build field-level provenance.
3. Compare multiple candidate architectures.
4. Engineer minimum, deepening, counter, and optional question modules.
5. Define branching and stop rules.
6. Separate framework evidence from case evidence.
7. Encode meaningful business-model adaptations.
8. Validate structure deterministically.
9. Evaluate real application behavior.
10. Version frameworks and preserve learning traces.
11. Distinguish case-specific, framework-specific, and skill-wide lessons.
12. Require review before changing global behavior.

## Evolution Model

The skill should always capture learning but should not automatically rewrite itself.

```text
Application
-> Trace
-> Diagnosis
-> Change proposal
-> Review
-> Versioned update
-> Next evaluation
```

A lesson should enter the global skill only when it transfers across frameworks or projects.

## First Improvement Applied

The Crestodina framework was migrated to the new schema:

- explicit adapted classification;
- source-faithful versus project-added elements;
- minimum and optional questions;
- counter-questions;
- branches and stop rules;
- evaluation notes;
- evolution triggers;
- semantic version.

The remaining Audience Understanding frameworks are registered in the improvement backlog for incremental migration.
