---
type: source-summary
status: active
package: P33
wave: W1
sources:
  - raw/Clippings/Copilot Cowork Tutorial Organize OneDrive Files and Build Excel Reports.md
created: 2026-08-16
updated: 2026-08-16
---

# Copilot Cowork OneDrive and Excel Source Brief

**Summary**: Practitioner tutorial showing a folder-scoped Microsoft 365 agent that classifies and moves documents, creates a formula-bearing spreadsheet, and asks for action approvals. The durable workflow is already covered more rigorously by the vault's scoped-permission, verification, and human-gate guidance.

## What the source shows

- The user gives the agent one OneDrive folder link and a concrete classification-and-summary task (05:20–06:43).
- The agent reads six sample files, proposes folders, requests approvals for mutations, and creates an Excel summary (07:00–10:31).
- A follow-up converts mixed currencies using a web lookup and rewrites the workbook; the demonstration inspects the resulting formulas and values (11:20–13:21).

## Caveats

- This is a single creator demonstration tied to a course offer, not a reliability or security evaluation.
- “Approve all” and “always allow” broaden authority and should not be generalized from the demo.
- The displayed reasoning, model labels, product behavior, exchange rate, and connector capabilities are time-sensitive and not independently checked.
- The workbook is visually inspected once; there is no representative test set, accounting reconciliation, permission audit, rollback test, or repeated-run evidence.

## Decision recommendation

`registered-only`. The useful pattern—small input scope, inspectable action plan, approvals before writes, and verification of the resulting artifact—is already covered by [[applied-ai-use-cases]], [[mcp-and-tool-access]], [[agent-evaluation]], and [[agent-security]]. No target-page change or reusable artifact is justified.
