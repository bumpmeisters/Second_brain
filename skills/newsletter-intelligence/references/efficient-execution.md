# Efficient weekly execution

Use this path after link gating and explicit confirmation.

1. Group the newsletter claim, primary page, paper/report, verification, and promotion state into one `source_family`.
2. Put up to ten confirmed links in one `recommended_batch` review file.
3. Run `tools/newsletter_batch.py prepare`; do not hand-build candidate and gate JSON.
4. Run `tools/newsletter_batch.py preflight` before retrieval. `retrieval_pending_network` is a controlled handoff state, not a failed intelligence preparation.
5. Run `tools/newsletter_batch.py retrieve` only after confirmation and a `ready` preflight. It keeps the ten-link ceiling and uses larger bounded limits only for declared research papers.
6. Run `tools/newsletter_batch.py extract`. Read the section index first; load source text by relevant ranges instead of placing the entire source in context at once.
7. Use Light for deterministic triage or section routing, Medium for normal synthesis, and High only for difficult methodological or contradiction analysis.
8. Validate all analysis records with `tools/newsletter_batch.py validate`.
9. Run `tools/newsletter_batch.py build-review`. Present `chat-review.md` in chat and import only explicitly labeled decisions. Do not use the ambiguous verb `übernehmen`; distinguish `hold akzeptieren`, `Korrektur`, `weitere Verifikation`, `Promotion vorschlagen`, and `zurückstellen`.

Keep one canonical JSON file per completed phase. Temporary part files may be retained during interrupted work, but after a validated merge the canonical file is authoritative and parts are not inputs to later phases.

The chat review is the default. An offline HTML rendering is optional and must not be required for review or promotion.

Every gate-closing chat response states four things explicitly:

1. whether the current step is complete;
2. whether the overall intent is complete;
3. which capabilities or actions remain unauthorized;
4. the exact reply that would open the next gate, when one exists.

Accepting a hold closes only that verification branch. Requesting a promotion creates a proposal and never authorizes a durable wiki write by itself.
