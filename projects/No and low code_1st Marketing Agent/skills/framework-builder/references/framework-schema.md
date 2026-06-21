# Canonical Framework Schema

## Frontmatter

```yaml
---
framework: lowercase-hyphenated-name
domain: primary-contextops-domain
type: source-faithful | adapted | composite | original
status: candidate | draft | active | validated | needs-revision | deprecated
version: 0.1.0
created: YYYY-MM-DD
updated: YYYY-MM-DD
source-confidence: high | medium | low
---
```

## Required Sections

```markdown
# Framework Name

## Framework Job
## Classification And Fidelity
## Use When
## Do Not Use When
## Minimum Required Inputs
## Core Model
## Question Engine
### Minimum Viable Questions
### Deepening Questions
### Counter-Questions
### Optional Modules
## Branching And Stop Rules
## Evidence Standard
## Business-Model Adaptations
## Output Contract
## Failure Modes
## ContextOps Handoff
## Evaluation Notes
## Evolution Triggers
## Sources And Provenance
```

## Domain Router Entry

Every framework must appear in its domain index with:

- primary contribution;
- strongest use;
- evidence requirement;
- main risk;
- compatible and conflicting frameworks.

## Evolution Metadata

Record:

- current version;
- last material change;
- evidence for the change;
- known weaknesses;
- next evaluation case.

Do not maintain a verbose changelog inside the skill. Keep project-specific application traces in `frameworks/_meta/`.
