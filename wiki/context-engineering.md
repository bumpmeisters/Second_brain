---
type: concept
status: active
trust: unverified
sources:
  - "raw/Clippings/André M. Bajorat Ich bau mir die Apps, wie sie mir gefallen! 13 - TokenMade - AI Use Cases.md"
  - "raw/Clippings/Claude Code als Betriebssystem fürs eigene Business CLAUDE.md, Skills & Konnektoren  Hendrik He.md"
  - "raw/Clippings/Wie Christian Byza ein Company Brain gebaut hat & TokenMade Event in München 20.md"
  - "raw/Clippings/Notion nachgebaut, Legal Agent, Aroma-Prediction Dr. Sara Marquart von Planet A Foods zeigt ihre.md"
  - "raw/Clippings/Token Made OKR-Software mit Claude Code 09 - TokenMade - AI Use Cases.md"
  - "raw/Clippings/Vom Screenshot zur Automatisierung Wie Max ohne Code-Kenntnisse ein Reinigungssystem baut 11.md"
  - "raw/Clippings/Wie ein CTO mit Claude seine 11s vorbereitet  David Nellessen 32 - TokenMade - AI Use Cases.md"
  - "raw/Clippings/Ziel 5 Menschen, 1.000 AI-Agenten 10 - TokenMade - AI Use Cases.md"
  - research/assets/06_AI_Prompting/02_Context_Engineering
  - research/imports/karpathy-method-agentic-workflows-ai-synthesis-2026-06-10.txt
  - raw/assets/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/Karparthy 10x blueprint/The Karpathy Method Blueprint (1).docx
  - raw/Clippings/AI Agent Harness, 3 Principles for Context Engineering, and the Bitter Lesson Revisited.md
  - raw/Clippings/AgentOps Lessons from Over 1,400 Production Deployments of AI Systems.md
  - https://www.growthunhinged.com/p/claude-skills-gtm-and-pricing
  - https://thinkingmachines.ai/news/learning-to-replicate-expert-judgment-in-financial-tasks/
  - raw/Clippings/Sales Pipeline Radio - Matt Heinz and Jason Yarborough.md
  - raw/imports/automated-clippings/youtube/UCLKPca3kwwd-B59HNr-_lvA/2026-08-17--WP3hjUXd918.md
created: 2026-06-03
updated: 2026-10-08
---

# Context Engineering

**Summary**: Research cluster for designing structured context, source packets, constraints, and templates that improve LLM outputs.

---

The context engineering folder contains eight files focused on LLM frameworks, creative problem solving, B2B content marketing, and marketing template blueprints (source: research/assets/06_AI_Prompting/02_Context_Engineering; analysis: wiki/_outputs/ai-research-ingest-2026-06-03.json).

The core idea to preserve is that output quality depends heavily on the quality of the input context: audience, job-to-be-done, source evidence, constraints, examples, brand rules, and desired output structure (source: research/assets/06_AI_Prompting/02_Context_Engineering; claim requires verification).

The later Karpathy-method blueprint sources sharpen this into a broader operating principle: context engineering is not only prompt writing, but the design of the whole working environment around the model. A good AI environment supplies the goal, sources, examples, rules, verification routines, reusable skills, and hard guardrails so the model has less room to invent missing context (source: The Karpathy Method Blueprint (1).docx; source: pasted-text.txt; product-specific claims unverified).

In this vault, [[ai-work-blueprint]] is the practical entry point for applying context engineering: define the spec, define the verifier, and decide what should be preserved in the environment for the next run.

The production-agent clippings add three operational verbs: **reduce** irrelevant or redundant context, **offload** durable state to files and tools, and **isolate** subtasks that do not need the full conversation history. Context engineering is therefore also context budgeting: deciding what belongs in the active window, what belongs in persistent memory, and what belongs in a separate worker context (source: AI Agent Harness, 3 Principles for Context Engineering, and the Bitter Lesson Revisited.md; source: AgentOps Lessons from Over 1,400 Production Deployments of AI Systems.md).

## Context trajectory and reset

Context quality depends not only on what is present, but also on the path by which the working conversation arrived there. Repeated corrections followed by superficial agreement can indicate a contaminated trajectory: earlier assumptions may still shape later reasoning even when the model appears to concede. In that case, stop repairing the same session. Write a short handoff containing the goal, accepted evidence, constraints, rejected assumptions, and next step, then restart from that curated state (source: [[newsletter-intelligence-week4-2026-07-18]]; AI synthesis of a practitioner interview, with model- and task-specific thresholds excluded).

