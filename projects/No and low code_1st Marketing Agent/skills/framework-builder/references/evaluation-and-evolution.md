# Evaluation And Evolution

## Evaluation Dimensions

Score 1-5 with reasons:

| Dimension | Question |
|---|---|
| Fidelity | Does the document preserve the source method and label adaptations? |
| Inference leverage | Did it produce deeper, more discriminating reasoning? |
| Evidence discipline | Did it separate facts, source claims, inference, and hypotheses? |
| Context fit | Did it adapt materially to the business model and task? |
| Composability | Did it produce a clean handoff without downstream leakage? |
| Efficiency | Did the questions justify their context cost? |
| Reliability | Did independent applications produce structurally consistent outputs? |
| Evolvability | Are weaknesses, triggers, and version changes traceable? |

## Application Trace

Store under `frameworks/_meta/usage-log.md`:

```markdown
## YYYY-MM-DD | framework | use case

- Version:
- Context:
- Selected modules:
- Inputs available:
- What became clearer:
- Weak or redundant questions:
- Unsupported inference observed:
- Handoff quality:
- User feedback:
- Proposed change:
```

## Improvement Backlog

Store under `frameworks/_meta/improvement-backlog.md`:

| Framework | Observation | Evidence count | Proposed change | Risk | Status |
|---|---|---:|---|---|---|

## Change Thresholds

- Correct factual or link errors immediately.
- Improve wording when it clearly reduces ambiguity without changing method.
- Change reasoning structure after one severe failure or repeated evidence across two or more uses.
- Promote a lesson into the global skill only when it appears across frameworks or projects.
- Deprecate only with a reason and replacement path.

## Evaluation Cases

Use at least:

- one normal-fit case;
- one weak-evidence case;
- one adjacent-but-wrong-fit case;
- one materially different business model when the framework claims broad applicability.

## Controlled Self-Improvement

The skill should always learn, but not always edit itself.

1. Capture observations automatically in the proposed retrospective.
2. Classify them as case-specific, framework-specific, or skill-wide.
3. Apply case-specific learning to the project artifact.
4. Queue framework-specific changes in the backlog.
5. Require explicit review for skill-wide changes.
