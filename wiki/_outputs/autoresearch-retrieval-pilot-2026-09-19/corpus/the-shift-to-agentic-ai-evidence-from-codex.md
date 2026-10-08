---
type: source-summary
status: active
sources:
  - https://cdn.openai.com/pdf/5d1e1489-21c0-43e4-9d42-f87efdbf0082/the-shift-to-agentic-ai-evidence-from-codex.pdf
created: 2026-07-15
updated: 2026-07-15
---

# The Shift to Agentic AI: Evidence from Codex

**Summary**: OpenAI's 50-page economic-research paper documents a shift from conversational assistance toward delegated production. Its strongest contribution is a measurement model for agent adoption; its usage evidence does not by itself prove productivity or generalize from OpenAI to ordinary organizations.

---

## What the source is

The paper analyzes aggregated Codex usage across three populations: personal-account users, organizational-account users, and OpenAI employees. The authors use automated, privacy-protecting classification rather than manually reading underlying user messages (source: [OpenAI paper](https://cdn.openai.com/pdf/5d1e1489-21c0-43e4-9d42-f87efdbf0082/the-shift-to-agentic-ai-evidence-from-codex.pdf)).

## Research question and method

The research asks how adoption, task allocation, and depth of use change when AI can execute multi-step work with tools. It studies active use, token share, inferred job roles and task categories, estimated human task horizons, skill use, runtime, and concurrency. The analysis is observational; it compares patterns across populations but does not randomly assign agent access or estimate a causal productivity effect (source: OpenAI paper).

## Main findings

- Active Codex users grew more than fivefold during the first half of 2026.
- More than 10% of users managed three or more concurrent Codex agents during a week, and 26.6% used reusable skills.
- By June 2026, Codex represented 99.8% of combined Codex and ChatGPT output tokens inside OpenAI, compared with 63.3% for organizational users and 16.5% for personal users.
- Non-developer adoption grew quickly, while external adoption remained substantially less broad than usage inside OpenAI.
- Heavy users differed qualitatively from occasional users: they delegated longer tasks, used skills, and coordinated parallel workstreams (source: OpenAI paper).

The durable interpretation is that the relevant unit is a delegated workflow, not a chat message. Measurement should therefore cover what work was delegated, what the system executed, how the result was verified, and how humans coordinated multiple streams (analysis based on the paper).

## Limitations

- OpenAI is unusually favorable: marginal usage is cheap, model familiarity is high, internal buy-in is strong, and knowledge sharing is common. The authors explicitly say it is not representative of a typical organization.
- Output tokens measure generated activity, not useful output, quality, adoption, revenue, or time saved.
- Human task horizons are model-estimated and described by the authors as directional.
- Usage data shows diffusion and workflow change, not whether jobs were improved, displaced, or reorganized successfully.

## Pages updated from the source

- [[agentic-systems]]
- [[agent-evaluation]]
- [[ai-native-product-management]]

## Related pages

- [[agent-skill-design]]
- [[loop-engineering]]
- [[ai-governance]]