# Revision Loop

## Roles

- **Producer**: creates or revises the artifact.
- **Validator**: judges the artifact against contracts and returns findings.
- **Orchestrator**: routes work, tracks attempts, and decides advance, retry, or escalation.
- **Evidence owner or user**: supplies missing inputs and resolves decisions.
- **Learning skill**: aggregates repeated failure patterns after the run.

Keep producer and validator passes distinct even when the same model performs them sequentially.

## Loop

1. Producer creates artifact version `vN`.
2. Validator returns `PASS`, `REVISE`, or `BLOCK`.
3. On `REVISE`, orchestrator sends only material findings, passed-check protections, and relevant inputs to the producer.
4. Producer returns `vN+1` with a finding-resolution note.
5. Validator checks previous findings first, then regressions and new material issues.
6. On `PASS`, orchestrator advances the artifact.
7. On `BLOCK`, orchestrator requests the named evidence, review, or user decision.

## Finding States

- `open`
- `resolved`
- `persistent`
- `regressed`
- `superseded`

Do not create a new ID merely because wording changed.

## Retry And Stop Rules

- Allow at most two automatic producer revisions for the same validation cycle.
- Stop early when the same critical or major finding persists unchanged.
- Escalate when producer and validator interpret the contract differently.
- Do not retry when the required fix depends on unavailable evidence.
- Do not weaken a profile or relabel a finding to manufacture `PASS`.

After stopping, diagnose one primary cause:

- insufficient input;
- ambiguous contract;
- wrong stage or profile;
- producer execution failure;
- validator overreach;
- genuinely unresolved strategic decision.

## Revision Packet

Send the producer:

- artifact version;
- open critical and major findings;
- exact required corrections;
- inputs already available;
- sections that passed and should be preserved;
- prohibited scope expansion;
- attempt number.

Do not send a complete replacement answer. The producer remains responsible for synthesis.

## Learning Handoff

Send a learning signal when:

- the same category fails in two or more artifacts;
- one severe failure exposes a missing guardrail;
- a profile creates repeated false positives;
- the loop reaches its retry limit;
- user feedback contradicts a validator assumption.

Classify the lesson as case-specific, profile-specific, producer-skill-specific, framework-specific, or system-wide.
