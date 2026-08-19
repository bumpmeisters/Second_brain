---
type: workflow
status: active
description: Use bounded work evidence and independent AI proposals to identify and compare automation problems before implementation.
use_when: A team suspects automation opportunities but cannot yet name or rank the highest-leverage problem.
avoid_when: Observation scope, permissions, decision owner, or acceptable evidence cannot be established, or the agent would act on its own proposal.
output: An evidence-linked problem-candidate set, comparison, human selection or rejection, and bounded pilot brief.
sources:
  - raw/imports/automated-clippings/youtube/UC0C-17n9iuUQPylguM1d-lQ/2026-07-17--uCWKXIyvM_8.md
  - wiki/_outputs/semantic-ingest/p32/evidence-matrix.csv
created: 2026-08-15
updated: 2026-08-15
---

# AI-Assisted Problem-Discovery Preflight

**Summary**: A permission-bounded workflow for discovering and comparing plausible automation problems before a human chooses one and separately authorizes implementation.

---

## Trigger

Use this preflight when a team feels recurring friction or sees automation potential but does not yet have enough evidence to name the highest-leverage problem. It is a discovery method, not permission to build, deploy, or act.

## Required inputs

- A named decision owner and a concrete business or work goal.
- A written observation scope: allowed systems, folders, conversations, time window, data classes, and participants.
- Explicit exclusions, including secrets, private accounts, unrelated personal data, and any surface without a legitimate access basis.
- A small, representative evidence set such as process notes, handoff records, tickets, anonymized examples, or approved workflow traces.
- A common comparison rubric and a qualified human who can judge operational importance.

## Procedure

1. **Define the decision boundary.** Name the owner, intended outcome, decision date, and what this preflight may and may not decide.
2. **Approve the observation contract.** Grant least-privilege, read-only access to exact evidence surfaces. Record provenance and exclusions. Do not conduct an open-ended scrape of messages or files.
3. **Describe the current work.** Map the workflow, recurring friction, affected people, frequency, current controls, and observable consequences. Separate direct evidence from interpretation.
4. **Generate independent candidates.** Produce at least two problem proposals independently before comparison. Each proposal must identify its evidence, affected outcome, expected leverage, feasibility, permission and safety risks, verifier, and unresolved uncertainty.
5. **Compare on one rubric.** Evaluate problem importance, frequency, evidence strength, leverage, feasibility, containment, verifiability, and reversibility. Distinguish a strategically important problem from one that is merely easy to finish.
6. **Make a human decision.** The named owner approves, rejects, combines, or defers candidates and records the rationale. An agent must not select its own proposal or treat polish as evidence.
7. **Write a bounded pilot brief.** For an approved problem, define users, inputs, allowed actions, human gates, success and failure measures, stop conditions, owner, review date, and unresolved dependencies.
8. **Request separate implementation authority.** Building, connecting systems, changing permissions, contacting people, or taking external action requires a distinct approval and its own verification plan.
9. **Review the learning.** Compare pilot evidence with the original problem hypothesis and update, narrow, or retire the candidate rather than preserving it by default.

## Inspectable output

The preflight is complete only when it leaves:

- the approved observation contract and evidence provenance;
- at least two independently produced problem candidates;
- one comparison table using the same rubric for every candidate;
- a dated human selection, rejection, combination, or deferral decision;
- for any selected problem, a bounded pilot brief with verifier and stop conditions;
- a record of permissions, uncertainties, and actions that remain unauthorized.

## Reuse boundaries

- The originating source is one practitioner anecdote captured through automatic German captions. It supports the workflow distinction, not named-model superiority or general performance claims (source: 2026-07-17--uCWKXIyvM_8.md).
- Do not give an agent unrestricted access to chat systems, local files, mailboxes, or private accounts. Observation must be purpose-limited, least-privilege, and reviewable.
- Independent proposals reduce premature convergence but do not make the candidates correct or representative.
- Do not infer causality, savings, privacy, growth, or business value without suitable pilot evidence.
- This workflow authorizes discovery only. It does not authorize implementation, deployment, external communication, data mutation, or an agent acting on its own recommendation.

## Related pages

- [[applied-ai-use-cases]]
- [[ai-work-blueprint]]
- [[ai-governance]]
- [[agent-security]]
- [[reliable-ai-capability-rollout]]
- [[reusable-practices-router]]
