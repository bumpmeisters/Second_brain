---
type: source
source_type: youtube-transcript
title: "OpenAI Just Announced The New Plugin Standard for AI Agents"
source: "https://www.youtube.com/watch?v=M3gHlwHKsBI"
video_id: "M3gHlwHKsBI"
channel_id: "UCwvXnrOCRlhokHlJwohf2OA"
channel: "The AI Automators"
published_at: "2026-08-07T16:28:52Z"
acquired_at: "2026-08-15T11:24:31.057253Z"
language: "de"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 360
last_transcript_second: 361.600
transcript_coverage: 1.004444
transcript_words: 1158
payload_sha256: "8c845fee52cd898a214044192d7d5303f45f5619a7ea37ad50422adcf639bfde"
---
# OpenAI Just Announced The New Plugin Standard for AI Agents

## Creator description

👉 Access our AI Architects course & join hundreds of serious AI builders in our community: https://www.theaiautomators.com/?utm_source=youtube&utm_medium=video&utm_campaign=tutorial&utm_content=agent-plugin-standard

🔗 Agent Plugins
Specification: https://agent-plugins.org/specification
Compatible clients: https://agent-plugins.org/compatible-clients
Example repo (this is the one with the migration skill): https://github.com/agentplugins/agent-plugins-example
Anthropic's knowledge work plugins (the one migrated in the video): https://github.com/anthropics/knowledge-work-plugins/tree/main/legal

🔗 The announcements
Vercel: https://vercel.com/blog/introducing-agent-plugins
Google: https://developers.googleblog.com/agent-plugins-package-your-skills-tools-and-more/
AWS: https://aws.amazon.com/blogs/opensource/aws-supports-agent-plugins-an-open-standard-for-portable-agent-extensions/

🔗 Plugins you can look at today
AWS Agent Toolkit: https://github.com/aws/agent-toolkit-for-aws
Vercel's own plugin: https://vercel.com/docs/agent-resources/vercel-plugin
Plugins in ChatGPT and Codex: https://learn.chatgpt.com/docs/plugins

The skills you have already written don't have to stay locked to one coding agent. A new open standard called Agent Plugins lets you bundle Agent Skills and MCP servers into a single folder that works across Codex, ChatGPT, Cursor, GitHub Copilot, Kiro and VS Code, with Google joining more recently.

A plugin under this standard is just a directory. Your skills folder, exactly as you already have it, a plugin.json manifest, and an mcp.json where your MCP servers live. That is the portable core, and it is a much simpler file structure than you would expect from a spec with this many big names on it.

The part to be clear-eyed about is what doesn't come along for the ride. Only skills and MCP servers travel. Commands, hooks, agents, rules and LSP servers all stay client-specific and get buried in a namespaced folder that other clients skip. That is likely to be the biggest criticism of the spec, though the reasoning is that those pieces are still too tied to individual tools to pin down, which is fair enough.

There's one big name absent here, and that's Anthropic. Anthropic isn't a maintainer, Claude Code isn't a launch client, and they haven't said anything publicly about it. So in this video I take Anthropic's own legal knowledge work plugin, point Codex at the migration skill in the first-party example repo, and port it over to the new standard, then run one of its skills from a completely different project.

I also cover the awkward bit, because installing one of these locally was harder than it should have been. Codex and Cursor both expect plugins to arrive from a marketplace, so this doesn't feel as portable as just dropping a skill into a project. The standard defines the folder structure that travels between agents. It doesn't define how those plugins get distributed or loaded. And the usual disclaimer applies to any externally sourced plugin: only use ones from reputable sources or ones you understand well.

Whether it lasts comes down to adoption, and I think it's a very positive move to have some consistency between agents so you can jump back and forth between them. It's simple enough to get picked up widely. If Anthropic started using it, that would be practically guaranteed, but there's a good chance we end up with one format for Anthropic and another for everyone else, the way Claude Code uses CLAUDE.md while nearly every other agent uses AGENTS.md.