For long work, use staged compaction between research, design, planning, and execution. Preserve decisions and evidence, not the full conversational residue. This extends the existing reduce–offload–isolate pattern without treating a larger context window as automatically better (source: [[newsletter-intelligence-week4-2026-07-18]]).

## Choose the context strategy from measured constraints

Choose among full history, staged compaction, retrieval, and file browsing from the actual constraint set: model context capacity, available hardware, cache economics, task-specific recall needs, and measured latency. Do not compact by default or treat one retrieval method as universally superior; test the smallest strategy that preserves the evidence and decisions the task must recall (source: 2026-08-17--WP3hjUXd918.md; practitioner evidence; analysis: P43-W6R5-C02).

## Separate durable method from current evidence

For recurring GTM research, preserve the method in the context system but date the market evidence. A minimal reusable workflow is:

1. Assemble a bounded context packet containing the decision, audience, constraints, existing vault knowledge, and known gaps.
2. Propose the research plan and source priorities before broad collection.
3. Prefer primary evidence; use newsletters and practitioner material as discovery maps.
4. Produce a decision-ready synthesis that separates evidence, inference, contradiction, and open questions.
5. Attach dates and freshness triggers to time-sensitive claims so the method remains reusable without making old market evidence look current.

This is a durable operating method distilled from practitioner material and the vault's existing evidence rules. It does not validate any current market claim made by the source (source: [Growth Unhinged practitioner workflow](https://www.growthunhinged.com/p/claude-skills-gtm-and-pricing); commercial source, unverified performance claims).

## Customer-company-system overlap

For GTM workflows, context quality can be tested as an overlap problem across three domains: what the customer is trying to achieve and has already experienced, what the company is trying to achieve and how it operates, and what the available systems can represent and activate. A useful context design increases the relevant overlap while making gaps visible; it does not simply maximize the amount of data supplied to the model (source: Sales Pipeline Radio - Matt Heinz and Jason Yarborough.md; mixed practitioner interview).

This is a design lens rather than evidence that a particular martech architecture or agent platform is superior.

## Useful Leads

- Create reusable context packets for recurring marketing tasks.
- Separate source evidence from instructions and output format.
- Link context engineering work to [[briefing-system]], [[brand-system]], and [[content-quality]].
- Treat durable instructions, wiki pages, templates, skills, examples, and guardrails as parts of the same context system.
- Use spec maturity only where it adds reliability: `spec-first` for normal work, `spec-anchored` for multi-step work, and `spec-as-source` for repeatable or technical workflows.

## Capturing expert judgment

Expert context is not only more text. Define the task with expert distinctions, identify model-label disagreements, route contested cases back to experts and retain a held-out set. Missing public sample sizes make this method more durable than the source's numerical superiority claims (source: [[week3-primary-verification-dossier-2026-07-16]]).

## Open questions

- Which context templates should become standard for marketing work in this vault?
- Which context claims are backed by real tests rather than model-generated advice?
- Which prompt-level rules are important enough to become hard guardrails or approval gates?

## Accountable intent-to-proof context

Keep a traceable chain from the originator's intent and accepted requirements to the technical plan, implementation, tests, and review. Name the acceptance owner, constraints, files/order/risks, and the evidence that would establish completion. Record justified deviations with the work so a later handoff can reconstruct the decision.

Treat changes to model, prompt, skill, hook, or other workflow configuration as reasons to run relevant regression evaluations. Turn observed incidents into suitable evaluation cases; propose improvements from traces rather than allowing unsupported automatic rule rewrites. This sharpens the existing specification lifecycle using vendor/practitioner proposals, not measured productivity evidence. Illustrative test-set sizes and control bands are not universal quotas or security policies.

Source and review boundary (P58-C02, user-approved 2026-09-21):

- `raw/Clippings/BMAD's Founder on the Future of AI Coding (And the Slop Apocalypse).md` — [[ai-engineering-source-review-2026-09-21]].
- `raw/Clippings/Claude Codes New INTENT.MD, What is It.md` — [[ai-engineering-source-review-2026-09-21]].
- `raw/Clippings/The AI-Native SDLC playbook  Claude by Anthropic.md` — [[ai-engineering-source-review-2026-09-21]].

