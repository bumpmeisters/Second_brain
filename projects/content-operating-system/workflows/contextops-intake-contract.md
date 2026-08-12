# ContextOps Intake Contract

## Purpose

Define the minimum referenced upstream context required before the Content Operating System creates a Strategic Creative Direction.

## Ownership

The Content Operating System owns this intake contract. The source project and Marketing ContextOps own the referenced evidence and decisions. The packet is a manifest, not a duplicate dossier.

## Required inputs

| Field | Requirement |
|---|---|
| `context_packet_id` | Stable ID for this handoff version. |
| `source_project` | Existing repository-relative project path. |
| Content mode | Explicitly select `personal-authority`, `client`, or `hybrid`; never infer a personal profile for client work. |
| Business objective | Exact decision or outcome content should support. |
| Audience context | Exact audience-profile reference and version plus selected segment, situation, trigger, question, tension, or job, with evidence status. |
| Positioning | Approved positioning, message house, or explicit statement that it is not required. |
| Campaign role | Strategic communication job or explicit non-campaign purpose. |
| Claims and proof | Approved, blocked, uncertain, and missing claims with canonical references. |
| Brand and voice constraints | Exact voice-profile route. Personal authority may use Rolf's shared profile; client work requires a client or source-project profile. |
| Rights and confidentiality | Allowed sources, named entities, personal experience, client or employer boundaries. |
| Freshness | Date-sensitive claims and required revalidation. |
| Open questions | Missing inputs that may affect direction or execution. |

## Readiness verdicts

- `ready`: all material inputs exist and the direction can be decided without invention.
- `ready-with-hypotheses`: explicitly labeled hypotheses may be explored but not published as facts.
- `blocked`: a missing upstream decision, evidence, right, or user judgment would materially change the direction.

## Leakage rules

The packet may name the communication job and constraints. It must not choose the final thesis, creative angle, narrative route, hook, format, channel execution, or copy.

## Routing

- Missing audience context returns to audience understanding or the source-project owner.
- Personal authority work may reference `publishing/identity/personal-content-audience.md`; client work blocks rather than falling back to it.
- Missing positioning returns to proof-led positioning or the relevant authority.
- Missing campaign role returns to Campaign Role Architecture when campaign work is intended.
- Unsafe claims return to claim governance.
- Missing personal experience or rights returns to Rolf.

## Acceptance check

Another agent can create a Creative Direction by reading the packet and its references without rereading the entire source project or inventing an upstream decision.