⏱️ Timestamps:

0:00 Intro
0:56 A plugin is just a folder
1:50 What travels, what stays client-specific
2:30 Migrating an Anthropic plugin to the new standard format
3:46 The install problem
4:50 Will this standard last

## Transcript

[00:00:00](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=0s) Viele namhafte Unternehmen der KI-Branche

[00:00:01](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=1s) haben gerade einen neuen offenen Standard

[00:00:04](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=4s) namens Agent-Plugins angekündigt. Das bedeutet, dass

[00:00:06](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=6s) man mehrere Agent-

[00:00:08](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=8s) Skills und MCP-Server bündeln kann, die dann sofort auf

[00:00:10](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=10s) vielen verschiedenen

[00:00:12](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=12s) Agenten funktionieren. Was bedeutet das alles also? Wie

[00:00:15](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=15s) fängt man an? Und worin

[00:00:16](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=16s) unterscheidet sich dies von Fähigkeiten und Plugins, die Sie

[00:00:18](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=18s) vielleicht bereits verwenden? Um den Kontext zu verdeutlichen: Bei

[00:00:20](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=20s) gängigen

[00:00:22](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=22s) Codierungsagenten haben wir in der Regel Zugriff auf Plugins, mit denen

[00:00:24](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=24s) wir die Fähigkeiten der Codierungsagenten erweitern können

[00:00:26](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=26s) . Durch die Auswahl eines solchen

[00:00:28](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=28s) Plugins

[00:00:30](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=30s) erhält man beispielsweise wiederverwendbare Funktionen und

[00:00:32](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=32s) Verbindungen zu externen Diensten. Dieser

[00:00:34](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=34s) neue Standard zielt darauf ab, dass ein solcher

[00:00:36](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=36s) Plugin-Typ mit einer

[00:00:37](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=37s) Vielzahl verschiedener Agenten kompatibel ist. Dieser

[00:00:40](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=40s) Standard wird

[00:00:42](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=42s) von vielen Akteuren der Branche, darunter seit

[00:00:44](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=44s) Kurzem auch von Google, recht häufig übernommen.

[00:00:45](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=45s) Wenig überraschend

[00:00:47](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=47s) fehlt in dieser Norm ein wichtiger Akteur:

[00:00:49](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=49s) Anthropic. Ich werde Ihnen aber eine

[00:00:50](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=50s) Methode zeigen, mit der Sie Anthropic-

[00:00:52](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=52s) Plugins auf diesen neuen Standard migrieren können, sodass sie auch

[00:00:54](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=54s) für all diese anderen Codierungsagenten funktionieren

[00:00:56](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=56s) . Ein Plugin ist nach diesem Standard

[00:00:58](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=58s) lediglich ein Verzeichnis. Wir haben einen

[00:01:00](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=60s) Ordner namens „skills“, der mehrere Skills enthalten kann,

[00:01:02](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=62s) und dann haben wir eine Datei namens „plugin.json“,

[00:01:04](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=64s) die ein Manifest darstellt. Das ist eine sehr

[00:01:06](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=66s) einfache Datei. Und dann gibt es noch die

[00:01:07](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=67s) Datei mcp.json, in der die MCP-Server gespeichert werden können

[00:01:10](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=70s) . Das Plugin hier ist also im Grunde

[00:01:12](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=72s) nur eine Sammlung von Fähigkeiten sowie

[00:01:14](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=74s) eine mcp.json-Datei, die es uns ermöglicht, die

[00:01:16](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=76s) Integration mit anderen Diensten durchzuführen. Im Grunde genommen

[00:01:19](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=79s) umfasst diese Spezifikation nur die Fertigkeiten und MCP.

[00:01:22](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=82s) Alles andere hängt von Ihrem

[00:01:24](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=84s) Kunden oder Ihrem Codierungsagenten ab. Viele

