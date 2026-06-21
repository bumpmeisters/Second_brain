# Framework Document Standard

## Purpose

Use the global `$framework-builder` skill when creating or materially revising framework documents in this project.

The skill owns the universal engineering method. This file defines the local library conventions.

## Local Conventions

- Store canonical frameworks under `frameworks/<primary-domain>/`.
- Keep one canonical document per framework.
- Register every framework in its domain `index.md`.
- Store application traces and improvement proposals under `frameworks/_meta/`.
- Use the parent Second Brain for discovery; use `frameworks/` for execution.
- Run the framework lint supplied by `$framework-builder` before activation.

## Required Metadata

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

## Required Reasoning Elements

Each canonical document must include:

- framework job;
- classification and source fidelity;
- use and do-not-use conditions;
- minimum required inputs;
- core model;
- minimum questions;
- deepening questions;
- counter-questions;
- optional modules;
- branching and stop rules;
- evidence standard;
- business-model adaptations;
- output contract;
- failure modes;
- ContextOps handoff;
- evaluation notes;
- evolution triggers;
- sources and provenance.

See `$framework-builder` references for the complete schema, provenance model, question-engineering guidance, and evolution rules.
