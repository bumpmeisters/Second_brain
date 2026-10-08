---
type: decision-gate
status: active
description: "Prevent multiple internal teams from sending duplicated, contradictory, excessive, or badly sequenced communications to the same account."
use_when: "Multiple product, solution, regional, partner, or account teams share an account or buying group and plan customer-facing activation."
avoid_when: "Account identity, contact policy, ownership, consent or legal basis, or current communication history cannot be established."
output: "An approved account-contact plan with primary owner, coordinated sequence, suppressions, exceptions, expiry dates, notifications, and audit record."
sources:
  - raw/Clippings/Accela propels sales to success by implementing Demandbase One.md
created: 2026-07-30
updated: 2026-07-30
---

# Multi-Team Account-Contact Coordination Gate

**Summary**: Coordinate customer-facing activity at account level before activation so several internal teams do not duplicate, contradict, overwhelm, or badly sequence their communications.

---

## Trigger

Use this gate when product, solution, regional, partner, campaign, seller, or account teams share an account or buying group and at least two customer-facing activities could overlap.

## Required inputs

- Verified account and stakeholder identity, including unresolved identity ambiguity.
- Planned and recent touches with message, offer, channel, timing, audience, owner, purpose, and status.
- Current account state, relationship context, opportunity or service context, and known customer preferences.
- Consent, legal basis, suppression, frequency, channel, privacy, and retention rules.
- Named account coordinator, contributing teams, decision authority, and escalation owner.

## Procedure

1. Inventory every active and planned touch in one account-level view.
2. Check for duplicate asks, contradictory messages, competing offers, excessive frequency, stakeholder overload, sequence breaks, opt-outs, sensitive events, and ownership conflicts.
3. Reconcile the plan with the accountable seller or account owner and affected teams.
4. Choose one primary account narrative and sequence. Merge compatible touches; resequence dependent work; suppress, defer, or reject unnecessary activity.
5. Approve exceptions only with a documented reason, audience, owner, expiry date, risk review, and notification rule.
6. Record the approved plan, decision owner, allowed actions, suppressions, dependencies, customer feedback, and next review.
7. Inspect replies, complaints, opt-outs, missed handoffs, and recurring collision types; update the plan and shared rules.

## Inspectable output

A dated account-contact plan with one primary owner; coordinated stakeholder, message, offer, channel, and timing sequence; suppressions and exceptions; governance checks; and a collision and customer-feedback audit record.

## Reuse boundaries

The Hexagon case supports the collision problem, cross-functional ABM Council, unified activity view, and coordinated path. Detailed governance controls are vault additions (source: Accela propels sales to success by implementing Demandbase One.md; body title: *Hexagon takes the guessing game out of ABM with insights from Demandbase*; sections “The head scratcher,” “What'd they do?” and “How'd they do?”).

This gate does not prove buyer intent, authorize contact, override consent or legal requirements, or establish that coordination caused engagement or revenue. Vendor product, targeting, personalization, performance, and causal claims remain excluded.

## Related pages

- [[marketing-orchestration]]
- [[abm-sales-marketing-operating-contract]]
- [[reusable-practices-library]]
- [[reusable-practices-router]]