[00:01:26](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=86s) Dinge, auf die man sich bei der Verwendung eines

[00:01:28](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=88s) Codierungsagenten verlassen kann, wie die Verwendung von Befehlen und

[00:01:30](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=90s) Hooks, sind im

[00:01:31](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=91s) Hauptteil dieser Spezifikation nicht enthalten. Das muss

[00:01:33](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=93s) in einem kundenspezifischen Ordner gespeichert werden.

[00:01:37](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=97s) Das dürfte der größte

[00:01:38](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=98s) Kritikpunkt an dieser Spezifikation sein, aber wahrscheinlich waren die

[00:01:40](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=100s) Schöpfer dieser Spezifikation der Ansicht, dass

[00:01:42](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=102s) all diese Elemente noch zu

[00:01:45](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=105s) kundenspezifisch sind, um sie für alle

[00:01:47](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=107s) verschiedenen Codierungsagenten eindeutig festzulegen, was

[00:01:49](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=109s) wohl durchaus berechtigt ist. Innerhalb der

[00:01:51](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=111s) Ordnerstruktur des Agenten-Plugins

[00:01:53](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=113s) finden wir also diesen portablen Kern, die

[00:01:54](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=114s) plugin.json, die skills und die

[00:01:56](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=116s) mcp.json. Dann können Sie aber

[00:01:58](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=118s) einzelnen Clients ermöglichen, Funktionen hinzuzufügen, ohne

[00:02:01](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=121s) den portablen Kern zu verändern. Zum Beispiel

[00:02:03](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=123s) Hooks, die von einem bestimmten

[00:02:05](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=125s) Code-Agenten verwendet werden könnten. Aktuell habe ich zwei

[00:02:07](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=127s) Plugins in Code X im Einsatz, die

[00:02:09](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=129s) diesen neuen offenen Standard nutzen. Aktuell

[00:02:12](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=132s) sind folgende Clients kompatible Plattformen: GitHub, Kiro,

[00:02:15](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=135s) ChatGPT und Code X, Cursor, VS Code und jetzt auch

[00:02:19](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=139s) Google. Wenn Sie den Pi-Code-

[00:02:21](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=141s) Agenten verwenden, gibt es außerdem ein Pi-Agent-Plugin-

[00:02:24](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=144s) Paket in dessen Paketkatalog. Ich

[00:02:26](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=146s) habe das übrigens selbst noch nicht benutzt, also

[00:02:28](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=148s) schau es dir auf jeden Fall vorher an, wenn

[00:02:29](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=149s) du es verwenden willst. Um die Verwendung von

[00:02:31](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=151s) Plugins mit diesem offenen Standard zu testen, habe

[00:02:33](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=153s) ich mir das

[00:02:35](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=155s) Beispiel-Repository für Agenten-Plugins angesehen, das von den

[00:02:37](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=157s) Betreuern der Spezifikation erstellt wurde. Und dieses

[00:02:39](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=159s) [räuspert sich] Repository enthält eine Funktion, mit der

[00:02:40](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=160s) Sie bestehende Claude-,

[00:02:42](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=162s) Copilot-, Code X- und Cursor-spezifische Plugins

[00:02:45](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=165s) auf diese portablere Spezifikation migrieren können.

[00:02:47](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=167s) Unabhängig davon bietet Anthropic

[00:02:49](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=169s) auf GitHub einige sehr beliebte Wissensarbeits-Plugins an

[00:02:51](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=171s) . Einige davon hatten die

[00:02:53](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=173s) Aktienmärkte Anfang des Jahres verunsichert. Zunächst werde

[00:02:55](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=175s) ich aber

[00:02:56](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=176s) das Migrations-Plugin auswählen, von dem ich gesprochen habe

[00:02:57](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=177s) , und ich werde das

[00:02:59](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=179s) Anthropic Legal Knowledge Work Plugin bereitstellen.

[00:03:02](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=182s) Von da an drücke ich einfach die

