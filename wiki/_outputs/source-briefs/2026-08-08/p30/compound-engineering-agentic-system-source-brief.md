---
type: source-summary
status: complete
record_role: historical-analysis
package: P30
source_kind: repository-markdown
repository: https://github.com/everyinc/compound-engineering-plugin
commit: 0a2957852e2034d04eb01120fd7da6ed5307dc56
trust_class: practitioner
created: 2026-08-08
updated: 2026-08-08
---

# Compound Engineering Agentic System Source Brief

**Navigation update, 2026-09-11:** This is the historical P30 documentation review. The [current Compound Engineering dossier](../../../../../repositories/everyinc--compound-engineering-plugin/everyinc--compound-engineering-plugin-analysis.md) adds static implementation/test review at the same commit. The findings and source paths below retain their original scope and date.

**Summary**: Compound Engineering offers a more explicit governance vocabulary than GStack for learning, handoffs, reviewer independence, model identity, retuning, readiness, and action authority. Its contracts are highly transferable when separated from silent maintenance and full-autonomy behaviors.

---

## What was reviewed

- `raw/imports/agentic-repositories/compound-engineering-plugin/0a2957852e2034d04eb01120fd7da6ed5307dc56/README.md`
- `raw/imports/agentic-repositories/compound-engineering-plugin/0a2957852e2034d04eb01120fd7da6ed5307dc56/CONCEPTS.md`
- `raw/imports/agentic-repositories/compound-engineering-plugin/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-compound/SKILL.md`
- `raw/imports/agentic-repositories/compound-engineering-plugin/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-compound-refresh/SKILL.md`
- `raw/imports/agentic-repositories/compound-engineering-plugin/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-code-review/SKILL.md`
- `raw/imports/agentic-repositories/compound-engineering-plugin/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-handoff/SKILL.md`
- `raw/imports/agentic-repositories/compound-engineering-plugin/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-retune/SKILL.md`
- `raw/imports/agentic-repositories/compound-engineering-plugin/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/lfg/SKILL.md`

The files were captured from commit `0a2957852e2034d04eb01120fd7da6ed5307dc56`. No repository code, skill, script, hook, agent, setup, or test was executed.

## Source-near findings

### Compound loop and memory levels

The README frames a brainstorm, plan, work, simplify, review, compound loop in which later learnings inform future work. CONCEPTS and the compound skill distinguish an incident-level Learning from a Pattern document generalized across several learnings. This is a valuable defense against turning one episode into a universal rule.

### Governed refresh

The refresh skill uses Keep, Update, Consolidate, Replace, and Delete decisions. It also states that age alone is not staleness and that unverifiable is not false. These distinctions transfer well. Silent glossary edits, consolidation, replacement, or deletion do not fit the vault's human promotion gate and should not be adopted as default authority.

### Continuity without inherited authority

CONCEPTS and the handoff skill say a session handoff preserves continuity but grants no authority to continue. The receiving agent treats handoff content as untrusted context, and the current user decides whether work resumes. This maps directly to safe cross-session operation.

### Independence and identity provenance

CONCEPTS treats independence as a property of execution context: personas within one context are perspectives, not independent witnesses. It also requires a serving-model receipt before treating a reviewer as genuinely cross-model. The code-review and retune skills operationalize distinct contexts for review and challenge.

### Review authority

The code-review skill is report-only by default. Applying local fixes is a separate explicit mode, and severity or action metadata does not itself grant permission. This is a safer authority model for the Second Brain than fix-first review.

### Measurement-gated retuning

The retune skill refuses to claim improvement without an A/B-capable benchmark harness. It requires a baseline, a noise floor, held-out regression checks, and independent proposal and defense contexts. This strengthens the vault's existing evaluation discipline by adding a hard refusal boundary.

### Readiness and stop conditions

The LFG skill carries settled decisions, provenance, rejected alternatives, artifact readiness, and verification evidence. It stops on requirements-only, blocked, unrecognized, or unverifiable inputs. Those artifact contracts are useful; its full-autonomy push-and-pull-request behavior is not relevant to normal vault operation.

## Trust and limitations

- Trust class: practitioner.
- Strongest evidence: explicit conceptual and skill contracts.
- Missing evidence: independent outcome measurement and proof that every written contract is enforced in runtime behavior.
- Static review only: executable enforcement and actual agent behavior were not tested.

## Transfer recommendation

Prioritize its governance distinctions: learning versus pattern, continuity versus authority, perspective versus independent witness, requested model versus verified serving identity, report versus apply authority, and measurement-gated retuning.

## Exclusions

- Silent maintenance of durable vault knowledge.
- Automatic deletion, replacement, or consolidation without human review.
- LFG-style push and pull-request authority as a default.
- Claims that a written contract alone proves runtime compliance or better outcomes.
