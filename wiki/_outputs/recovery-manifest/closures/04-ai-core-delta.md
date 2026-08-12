# Recovery wave 04: AI core delta

- **Status:** closed
- **Closed:** 2026-08-12
- **Baseline reviewed:** `main` at `9109ee867ca495e2136d0664e919aa260b7f041a`
- **Historical snapshot:** `codex/abm-operating-system` at `64eccfa93a4861d857630f4dbdf0c1bdf2fbbd23`
- **Scope:** five final `recover` rows assigned to `04-ai-core-delta`

## Intended use and decision criteria

This report is the versioned closure receipt for the five historical post-PR-10 page deltas. It records whether each mixed file revision could safely replace or extend the current AI core page; it does not validate the underlying sources or approve their claims.

A historical addition was eligible only when its cited evidence was available in the current repository or already admitted through the relevant source gate, its internal links resolved on current `main`, it did not regress an existing citation, and it could be separated from later recovery waves without changing its meaning. Unsupported or cross-wave additions were not promoted.

## Result

| Candidate | Closure | Reason |
|---|---|---|
| `wiki/agent-evaluation.md` | `superseded` | The added evaluation methods depend primarily on missing newsletter and curated-wiki artifacts assigned to waves 09 and 11, plus local-only repository evidence. The mixed revision also weakens existing source-link formatting. Keep current `main`; re-evaluate claims from their canonical sources in the assigned waves. |
| `wiki/agent-security.md` | `superseded` | The added control and handoff claims depend on missing wave-09/wave-11 pages or local-only repository evidence. The current page already preserves the supported security baseline without those unresolved dependencies. |
| `wiki/agentic-systems.md` | `superseded` | The added repository evidence ladder, adoption claims, interface guidance, and harness-evolution sections cross wave 09, wave 11, and local-only source custody. Several related pages do not yet exist on `main`. |
| `wiki/ai-governance.md` | `superseded` | The foundation, adoption, and knowledge-boundary additions rely on local-only clippings and missing wave-09/wave-11 artifacts. The mixed revision also removes an existing research-page link. |
| `wiki/applied-ai-use-cases.md` | `superseded` | The adoption, coaching, and build-versus-buy additions rely on local-only clippings and missing reusable-practice pages assigned to waves 09 and 11. The mixed revision also converts existing source links to less useful plain paths. |

## Supported and unsupported portions

- **Supported:** the five candidate paths, frozen blob identities, and assigned wave were verified against the private binding manifest; every candidate was compared with the current page on `main`.
- **Unsupported for promotion in this wave:** claims whose evidence lives only in protected local source custody, generated local outputs, or not-yet-recovered wiki artifacts.
- **Explicitly rejected inside the mixed revisions:** replacements of working wiki-style source references with plain filenames or code-formatted paths, and links to pages absent from current `main`.
- **Not rejected:** the underlying source material. Its manifest disposition remains unchanged. Waves 09 and 11 may independently recover their assigned canonical artifacts, and any later semantic promotion must follow the applicable source-selection and evidence gates.

## Approval state

No new semantic claim is approved by this closure. The five manifest rows are closed as `superseded`, not silently omitted. The historical workspace and backup remain untouched under the manifest retirement gate.
