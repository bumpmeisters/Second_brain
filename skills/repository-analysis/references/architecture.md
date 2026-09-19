# Architecture lens

Map the problem, major components and the flow between them. Explain why boundaries exist by tracing actual files; distinguish a documented rationale from your inference. Include configuration, dependencies and host integrations only where they change behavior.

For each important boundary ask: what owns state, what crosses it, what remains stable and what can fail? Compare a normal path with one failure or resumption path. A directory name does not establish a runtime boundary; identify the code or explicit contract that supplies it.

Output a compact system map with source paths and two or three representative entry points when available. Avoid reconstructing every file in prose. Keep surprising coupling, deliberate omissions and costs as findings alongside strengths.
