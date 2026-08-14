---
type: practice
status: active
description: "Establish system, data, access, schema, secret, backup, recovery, and cost boundaries before an AI automation scales beyond a personal experiment."
use_when: "An AI automation will be shared, commercialized, connected to multiple applications, or used across customers or teams."
avoid_when: "Owners, data classes, access rules, recovery expectations, or required security and legal review are undefined."
output: "An approved boundary, access, schema, secret, recovery, cost, and migration record."
sources:
  - raw/Clippings/313  The things you must know before starting to build any AI automation with Kevin Williams.md
created: 2026-08-01
updated: 2026-08-01
---

# AI Automation Foundation and Separation Gate

**Summary**: Before a personal AI experiment becomes shared infrastructure, define and test the boundaries that prevent applications, customers, credentials, data, and recovery paths from becoming one fragile system.

---

## Trigger

Run this gate before an automation crosses any of these boundaries:

- one person to another user or team;
- one application to several connected applications;
- internal use to customer, partner, or public use;
- one business or customer context to several contexts;
- local experimentation to a service that must be recoverable and maintained.

The underlying practitioner interview describes how convenient shared databases, folders, repositories, and credentials became difficult to separate after several applications and customer uses accumulated. That experience is useful as a failure-mode report, not as proof that one product stack is universally correct (source: 313  The things you must know before starting to build any AI automation with Kevin Williams.md).

## Inputs

- Named business, technical, data, security, and recovery owners appropriate to the risk.
- Intended users, environments, applications, customers, and prohibited uses.
- Data inventory with sensitivity, residency, retention, and allowed-use classifications.
- Current and proposed repositories, databases, file stores, integrations, identities, and credentials.
- Existing schemas, naming conventions, backups, cost controls, and recovery expectations.
- Required security, privacy, legal, contractual, and customer review.

## Procedure

1. **Classify the scale transition.** Record what changes in users, applications, customers, external exposure, data, and operational consequence.
2. **Draw the system boundary.** Identify which components may share infrastructure and which need separate projects, environments, repositories, databases, identities, or storage.
3. **Separate data and access.** Map each data class to allowed users, agents, tools, environments, backups, and retention rules. Use least privilege and explicit promotion between scopes.
4. **Define schema and naming.** Give records, tables, files, variables, and application namespaces unambiguous meanings. Check for collisions, duplicates, and incompatible definitions before adding another workflow.
5. **Protect secrets.** Keep credentials out of prompts, source files, repositories, generated artifacts, and ordinary backups. Use approved secret storage, scoped credentials, revocation, rotation, and bounded spending or usage controls.
6. **Create recoverable state.** Version the permitted code and operating instructions, define backups separately from source control, test restoration, and retain rollback paths for configuration and data changes.
7. **Document the operating core.** Maintain modular, versioned instructions for purpose, architecture, approved tools, current issues, task state, and accepted lessons. Route each lesson to the smallest relevant module.
8. **Plan migration before expansion.** Identify coupled data, credentials, integrations, and users; define the safe sequence, validation checks, rollback point, and responsible approver.
9. **Verify the foundation.** Test access denial, secret exclusion, schema integrity, backup restoration, rollback, cost limits, and representative application behavior.
10. **Approve or stop.** Record the remaining risks and approve, revise, defer, or reject the scale transition.

## Output

Produce one dated foundation record containing:

- transition and system-boundary map;
- data, identity, access, and environment matrix;
- schema and naming contract;
- secret-storage, rotation, revocation, and cost-control record;
- backup, restore, rollback, and incident path;
- migration sequence, tests, owners, approvals, and unresolved risks.

## Guardrails

- This gate does not replace a security architecture review, privacy assessment, legal advice, contractual approval, or production readiness review.
- A Git repository is not automatically an appropriate backup, database, or secret store. Use it only for approved, versionable material.
- Never place plaintext credentials in prompts, tracked files, generated documentation, or broadly accessible backups.
- Separation is driven by actual data, access, customer, operational, and recovery boundaries, not by a rule that every application needs its own stack.
- Practitioner recommendations and named-product mechanics may age quickly. Recheck current platform behavior and organizational controls before implementation.
- Passing the gate does not authorize broader autonomy. Apply [[ai-governance]], [[agent-security]], and explicit human approvals to consequential actions.

## Related pages

- [[ai-operating-system]]
- [[ai-governance]]
- [[agentic-systems]]
- [[reliable-ai-capability-rollout]]
- [[agent-security]]