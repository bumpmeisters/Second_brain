---
type: source-summary
status: active
package: P33
wave: W6
sources:
  - raw/imports/automated-clippings/youtube/UCjIMtrzxYc0lblGhmOgC_CA/2026-07-30--jhVKliA9Jpk.md
created: 2026-08-16
updated: 2026-08-16
---

# Live AI Writing Process Source Brief

**Summary**: Live practitioner demonstration of conversational long-form drafting. Its durable delta is a controlled co-writing loop that reorients from the exact current draft, separates uncertain reasoning from the live manuscript, preserves the human's rough intent before cleanup, verifies source wording, and checks actual write state.

## Durable workflow signal

- Re-establish shared state by reading the current section exactly before deciding the next edit; the author rejects a summary when exact wording is needed (00:04:33–00:09:28).
- Keep uncertain reasoning and alternative formulations in a separate brainstorming document until the argument is clear enough to move into the draft (00:13:30–00:19:30).
- Capture the author's rough take first, then propose a cleaned version that preserves its meaning; the human listens, corrects, and decides what enters the manuscript (00:16:49–00:20:54).
- Verify quotations and timelines against the raw source repository rather than relying on source notes or conversational memory (00:21:28–00:29:50).
- Confirm that an edit actually reached the live draft. When it did not, the assistant explicitly disclosed the failed save instead of pretending completion (00:35:14–00:44:03).

## Caveats

- This is one informal livestream, not a controlled evaluation of writing quality, productivity, voice fidelity, or model performance.
- The draft itself contains historical and technical claims that remain in progress. The transcript is not evidence for the history of Codex, OpenAI's priorities, reasoning models, or company organization.
- Voice interaction can lower friction but may also hide wording errors, source drift, tool latency, or unsaved state. Exact source checks and artifact verification remain necessary.
- The stream promotes Every, a voice guide, and a course. Product and workflow benefits are not independently validated.

## Decision recommendation

`extended-claim` for [[content-engineering-pipeline-contract]]: add a bounded co-writing branch that restores exact draft state, keeps exploratory reasoning outside the accepted manuscript, records human intent before cleanup, verifies quotations against the original source, applies only agreed edits, and verifies saved state. The assistant must expose failed retrieval or mutation rather than imply success. No new artifact or skill is warranted because the existing contract already owns staged, source-grounded drafting and verification.