[00:03:03](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=183s) Eingabetaste und lasse Code X seine Arbeit tun.

[00:03:05](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=185s) Nach ein paar Minuten sieht es so aus, als ob

[00:03:07](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=187s) dies auf den neuen Standard übertragen wurde,

[00:03:09](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=189s) und es sieht korrekt aus. Wir haben die

[00:03:09](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=189s) plugin.json, die mcp.json und alle darin enthaltenen

[00:03:12](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=192s) Skills. Wenn wir nun

[00:03:14](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=194s) in Code X zu den Plugins gehen, werde ich die Seite

[00:03:16](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=196s) aktualisieren, und jetzt können wir sehen, dass wir

[00:03:18](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=198s) hier dieses neue Rechtsagenten-Plugin haben. Wenn ich näher darauf eingehe

[00:03:20](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=200s) , sehen wir, dass wir über diese Fähigkeiten und

[00:03:22](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=202s) MCP-Server verfügen. Wenn ich auf „Installieren“ klicke,

[00:03:24](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=204s) sollte es installiert werden. Da dieses

[00:03:26](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=206s) Plugin standardmäßig MCP-Server enthält,

[00:03:29](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=209s) wurde mir lediglich einer dieser

[00:03:30](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=210s) Anmeldebildschirme angezeigt, den ich vorerst überspringen werde

[00:03:32](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=212s) . Wenn ich jetzt aber zu einem ganz

[00:03:33](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=213s) anderen Projekt wechsle und die Taste "/" drücke

[00:03:35](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=215s) , zum Beispiel "juristisch", dann erscheinen plötzlich

[00:03:37](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=217s) all diese verschiedenen Funktionen,

[00:03:39](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=219s) die wir nutzen können. Wenn

[00:03:41](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=221s) ich beispielsweise auf „Compliance-Check“ klicke, dann

[00:03:42](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=222s) erneut darauf klicke, erscheint

[00:03:44](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=224s) die entsprechende Funktion. Das ist ja

[00:03:46](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=226s) alles schön und gut, aber ich hatte anfangs

[00:03:47](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=227s) Probleme, als ich versuchte,

[00:03:49](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=229s) diese Plugins überhaupt lokal zu installieren, da

[00:03:51](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=231s) Agenten wie Code X und Cursor beide davon

[00:03:54](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=234s) ausgehen, dass man Plugins von

[00:03:55](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=235s) Marktplätzen installiert. Wenn also ein Entwickler

[00:03:57](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=237s) eines dieser Open-Standard-Agent-Plugins

[00:04:00](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=240s) auf den Online-Marktplatz für den von

[00:04:02](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=242s) Ihnen verwendeten Codierungsagenten hochlädt, sollte die

[00:04:03](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=243s) Installation sehr einfach sein. Der

[00:04:05](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=245s) Entwickler kann

[00:04:07](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=247s) das Plugin dann

[00:04:09](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=249s) möglicherweise ohne große

[00:04:11](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=251s) oder gar keine Änderungen daran auf anderen Marktplätzen hochladen. Damit das Ganze

[00:04:13](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=253s) lokal auf meinem Computer funktioniert,

[00:04:15](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=255s) musste ich Code X dazu bringen, eine

[00:04:16](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=256s) marketplace.json-Datei zu erstellen und Code X mitzuteilen,

[00:04:19](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=259s) wo die Plugins zu finden sind, was

[00:04:21](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=261s) definitiv nicht ideal ist. Meinem

[00:04:23](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=263s) Verständnis nach ist dies also nicht

[00:04:25](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=265s) so portabel wie das einfache Laden einer

[00:04:27](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=267s) Agentenfähigkeit in ein Projekt. Der offene Standard

[00:04:29](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=269s) definiert die tatsächliche Ordnerstruktur,

[00:04:31](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=271s) die auf verschiedenen

[00:04:32](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=272s) Agenten portierbar sein soll, beinhaltet aber nicht die