## Kontext aus der fachlichen Frage ableiten

Die TokenMade-Interviews konkretisieren vorhandenes reduce–offload–isolate:

- Eine schlanke Startinstruktion kann zum passenden Prozess und zur Person-/Projektseite in einer gemeinsamen Ablage routen. TM21 verwendet dieselbe Notion-Wissensbasis für Menschen und KI; TM07 entwickelt Datei-/Projektkontext aus konkreten Aufgaben. Gemeinsame Ablage belegt keine identischen Zugriffsrechte. (source: raw/Clippings/Wie ein CTO mit Claude seine 11s vorbereitet  David Nellessen 32 - TokenMade - AI Use Cases.md; 16:25–22:33; qualifizierter Interviewbericht, nicht unabhängig verifiziert.) (source: [[raw/Clippings/Claude Code als Betriebssystem fürs eigene Business CLAUDE.md, Skills & Konnektoren  Hendrik He.md|TM07-Originaltranskript]]; 7:33–10:38; 14:28–18:44; qualifizierter Interviewbericht, nicht unabhängig verifiziert.)
- Fachlich gepflegte Stammdaten und häufige Bewegungsdaten dürfen unterschiedliche Ablagen haben, brauchen aber stabile Zuordnung. TM04 trennt diese Datenarten; TM14 verknüpft Rohstoff, Rezeptur, Probe, Analytik und Sensorik über IDs. Vollständigkeit und richtige Verknüpfung bleiben prüfpflichtig. (source: raw/Clippings/André M. Bajorat Ich bau mir die Apps, wie sie mir gefallen! 13 - TokenMade - AI Use Cases.md; 15:22–16:17; qualifizierter Interviewbericht, nicht unabhängig verifiziert.) (source: raw/Clippings/Notion nachgebaut, Legal Agent, Aroma-Prediction Dr. Sara Marquart von Planet A Foods zeigt ihre.md; 5:09–9:37; qualifizierter Interviewbericht, nicht unabhängig verifiziert.)
- Unterschiedliche Fragen benötigen unterschiedliche Abrufverträge: vollständige Zeitraum-/Schwellenlisten über strukturierte Filter, konkrete Aussagen über zugeordnete Originaltexte. Siehe [[customer-conversation-evidence-workflow]]. (source: raw/Clippings/Token Made OKR-Software mit Claude Code 09 - TokenMade - AI Use Cases.md; 7:37–12:44; 19:14–20:12; qualifizierter Interviewbericht, nicht unabhängig verifiziert.)
- Marken-/Architektur-/Zielkontext muss zur konkreten Aufgabe passen. TM11 und TM24 beschreiben gezielte Briefings; TM19 widerspricht kontextfreier Zielgenerierung. Personen-/Workshop-Simulation bleibt eine Hypothesenquelle und ersetzt kein reales Befragen. (source: raw/Clippings/Wie Christian Byza ein Company Brain gebaut hat & TokenMade Event in München 20.md; 9:56–12:36; 24:45–26:27; qualifizierter Interviewbericht, nicht unabhängig verifiziert.) (source: raw/Clippings/Ziel 5 Menschen, 1.000 AI-Agenten 10 - TokenMade - AI Use Cases.md; 7:34–10:50; qualifizierter Interviewbericht, nicht unabhängig verifiziert.) (source: raw/Clippings/Vom Screenshot zur Automatisierung Wie Max ohne Code-Kenntnisse ein Reinigungssystem baut 11.md; 27:13–30:29; 31:26–34:30; qualifizierter Interviewbericht, nicht unabhängig verifiziert.)

P61-C06: Präzisierung des bestehenden Kontextmodells. Keine technische Überlegenheit von Notion, Files, SQL oder RAG ohne lokale Aufgabe/Evaluation.

Methodische Übernahme: P61-C06; Rolf, ausdrückliche Freigabe 2026-10-08. Quellen- und Verifikationsgrenzen bleiben erhalten.

## Related pages

- [[tokenmade-ai-use-cases-source-review-2026-10-08]]

- [[ai-prompting-research-library]]
- [[prompt-engineering-research]]
- [[ai-work-blueprint]]
- [[agentic-prompting]]
- [[briefing-system]]
- [[brand-system]]
- [[production-agent-engineering-clippings-june-2026]]
- [[ai-workflow-builder-clippings-june-2026]]
