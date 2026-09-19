---
type: source-summary
status: active
package: P33
wave: W1
sources:
  - raw/Clippings/Your AI Second Brain Is Slowly Rotting (Here's How to Fix It).md
created: 2026-08-16
updated: 2026-08-16
---

# Second-Brain State and Event Maintenance Source Brief

**Summary**: Practitioner account of contradictions between compact core memory, retrieved wiki pages, daily logs, and external research. It sharpens the vault's maintenance model by separating mutable current state from immutable historical events and requiring human review before reconciliation changes.

## Durable maintenance signal

- The source identifies contradictions between always-loaded memory and later-retrieved knowledge as the central failure mode (03:18–07:06).
- It distinguishes current state, which may supersede an earlier value, from dated events, which remain append-only history (10:58–12:11).
- Its audit pauses before changing the knowledge base and asks the user to approve which material is actually stale (14:34–15:08).
- It recommends an explicit current-state section plus a dated event log rather than relying on dates alone (15:13–17:32).

## Caveats

- The source is a sponsored practitioner video promoting the author's own skill and starter repository.
- The reported compliance percentage, six-month corpus size, and claim that stale retrieval “basically never” occurs are self-reported and excluded.
- State/event classification can itself be ambiguous. Reconciliation must preserve provenance and history, surface contradictions, and require accountable review before deletion or replacement.

## Decision recommendation

`extended-claim` for `wiki/semantic-ingest-workflow.md`: during ingest and consistency review, distinguish mutable current-state assertions from historical events. Supersede state only with dated provenance and explicit review; preserve events as history; do not let an agent silently delete contradictory evidence. This integrates into the existing workflow rather than creating a new artifact because the vault already separates mutable wiki state from the append-only log and immutable sources.
