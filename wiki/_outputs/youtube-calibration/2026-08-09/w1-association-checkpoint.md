---
type: youtube-calibration-association-checkpoint
status: approved-and-associated
calibration_id: cal_20260809T134951_d8a97d68
wave: W1
eligible_association_count: 4
reclip_required_count: 0
not_yet_live_count: 2
created: 2026-08-09
approved_by: Rolf
approved_on: 2026-08-09
---

# YouTube Calibration W1 — Exact-File Association Checkpoint

**Summary**: W1 contains four uniquely identifiable eligible transcript files and two not-yet-live announcements. Approval of this checkpoint authorizes only the four exact associations below. It does not authorize reading or semantically processing transcript bodies.

**Approval record**: Rolf confirmed the four exact associations on 2026-08-09 with the response “W1-Zuordnungen bestätigt”. All four associations were then created without modifying their source files.

## Exact associations proposed

| Code | Video ID | Exact clipping | SHA-256 | Transcript characters | Custody |
|---|---|---|---|---:|---|
| C010 | `RmS5s6Wbin4` | `raw/Clippings/Gadgets Personal app vibe coding that is actually safe — Kenton Varda, Cloudflare 1.md` | `5b75c3b7f023810b2a4177adb5c580fee0c98d9f13a65a317513a05d2cf021ff` | 17,378 | untracked, unstaged |
| C015 | `xOFkpf9KgKg` | `raw/Clippings/Your AI Second Brain Is Slowly Rotting (Here's How to Fix It).md` | `80a0170dbc36e0f7d492b33cdcd698d4a6b27d58141768de752c954edba96f17` | 22,067 | untracked, unstaged |
| C101 | `IGkDOvcoa-8` | `raw/Clippings/Copilot Cowork Tutorial Organize OneDrive Files and Build Excel Reports.md` | `1b7e0fcc07aa7500ce52979d388d57ab045da010dcc6a422203c440b77d1571a` | 14,921 | untracked, unstaged |
| C114 | `PPMr7ORpg-k` | `raw/Clippings/Earley AI Podcast – Ep 96 AI in Clinical Trials, the Vibe Coding Fallacy, and Bending Eroom's Law.md` | `6bfe9f908e44b68bf99c586d6a2ea948f3c29d3b992dc4ab53ccc85ca20e1199` | 53,281 | untracked, unstaged |

## Association receipts

| Code | Association ID | Result |
|---|---|---|
| C010 | `as_20260809T175209_af363ace` | associated; source unmodified |
| C015 | `as_20260809T175217_654fd8f2` | associated; source unmodified |
| C101 | `as_20260809T175225_8025ec8a` | associated; source unmodified |
| C114 | `as_20260809T175232_f4a7065a` | associated; source unmodified |

## Exceptions

### Resolved C010 clipping mismatch

The first file, `raw/Clippings/Gadgets Personal app vibe coding that is actually safe — Kenton Varda, Cloudflare.md`, does not contain C010. Its frontmatter identifies C015 (`xOFkpf9KgKg`), and its SHA-256 is identical to the correctly named C015 clipping. It remains untouched and unassociated. The new `... Cloudflare 1.md` file correctly identifies C010 and is included above.

### C029 and C075 — announcements

Rolf confirmed that both Christopher Penn “How to …” entries are announcements for future live sessions. Their disposition is `not-yet-live`; they are excluded from the current transcript wave without being classified as irrelevant or as semantic-ingest failures. Publication does not trigger automatic processing: any later reconsideration requires a new clipping and checkpoint.

## Approval boundary

Approval authorizes Codex to associate only the four listed paths with their existing handoffs, after rechecking each exact hash and custody state. It does not authorize transcript-body access, semantic ingest, wiki claim promotion, scheduling, embeddings, or channel prioritization.
