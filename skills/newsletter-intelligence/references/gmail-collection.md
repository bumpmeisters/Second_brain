# Bounded Gmail collection

1. Call `gmail_get_profile`; stop if the identity differs from the configured dedicated mailbox.
2. Use `after:YYYY/MM/DD before:YYYY/MM/DD -in:spam -in:trash`.
3. Display the staging root and sync boundary; require acceptance before body reads.
4. Search metadata/IDs first, paginate with returned tokens, and deduplicate IDs.
5. Batch-read only unprocessed IDs. The initial smoke is capped at ten messages.

Never request raw MIME, read attachments, follow links, or mutate Gmail. Advance checkpoints only after atomic validation. On timeout, record failure without advancing the page token.

Any send, draft, label, archive, trash, delete, forward, unsubscribe, attachment, or bulk-modification operation is a hard stop.
