# Framework Engineering Lifecycle

## Lifecycle

1. Define the job.
2. Discover candidate methods.
3. Classify the framework.
4. Build the provenance packet.
5. Reconstruct the reasoning mechanism.
6. Compare candidate architectures.
7. Write the canonical document.
8. Evaluate on realistic context.
9. Activate and register.
10. Learn from use.
11. Revise, deprecate, split, or merge.

## Framework Types

### Source-Faithful

Use when accurately reconstructing a named expert or institution's method.

Rules:
- Preserve the source's terminology and causal logic.
- Keep additions in a separate adaptation section.
- Do not fill source gaps with plausible invention.

### Adapted

Use when a source framework needs material changes for a business model, ContextOps stage, or operational setting.

Rules:
- Name the source.
- Explain what changed and why.
- Do not title the adaptation as though the expert authored it.

### Composite

Use when no single method covers the framework job.

Rules:
- Name each contributing method.
- Explain the role and boundary of each component.
- Resolve overlaps and contradictions explicitly.

### Original

Use when the project creates a new reasoning system.

Rules:
- State that it is original.
- Explain what problem existing methods did not solve.
- Treat it as a hypothesis until evaluated.

## Lifecycle States

| State | Meaning | Promotion gate |
|---|---|---|
| `candidate` | Method discovered but not reconstructed. | Source packet exists. |
| `draft` | Canonical document exists. | Structural lint and expert/source review pass. |
| `active` | Approved for routine use. | At least one realistic application and quality review. |
| `validated` | Repeatedly useful across contexts. | Multiple application traces with consistent value. |
| `needs-revision` | Material weakness observed. | Revision proposal accepted. |
| `deprecated` | Replaced, unsafe, or no longer useful. | Replacement or reason recorded. |

## Architecture Tournament

Generate 2-4 representations such as:

- source-native sequence;
- ContextOps-stage adaptation;
- modular question engine;
- decision tree;
- layered or two-sided variant.

Score:

| Criterion | Weight |
|---|---:|
| Source fidelity | 20% |
| Inference leverage | 25% |
| Context and business-model fit | 15% |
| Evidence discipline | 15% |
| Composability and handoff | 10% |
| Context efficiency | 10% |
| Evolvability | 5% |

Select a winner, but retain variants when the use cases are genuinely different.
