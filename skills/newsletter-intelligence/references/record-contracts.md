# Record contracts

Canonical JSON uses schema version `1.0`, stable identifiers, explicit provenance, and atomic writes. HTML and Markdown are derived. V1 registries without a revision or integrity field remain valid migration baselines; every newly confirmed V2 review record carries integrity.

- Never store full bodies, raw MIME, attachments, remote images, tracking data, secrets, or authentication data.
- Evidence excerpts are capped at 1,200 characters; normal output is at most 600.
- `body`, `full_body`, `raw_body`, `raw_mime`, `mime`, `html_body`, and `text_body` fail validation anywhere.
- Profiles contain no score, rank, recommendation, or approval field.
- Decisions are `selected`, `not_selected`, or `undecided`; exports are provisional until confirmed import.
- Signal evidence status is `verified`, `partially_verified`, `unverified`, `contradicted`, or `stale_risk`.
- Original source claims remain immutable; verification adds evidence and status.
- Priority context is dated navigation, not a topic allowlist. Optional link-candidate `discovery_lenses` use only `adjacent_enabler`, `convergence`, `strategic_surprise`, `emergent_topic`, or `exploratory`; optional `topic_hypotheses` are bounded provisional labels. Neither field changes source eligibility, personal priorities, or durable knowledge.
- A `weekly_review_decisions` manifest is provisional until its required SHA-256 integrity block validates and an explicit confirmation creates an immutable `review_event`.
- Integrity is SHA-256 over canonical JSON with recursively sorted property names and without the record's `integrity` property. Its canonicalization identifier is `newsletter-intelligence-canonical-json/v1`.
- Registry patches require the expected revision, reject unknown targets and invalid decisions, preserve untouched entries, and increment the revision exactly once. A stale revision causes no write.
- Confirmed review-event imports are idempotent by `event_id`; canonical record arrays are validated before their atomic replacement.

Prefer List-ID for identity; otherwise combine normalized sender domain and recurring publisher identity. Preserve all senders. Conflicts become ambiguity records.

After 30 complete days, `not_selected` sources keep their profile and decision but lose issue JSON, derived issue HTML, exports, and caches. Undecided records are retained.
