---
type: operating-contract
status: active
description: "Run repeated editorial production as a staged, restartable pipeline with named evidence, saved artifacts, explicit acceptance gates, and human publication authority."
use_when: "A recurring content type has predictable structure, checkable facts, qualified reviewers, and approved evidence that can support modular production."
avoid_when: "The topic is unfamiliar, volatile, evidence-poor, high-consequence without specialist review, or intended for autonomous publication."
output: "A source-traceable content packet containing accepted stage artifacts, verification results, unresolved issues, and a publication decision."
sources:
  - raw/Clippings/How I Do Content Engineering with Claude Code 1.md
  - raw/Clippings/How to automate blog writing with AI from keyword to published  Ryan Law (Ahrefs).md
  - raw/Clippings/AI Writing at Scale Ahrefs’ Step-by-Step Workflow  Ryan Law (Ahrefs).md
created: 2026-08-01
updated: 2026-08-01
---

# Content Engineering Pipeline Contract

**Summary**: Convert a stable editorial process into bounded stages that save their work, expose evidence and uncertainty, and can restart from the last accepted artifact.

---

## Trigger

Use this contract when a team repeatedly produces a content type whose audience, structure, sources, quality criteria, and accountable reviewers can be specified before drafting.

## Required inputs

- A defined audience, decision context, topic, purpose, and accountable editor.
- Approved claims, named source locations, owned evidence, and freshness requirements.
- A content brief or explicit acceptance criteria for the finished asset.
- Stage owners, stop conditions, and the person authorized to approve publication.
- A stable location for intermediate artifacts and verification records.

## Procedure

1. **Pass the fit gate.** Confirm that the structure is predictable, important facts are checkable, the team can judge quality, and the source base contains distinctive evidence or expertise. Stop or narrow the task if these conditions fail.
2. **Freeze the evidence boundary.** Record the approved sources, dates, claims, exclusions, and unresolved questions. Do not allow later drafting stages to silently introduce unsupported evidence.
3. **Create and accept the brief.** Specify the reader, question, desired decision, thesis, proof requirements, voice constraints, and non-goals. Save the accepted brief.
4. **Research with provenance.** Produce a source map or research artifact that distinguishes sourced facts, practitioner claims, analysis, and open questions.
5. **Build and review the outline.** Map every material section to its reader job and supporting evidence. Save the accepted outline before drafting.
6. **Draft in bounded stages.** Compose from the accepted artifacts, saving each stage output. Resume from the last acceptable artifact after a failure instead of restarting the entire pipeline.
7. **Verify independently.** Check factual claims, citations, links, internal consistency, genre fit, audience utility, and prohibited content against the original sources and brief. Record unresolved items explicitly.
8. **Format without changing meaning.** Apply channel and presentation requirements only after the content passes verification; recheck any transformations that could alter claims.
9. **Require publication approval.** Produce a draft and evidence packet for the accountable human. Publication or external distribution is a separate authorized action.

The stage sequence synthesizes the sources' research–outline–draft–review–format patterns while preserving their strongest common controls: front-loaded expert direction, saved outputs, source grounding, stage-level restart, and full-text review (sources: How I Do Content Engineering with Claude Code 1.md; How to automate blog writing with AI from keyword to published  Ryan Law (Ahrefs).md; AI Writing at Scale Ahrefs’ Step-by-Step Workflow  Ryan Law (Ahrefs).md).

## Inspectable output

A versioned packet containing the brief, source map, outline, draft, verification result, unresolved-issue list, accepted stage markers, and final `approve`, `revise`, or `stop` publication decision.

## Reuse boundaries

The contract does not establish that AI-produced content will rank, be cited, save a fixed amount of labor, or perform commercially. It does not authorize unfamiliar-topic automation, unchecked internal links, unsupported claims, source substitution, or autonomous publication. High-stakes domains require their own specialist, legal, compliance, privacy, and security controls.

## Related pages

- [[content-engineering]]
- [[content-quality]]
- [[maintained-content-distribution-lifecycle]]
- [[agent-skill-design]]
- [[reusable-practices-library]]
- [[reusable-practices-router]]