[00:04:35](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=275s) Verteilung oder das Laden dieser Plugins

[00:04:37](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=277s) für Sie. Und natürlich muss ich noch etwas hinzufügen:

[00:04:38](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=278s) Wenn Sie

[00:04:40](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=280s) Plugins von externen Anbietern verwenden, gilt der gleiche

[00:04:42](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=282s) Haftungsausschluss wie

[00:04:43](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=283s) für Skills und MCP-Server: Verwenden Sie nur solche Plugins,

[00:04:46](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=286s) die aus seriösen Quellen stammen oder die

[00:04:48](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=288s) Sie sehr gut verstehen. Wird

[00:04:50](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=290s) dieser Standard also Bestand haben?

[00:04:52](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=292s) Das ist im Moment die große Frage.

[00:04:54](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=294s) Standards stehen und fallen damit, wie

[00:04:56](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=296s) weit verbreitet sie sind. Ich halte es für einen

[00:04:57](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=297s) sehr positiven Schritt, dass es eine gewisse

[00:04:59](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=299s) Kontinuität zwischen den Agenten gibt, sodass wir flexibel

[00:05:01](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=301s) zwischen ihnen wechseln können. Für

[00:05:02](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=302s) Anwender von KI-Agenten gilt: Je mehr offene

[00:05:05](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=305s) Standards wir haben, desto besser. Wer

[00:05:07](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=307s) im selben Projekt Claude-Code oder Code X verwendet hat,

[00:05:08](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=308s) kennt diese

[00:05:10](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=310s) kleinen Probleme: Man benötigt

[00:05:12](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=312s) eine agents.md-Datei und eine claude.md-Datei.

[00:05:15](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=315s) Möglicherweise benötigen Sie zwei Sätze von

[00:05:17](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=317s) Kompetenzdateien, von denen einer auf den anderen verweist.

[00:05:19](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=319s) Dies kann zu Mehraufwand,

[00:05:20](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=320s) Redundanzen und Inkonsistenzen führen, die wiederum

[00:05:22](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=322s) Probleme in Projekten verursachen können. Dies ist ein

[00:05:24](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=324s) wirklich einfacher Standard, der das

[00:05:26](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=326s) Potenzial hat, ziemlich weit verbreitet zu werden.

[00:05:28](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=328s) Wenn Anthropic damit anfangen würde,

[00:05:30](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=330s) wäre das so gut wie sicher, aber es besteht

[00:05:31](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=331s) eine gute Chance, dass wir in der Welt der Agenten-Plugins

[00:05:33](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=333s) ein Format für

[00:05:35](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=335s) Anthropic und ein anderes Format für

[00:05:36](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=336s) alle anderen haben werden. Wenn Sie mehr

[00:05:38](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=338s) über diesen Standard erfahren möchten, können Sie

[00:05:39](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=339s) die Links in der Beschreibung anklicken. Wenn Sie

[00:05:40](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=340s) lernen möchten, wie man

[00:05:42](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=342s) KI-Systeme auf Expertenniveau von Grund auf entwickelt, dann

[00:05:44](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=344s) klicken Sie auf den Link in der Beschreibung zu

[00:05:45](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=345s) unserem Kurs „KI-Architekten“ und unserer

[00:05:47](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=347s) Community. Dort erhalten Sie über 50

[00:05:49](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=349s) Lektionen, die alles von der Agentenabfrage bis zum

[00:05:51](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=351s) Harness-Engineering abdecken. Sie

[00:05:52](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=352s) erhalten Zugang zu all unseren anderen

[00:05:53](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=353s) Ressourcen, Starter-Apps und einem globalen

[00:05:56](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=356s) Netzwerk von KI-Entwicklern. Danke fürs

[00:05:58](https://www.youtube.com/watch?v=M3gHlwHKsBI&t=358s) Zuschauen und bis zum nächsten Mal.
