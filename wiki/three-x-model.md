---
type: method
status: active
sources:
  - https://newsletter.pragmaticengineer.com/p/how-kent-beck-shapes-the-software
created: 2026-07-15
updated: 2026-07-15
---

# Three-X Model

**Summary**: Explore, Expand, and Extract are three different operating phases. Each needs different goals, controls, and measures; applying Extract-style optimization while the work is still uncertain suppresses learning.

---

## The three phases

| Phase | Primary question | Appropriate behavior | Useful evidence |
|---|---|---|---|
| Explore | What might work? | Run many cheap, reversible, deliberately different experiments. | Learning rate, falsified assumptions, promising signals. |
| Expand | How do we remove constraints around what works? | Concentrate on a validated direction and solve successive bottlenecks. | Adoption, throughput, constraint removal, repeatability. |
| Extract | How do we operate the proven system efficiently? | Standardize, automate, optimize, and reduce variance. | Unit economics, reliability, quality, cycle time. |

Kent Beck presents 3X as a product and engineering model rather than an AI-specific framework. His AI-era interpretation is that fast AI-assisted implementation has pushed much software work back into Explore: teams can test more ideas, but they do not yet know the durable playbook (source: [Pragmatic Engineer interview](https://newsletter.pragmaticengineer.com/p/how-kent-beck-shapes-the-software)).

## Application to AI work

An AI initiative should declare its current phase before selecting its workflow and metrics:

1. In Explore, cap cost and blast radius, keep experiments reversible, and optimize for differentiated learning rather than output volume.
2. In Expand, preserve the winning evidence while testing operational constraints such as context, permissions, reliability, adoption, and review capacity.
3. In Extract, convert the proven pattern into skills, templates, tests, monitoring, and a repeatable operating process.

Moving between phases is an evidence decision. A prototype should not enter Extract merely because it produces impressive output, and an established workflow should not stay in endless Explore to avoid accountability (analysis based on the 3X model and [[loop-engineering]]).

## Trust accumulation

AI can increase generated code, documents, or campaigns faster than the organization accumulates confidence in them. Track trust alongside production: verified outcomes, repeat success, recoverability, source traceability, and reviewer overrides. This prevents activity metrics from disguising a weak delivery system (source: Pragmatic Engineer interview; analysis).

## Caveats

- 3X is a practitioner heuristic, not a controlled universal model.
- Real initiatives can contain different phases simultaneously; classify the specific workflow, not the entire company.
- The boundaries are judgment calls and should be supported by explicit evidence.

## Related pages

- [[loop-engineering]]
- [[ai-work-blueprint]]
- [[agent-evaluation]]
- [[ai-operating-system]]