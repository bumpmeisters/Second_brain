---
type: analysis-output
status: active
created: 2026-08-04
updated: 2026-08-04
---

# YouTube subscription inventory

**Summary**: Structured snapshot of the channels subscribed to in the authenticated YouTube account, prepared for filtering, clustering, content monitoring, and other downstream tasks.

## Dataset

- File: `wiki/_outputs/youtube-subscriptions-2026-08-04.json`
- Records: 169
- Source page: https://www.youtube.com/feed/channels
- Extracted: 2026-08-04
- Fields per record: `name`, `handle`, `channel_path`, `url`, `subscribers`, `notification`

## Use notes

- Treat `subscribers` as a display string, not a precise numeric count.
- `notification` is one of `all`, `personalized`, `none`, or `unknown`.
- Refresh before time-sensitive analysis because subscriptions and channel metadata change.
- This is an account-state export, not an ingested raw source and not evidence for durable factual claims.

