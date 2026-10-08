---
type: source
source_type: youtube-transcript
title: "LLM Knowledge Bases: a practical guide — Ben Holmes, Warp"
source: "https://www.youtube.com/watch?v=I3bpdgFJCUY"
video_id: "I3bpdgFJCUY"
channel_id: "UCLKPca3kwwd-B59HNr-_lvA"
channel: "AI Engineer"
published_at: "2026-08-12T17:00:22Z"
acquired_at: "2026-08-15T11:23:12.732092Z"
language: "de"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 1277
last_transcript_second: 1276.009
transcript_coverage: 0.999224
transcript_words: 4246
payload_sha256: "db4f1bc5a8530e0294d61c06162e6013d737365e7af6ba62c73a6681c8afefb0"
---
# LLM Knowledge Bases: a practical guide — Ben Holmes, Warp

## Creator description

Talking runs about 200 words a minute and typing does not, which is why Ben Holmes starts a knowledge base with voice dictation rather than with organization. The pipeline only works if there is enough raw material, so the capture step is deliberately sloppy: ramble into your phone after a podcast or a meeting, skip the formatting, and let agents impose structure afterward. He points at Handy and Voice Ink as local, on device options, so none of it needs a subscription.

Structure then arrives in passes. An enrich note skill stamps each file with a timestamp so later runs know what has been processed, assigns tags from a fixed reference list instead of inventing new ones, since as he puts it Claude loves to get creative, researches the source on the web, and adds backlinks found by key term search. On top of that pile, a wiki generated from a Karpathy gist produces browsable entries for the people, concepts, organizations, and sources buried in your own notes. Then the whole thing runs on a schedule in a cloud sandbox: the Obsidian headless CLI syncs the markdown down, the agent enriches whatever is not yet stamped, and it syncs back, so you wake up to a refreshed wiki he describes as the daily paper except it is yours. The closing trick is a graph view of every note, built in HTML and Tailwind purely by asking an agent for it, which turns out to be a decent map of where your own thinking has gaps.

Speaker info:
- https://x.com/bholmesdev
- https://bholmes.dev
- https://linkedin.com/in/bholmesdev

Timestamps:
0:00 - The disorganized notes folder problem
1:30 - Where we are going: raw notes to a browsable wiki
2:46 - Getting raw thoughts down is the hard part
3:25 - Why dictation beats typing
4:02 - Local voice tools that need no subscription
5:17 - Be scrappy, you need volume
5:53 - What an enriched note looks like
6:32 - The enrich note skill
7:11 - Tagging from a fixed list, not inventing new ones
7:49 - Running the skill
9:07 - Following your own rabbit holes
9:45 - Generating a wiki over the notes
11:40 - The Karpathy gist behind the idea
12:54 - Wikis for work: people, meetings, sources
13:31 - Making it run without you
14:10 - Local automations against cloud ones
15:29 - Syncing markdown into a sandbox and back
16:45 - Waking up to a fresh wiki
18:01 - Visualizing the whole notebook
18:39 - A graph view built by asking for it
19:17 - Finding the gaps in your own thinking
20:30 - Tools mentioned

## Transcript

[00:00:01](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1s) [Musik]

[00:00:12](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=12s) Alles klar. Sind wir startklar?

[00:00:15](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=15s) Okay, wir sind startklar. Seid ihr alle bereit

[00:00:18](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=18s) loszulegen? Sind

[00:00:19](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=19s) wir bereit? In Ordnung. Los geht's! Äh

[00:00:22](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=22s) , okay. Nun, hallo zusammen

[00:00:24](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=24s) . Ich bin Ben Holmes,

[00:00:26](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=26s) Leiter der Entwicklerbeziehungen bei Warp. Äh, vielleicht

[00:00:29](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=29s) haben Sie schon von Warp gehört, einem Terminal, das sich hervorragend

[00:00:30](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=30s) für Sie und Ihre

[00:00:32](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=32s) Codierungsagenten eignet. Vielleicht haben Sie auch schon davon

[00:00:34](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=34s) als Cloud-Plattform gehört, die Ihnen beim

[00:00:36](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=36s) Aufbau von Softwarefabriken hilft. Falls Sie noch

[00:00:38](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=38s) nicht dort waren, wir haben einen Stand auf der Messe.

[00:00:40](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=40s) Sie können gerne mit uns darüber sprechen. Äh, aber

[00:00:42](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=42s) heute werde ich eigentlich

[00:00:44](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=44s) über etwas sprechen, das man LLM-Wissensdatenbanken nennt

[00:00:46](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=46s) . Äh, vielleicht eine Handzeichenaktion? Wie

[00:00:49](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=49s) viele Leute haben einen Apple-Notizen-Ordner,

[00:00:51](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=51s) der ein völlig unorganisiertes Chaos ist und

[00:00:54](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=54s) mit dem man nichts anzufangen weiß? Okay, eine ganze Menge

[00:00:55](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=55s) Leute. Äh, und wie viele von euch

[00:00:58](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=58s) haben Obsidian schon einmal benutzt? Vielleicht. Und

[00:01:00](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=60s) wie viele von Ihnen nutzen es mittlerweile regelmäßig?

[00:01:04](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=64s) Es sind etwas weniger Menschen. Das ist in Ordnung

[00:01:06](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=66s) . Äh, ich werde euch da eigentlich nicht

[00:01:08](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=68s) allzu viel zeigen, aber wenn

[00:01:10](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=70s) ihr Obsidian-Fans seid, ist dieser Vortrag

[00:01:11](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=71s) definitiv etwas für euch.

[00:01:13](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=73s) Wir werden also darüber sprechen, wie

[00:01:15](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=75s) Sie all Ihre

[00:01:17](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=77s) unstrukturierten Gedanken und Notizen, die Sie

[00:01:19](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=79s) sowohl während Ihres Studiums als auch im Rahmen Ihres LLM-Studiums sammeln, so organisieren können, dass

[00:01:21](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=81s) Sie sie tatsächlich

[00:01:23](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=83s) durchschauen, verstehen und sich sogar an

[00:01:25](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=85s) Ideen erinnern und diese wiederentdecken können, die Sie vielleicht schon

[00:01:27](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=87s) vergessen hatten. Ähm, unser Ziel ist es also, von diesem wirren Durcheinander verstreuter

[00:01:34](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=94s) Gedanken wie diesem

[00:01:37](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=97s) zu etwas Schönem, Organisiertem

[00:01:40](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=100s) und Anschaulichem wie diesem zu gelangen. Aber ich greife vor

[00:01:42](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=102s) . Äh, unser Ziel ist es,

[00:01:45](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=105s) zunächst mit einem einfachen Ordner zu beginnen, der

[00:01:48](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=108s) all Ihre Gedanken enthält. In diesem Beispiel werden wir

[00:01:49](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=109s) unsere Notizen im Markdown-Format erfassen

[00:01:52](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=112s) . Und ich zeige euch

[00:01:54](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=114s) die App, die ich selbst entwickelt habe,

[00:01:56](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=116s) namens Hubble, mit der ihr darin

[00:01:58](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=118s) einfach navigieren und Notizen schreiben könnt.

[00:02:00](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=120s) Äh, aber Sie können jeden beliebigen Markdown-Viewer verwenden,

[00:02:02](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=122s) Warp, Obsidian, was auch immer Sie möchten.

[00:02:05](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=125s) Dann werden wir darüber sprechen, wie Sie

[00:02:07](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=127s) diese unfertigen Gedanken in etwas

[00:02:09](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=129s) Organisierteres und

[00:02:10](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=130s) Zusammenhängenderes verwandeln können. So werden anregende Notizen erstellt, um

[00:02:13](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=133s) verwandte Backlinks zu verknüpfen und

[00:02:15](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=135s) Dinge anhand von Kategorien zu taggen, damit Sie

[00:02:17](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=137s) sie finden können oder damit Agenten

[00:02:18](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=138s) sie finden können. Dann werden wir noch etwas genauer

[00:02:20](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=140s) auf Wikis eingehen und tatsächlich

[00:02:23](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=143s) etwas generieren, in dem man sich durch Forschungsbereiche klicken kann,

[00:02:24](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=144s) die einen

[00:02:27](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=147s) persönlich interessieren usw., die

[00:02:30](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=150s) die Personen, Konzepte und Quellen qualifizieren, die alle

[00:02:33](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=153s) Ihre Notizen enthalten. Zum Schluss

[00:02:34](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=154s) werden wir dann noch ein wenig über Visualisierungen

[00:02:36](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=156s) wie diese schicke Diagrammansicht sprechen, die ich

[00:02:38](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=158s) Ihnen gezeigt habe. Das ist heutzutage sehr einfach,

[00:02:39](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=159s) da Agenten auf Ihren Rechner zugreifen und

[00:02:41](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=161s) HTML verwenden können. Ähm, also das Erste, worüber ich

[00:02:44](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=164s) sprechen wollte, ist, wie man seine

[00:02:46](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=166s) Gedanken überhaupt erst zu Papier bringt. Äh, weil es

[00:02:49](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=169s) heutzutage ziemlich einfach ist, Apple

[00:02:52](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=172s) Notes zu öffnen und etwas zu schreiben. Äh, aber ich

[00:02:54](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=174s) würde argumentieren, dass es noch einfacher sein sollte,

[00:02:56](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=176s) alles aufzuschreiben. Also, etwas,

[00:02:59](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=179s) das ich Ihnen hier zeigen werde, äh,

[00:03:00](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=180s) vielleicht noch einmal die Hand heben. Wie viele

[00:03:01](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=181s) Leute nutzen Whisper Flow oder etwas

[00:03:04](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=184s) Ähnliches? Okay, das sind nicht genug

[00:03:05](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=185s) Hände. Es sind ehrlich gesagt nicht genug Hände.

[00:03:08](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=188s) Ähm, weil Sie es vielleicht nicht wissen, aber

[00:03:10](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=190s) Spracheingabe ist, auch wenn es

[00:03:12](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=192s) ziemlich unangenehm ist, in Anwesenheit

[00:03:13](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=193s) von Kollegen in den Computer zu sprechen

[00:03:15](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=195s) , der schnellste Weg,

[00:03:17](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=197s) Ihre Gedanken zu Papier zu bringen.

[00:03:19](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=199s) Ich glaube, der Durchschnitt liegt bei etwa 200 Wörtern pro Minute.

[00:03:21](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=201s) Sofern Sie kein

[00:03:23](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=203s) absoluter olympischer Schreibprofi sind, ist diese Methode

[00:03:25](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=205s) schneller als jede andere, die Sie

[00:03:27](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=207s) kennen. Ich schlage daher vor, ein

[00:03:29](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=209s) Spracheingabegerät zu verwenden, um den

[00:03:31](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=211s) Kontext zu erfassen. Davon gibt es eine ganze Reihe.

[00:03:34](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=214s) Und übrigens, für diejenigen, die

[00:03:35](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=215s) kein Whisper Flow-

[00:03:36](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=216s) Abonnement haben: Ihr habt Glück. Für solche Sachen müssen Sie nicht mehr

[00:03:38](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=218s) bezahlen

[00:03:40](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=220s) . Es gibt lokale Modelle, die

[00:03:42](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=222s) das können. Nun zu einem kleinen Exkurs über

[00:03:44](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=224s) Werkzeugketten, den Sie sich vielleicht einmal

[00:03:46](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=226s) ansehen sollten. Äh, ich liebe es, diesen hier hervorzuheben

[00:03:48](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=228s) . Es heißt Handy. Äh, es ist ein Open-

[00:03:50](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=230s) Source-Tool für die Spracherkennung, das

[00:03:51](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=231s) ein lokales Modell verwendet, auf dem

[00:03:53](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=233s) Gerät bleibt und sehr einfach zu bedienen ist. Äh, da gibt es noch eine

[00:03:55](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=235s) andere Firma namens Voice Inc., die

[00:03:57](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=237s) sehr ähnlich ist. Äh, ich glaube, das hier ist

[00:04:00](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=240s) eine einmalige Gebühr von 20 Dollar, nur um

[00:04:02](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=242s) Updates in der App zu erhalten. Ich könnte es genauso gut tun,

[00:04:04](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=244s) nur um den Entwickler zu unterstützen. Das ist die, die

[00:04:06](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=246s) ich benutze. Und es bietet Ihnen eine

[00:04:07](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=247s) Schnellzugriffstaste sowie eine mobile App.

[00:04:10](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=250s) Wenn Sie also etwas aufschreiben möchten,

[00:04:12](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=252s) können Sie einfach entweder die Wahltaste oder

[00:04:14](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=254s) die Funktionstaste an Ihrem Computer gedrückt halten, und er

[00:04:15](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=255s) beginnt, alles, was

[00:04:18](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=258s) Sie sagen, aufzuschreiben und es auf der anderen Seite in einen

[00:04:20](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=260s) formatierten Satz von Sätzen,

[00:04:23](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=263s) Absätzen usw. umzuwandeln. Schneide

[00:04:25](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=265s) am Ende ein bisschen ab, aber du

[00:04:26](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=266s) kannst sehen, dass die Satzzeichen kommen.

[00:04:28](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=268s) Großartig. Und dieser ganze Text hier mit

[00:04:32](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=272s) all diesen Absätzen, das war

[00:04:33](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=273s) nur eine lange Abschrift, die ich

[00:04:35](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=275s) nach dem Hören eines Podcasts aufgeschrieben habe. Ich habe mir gerade

[00:04:38](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=278s) den Acquired-

[00:04:40](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=280s) Podcast über die Gründung von Walt

[00:04:41](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=281s) Disney angehört. Ähm, ein bisschen ungewöhnlich für mich. Äh,

[00:04:44](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=284s) aber ich fand es eine interessante Lektüre darüber,

[00:04:46](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=286s) wie solche

[00:04:48](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=288s) Unternehmen gegründet werden. Also beschloss ich,

[00:04:51](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=291s) eine Spracherkennungs-App zu verwenden und

[00:04:52](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=292s) es aufzuschreiben. Und genau so habe ich es bisher

[00:04:54](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=294s) mit all meinen Notizen gemacht.

[00:04:56](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=296s) Entweder ich setze mich an meinen Computer oder auf mein

[00:04:57](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=297s) Handy, ich tippe einfach alles ein, um

[00:04:59](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=299s) die Rohdaten zu erhalten. Der Grund, warum ich

[00:05:01](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=301s) Ihnen das vorschlage, ist folgender: Wenn Sie

[00:05:04](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=304s) an einen Punkt gelangen wollen, an dem Ihr

[00:05:06](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=306s) LMS tatsächlich Wikis, Visualisierungen

[00:05:09](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=309s) usw. generieren kann, benötigen Sie eine Menge Rohdaten. Man

[00:05:11](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=311s) benötigt eine Menge Rohstoffe. Machen Sie sich also keine

[00:05:13](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=313s) Sorgen, wenn Sie etwas

[00:05:15](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=315s) unstrukturiert oder etwas ausschweifend vorgehen. Du

[00:05:17](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=317s) formatierst die Dinge nicht mit perfekten

[00:05:18](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=318s) Stichpunkten. Das ist in Ordnung. Das Ziel sollte

[00:05:20](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=320s) einfach darin bestehen, in diesem Moment so viele Gedanken

[00:05:23](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=323s) wie möglich festzuhalten. Vielleicht handelt es sich um ein

[00:05:25](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=325s) Besprechungsprotokoll, vielleicht sind es Forschungsnotizen,

[00:05:27](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=327s) nachdem Sie eine wichtige Passage gelesen haben.

[00:05:29](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=329s) Was auch immer es ist, allein die Möglichkeit,

[00:05:31](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=331s) seine Idee aufs Papier zu bringen, macht es

[00:05:33](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=333s) für das LMS sehr effektiv,

[00:05:35](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=335s) später darauf zuzugreifen. Ähm, reden wir nun ein

[00:05:37](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=337s) wenig darüber, wie man diese Rohstoffe

[00:05:39](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=339s) in etwas Nützlicheres verwandeln kann. Äh, das ist

[00:05:41](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=341s) noch eine Notiz, die ich mir zur

[00:05:42](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=342s) Gründung von Ferrari gemacht habe. Ich bin da etwas in einen

[00:05:44](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=344s) Kaninchenbau geraten, als ich anfing,

[00:05:45](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=345s) diesem Typen zuzuhören. Und genau das

[00:05:48](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=348s) kann man erreichen, wenn man einen

[00:05:51](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=351s) LLM bittet, ein wenig Recherche für einen zu betreiben.

[00:05:53](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=353s) Sie werden also feststellen, dass sich in der Mitte

[00:05:55](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=355s) die gleiche Notiz befindet, der gleiche Stil wie bei

[00:05:57](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=357s) einem Sprachdiktat, aber

[00:05:59](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=359s) wir haben jetzt einige weitere Details. Wir können

[00:06:01](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=361s) die Schlagwörter zum Thema sehen.

[00:06:04](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=364s) Wir können also sehen, dass es sich um einen Podcast handelte. Es steht

[00:06:06](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=366s) in Zusammenhang mit diesen Schwerpunktbereichen. Sie können

[00:06:08](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=368s) auch den Quellcode einsehen. Es konnte

[00:06:10](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=370s) die URL herunterladen und finden. Es wurde auch vermerkt,

[00:06:12](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=372s) wann es angereichert wurde. Wir werden gleich darüber sprechen,

[00:06:14](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=374s) warum ich das tue. Und ganz unten

[00:06:16](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=376s) findet es auch einige

[00:06:18](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=378s) Backlinks davon. Das hängt mit dem

[00:06:20](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=380s) anderen Podcast zusammen, den du gerade gehört hast.

[00:06:21](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=381s) Verbinden wir sie nun miteinander.

[00:06:23](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=383s) Und je

[00:06:24](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=384s) mehr Dinge man herunterholt, desto enger wird dieses Netz. Äh,

[00:06:26](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=386s) und der Weg von diesem Punkt

[00:06:29](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=389s) zu etwas wie diesem führt über eine

[00:06:32](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=392s) Agentenfähigkeit, wie Sie vielleicht erwarten. Also, ich

[00:06:34](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=394s) habe hier genau die richtige Fähigkeit dafür.

[00:06:37](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=397s) Und es heißt einfach nur „Anreicherungsnote“. Enrich-

[00:06:40](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=400s) Notiz. Hier wird also lediglich gezeigt,

[00:06:42](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=402s) wie man einen Agenten anweisen könnte,

[00:06:44](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=404s) eine dieser Notizdateien zu nehmen und sie in

[00:06:46](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=406s) etwas Nützlicheres umzuwandeln. Hier heißt es also

[00:06:48](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=408s) einfach: Lasst uns

[00:06:49](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=409s) diese Note noch etwas ausschmücken. Fügen Sie einen kleinen Zeitstempel hinzu, damit das System sich daran

[00:06:53](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=413s) erinnert, dass ein

[00:06:55](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=415s) anderer Agent dies bereits in der Vergangenheit getan hat, falls wir den Agenten um eine weitere Durchfahrt bitten. Äh, lass

[00:06:58](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=418s) es ein paar Tags generieren. Ich habe

[00:07:00](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=420s) alle meine Tags in diesem kleinen

[00:07:02](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=422s) Referenzordner hier drüben abgelegt. Auf diese Weise muss der

[00:07:04](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=424s) Agent nicht jedes Mal neue Tags erfinden, wenn er den Vorgang

[00:07:06](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=426s) durchläuft und versucht,

[00:07:08](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=428s) weitere Details hinzuzufügen. Dadurch erhält es eine konkrete

[00:07:11](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=431s) Liste von Dingen, die es durchzusehen gilt. Ich

[00:07:13](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=433s) weise den Agenten sogar an, nur

[00:07:15](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=435s) ungern neue Tags hinzuzufügen, weil Claude

[00:07:17](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=437s) gerne kreativ wird. Äh, also ich wollte nur

[00:07:19](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=439s) sagen: Bitte tut das nicht. Befolgen Sie

[00:07:21](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=441s) die Anweisungen, aber wenn Sie tatsächlich

[00:07:23](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=443s) ein Muster erkennen, können Sie

[00:07:25](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=445s) dieser Liste gerne etwas hinzufügen. Das kannst du gerne tun. Ich habe ihm

[00:07:27](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=447s) auch gesagt, er solle die

[00:07:28](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=448s) Quelle mit Webtools recherchieren. Zu diesem Zeitpunkt verfügen

[00:07:30](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=450s) alle Agenten über eine Websuche. Falls nicht,

[00:07:32](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=452s) ist exa ein tolles kleines Tool, das Sie

[00:07:34](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=454s) in Ihren Algorithmus integrieren können, um das

[00:07:36](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=456s) für Sie herauszufinden. Und das Letzte sind die

[00:07:38](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=458s) dazugehörigen Notizen. Um Backlinks zu finden, verwenden Sie

[00:07:40](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=460s) einige Dateiaufrufe, suchen Sie

[00:07:42](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=462s) mithilfe der Stichwortsuche nach verwandten Notizen und fügen Sie diese am

[00:07:44](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=464s) Ende ein. Wir haben also dieses

[00:07:46](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=466s) vernetzte System. Äh, und um diese

[00:07:49](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=469s) Fertigkeit auszuführen, können Sie das natürlich auch manuell

[00:07:50](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=470s) mit jedem beliebigen Gurtzeug tun. Äh, ich werde

[00:07:53](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=473s) Warp verwenden, nur um es euch hier zu zeigen,

[00:07:55](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=475s) weil ich völlig unvoreingenommen bin. Ich bin ein

[00:07:57](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=477s) großer Fan von Warp. Können Sie es glauben? Äh,

[00:08:00](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=480s) aber es ermöglicht Ihnen auch den Zugriff auf jedes

[00:08:01](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=481s) Modell, einschließlich OpenWeight. Wenn Sie also schon immer mal

[00:08:03](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=483s) mit GLM 5.2 experimentieren wollten, dann sind Sie hier genau richtig – es ist einfach perfekt für solche

[00:08:07](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=487s) Aufgaben. Das ist natürlich möglich.

[00:08:09](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=489s) Tatsächlich werde ich gleich mal hinwechseln, um es

[00:08:11](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=491s) auszuprobieren. Und ich werde

[00:08:13](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=493s) diese Fähigkeit nun

[00:08:16](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=496s) in unserer kleinen Notiz hier vorstellen. Ich könnte jetzt gleich „

[00:08:19](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=499s) Anreicherungsnotiz“ anrufen. Und dann

[00:08:22](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=502s) werde ich diese Notiz von vorhin einfügen.

[00:08:24](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=504s) Schnapp dir den Dateipfad und sag ihm einfach, er soll

[00:08:27](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=507s) diesem Typen weitere Details hinzufügen

[00:08:29](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=509s) . Und ich kann Ihnen auch einen kompletten Durchlauf davon zeigen

[00:08:31](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=511s) . Äh, genau hier können wir

[00:08:34](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=514s) sehen, äh, das war – nun ja, wir werden gleich darüber sprechen –

[00:08:37](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=517s) aber es geht darum, es so zu

[00:08:38](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=518s) automatisieren, dass es alle

[00:08:40](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=520s) Ihre Notizen betrifft. Äh, es läuft

[00:08:43](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=523s) und findet alle Noten, die

[00:08:46](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=526s) in der Vergangenheit nicht angereichert wurden. Denken Sie also daran, dass

[00:08:48](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=528s) wir hier oben jedes Mal einen kleinen

[00:08:49](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=529s) Zeitstempel hinzugefügt haben, wenn es angereichert wird. Wenn

[00:08:51](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=531s) wir also das nächste Mal einen Agenten damit beauftragen, sollten wir nach

[00:08:53](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=533s) allem suchen, was

[00:08:54](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=534s) noch nicht getaggt ist. Der

[00:08:56](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=536s) gesamte Ablauf wird dann über alle diese Noten durchlaufen. Dabei werden

[00:08:59](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=539s) einige Änderungen an den Dateien vorgenommen, und am Ende

[00:09:01](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=541s) erhält man ein

[00:09:03](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=543s) übersichtlicheres Notizbuch als zuvor.

[00:09:04](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=544s) Das ist ganz einfach. Wir lassen diesen Kerl

[00:09:07](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=547s) im Hintergrund kochen, während ich ein

[00:09:09](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=549s) wenig über Wikis erzähle. Der nächste Schritt ist also,

[00:09:12](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=552s) nachdem wir

[00:09:14](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=554s) alles zu verwandten Ideen zusammengeführt haben. Damit könntest du durchaus einverstanden

[00:09:16](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=556s) sein. Ich werde

[00:09:18](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=558s) Ihnen zeigen, wie nützlich das schon für sich genommen ist.

[00:09:20](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=560s) Das ist jetzt so eine Art totaler Gedankenauswurf von

[00:09:23](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=563s) allem, was hier drin ist. So ähnlich fühlte ich mich beim

[00:09:25](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=565s) Lesen von „Die linke Hand der Dunkelheit“, was

[00:09:27](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=567s) übrigens ein sehr gutes Buch ist. Und wie Sie

[00:09:28](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=568s) sehen können, habe ich mir in

[00:09:30](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=570s) verschiedenen Kapiteln immer wieder Notizen gemacht, wenn ich

[00:09:32](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=572s) etwas Interessantes entdeckt habe. Und es war in der

[00:09:34](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=574s) Lage, all diese zusammengehörigen Notizen zu kombinieren,

[00:09:35](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=575s) sodass ich sie einfach durchklicken und finden kann

[00:09:37](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=577s) . Äh, ich suche jetzt nicht mehr in

[00:09:39](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=579s) meinen Apple-Notizen herum, wo

[00:09:40](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=580s) ich das letzte Mal vor etwa zwei Wochen darüber geschrieben habe

[00:09:42](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=582s) . Es kann es anhand verwandter

[00:09:45](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=585s) Themen finden. Wenn Sie also jemand sind, der gerne in

[00:09:47](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=587s) Wikipedia-Artikeln versinkt,

[00:09:49](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=589s) erfindet das Ganze quasi einen eigenen Wikipedia-Artikel

[00:09:51](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=591s) über Ihre Gedanken. Es macht irgendwie Spaß.

[00:09:53](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=593s) Äh, aber wenn wir das Ganze etwas übersichtlicher gestalten wollen

[00:09:55](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=595s) , könnten wir es anweisen,

[00:09:56](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=596s) zusätzlich ein Wiki zu generieren. Man nehme also

[00:09:59](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=599s) diese rohen Zutaten und koche sie

[00:10:01](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=601s) zusammen zu etwas Deftigerem

[00:10:03](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=603s) . Ich weiß nicht, das ist eine seltsame

[00:10:06](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=606s) Metapher. Äh, dann schauen wir uns mal diese

[00:10:08](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=608s) Wikis an. Das sind also ein paar Beispiele, die ich zu

[00:10:10](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=610s) Themen erstellt habe, die mich

[00:10:12](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=612s) interessieren. Äh, eines davon ist

[00:10:14](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=614s) wahrscheinlich vorhersehbar. Sie wissen ja, was es Neues

[00:10:15](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=615s) in Sachen KI gibt. Immer wenn ich einen Podcast höre

[00:10:18](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=618s) oder beispielsweise eine Forschungsarbeit über die

[00:10:22](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=622s) Systemkarten der neuesten Modelle lese,

[00:10:24](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=624s) möchte ich ein Wiki haben,

[00:10:28](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=628s) das all diese Informationen zusammenfasst und

[00:10:29](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=629s) nach verwandten Themen gruppiert. Dieses

[00:10:32](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=632s) Wiki, das Sie hier sehen,

[00:10:34](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=634s) zeigt Ihnen nach dem Anklicken eine Liste von

[00:10:38](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=638s) Personen, Orten und Dingen. So

[00:10:41](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=641s) beziehen wir alle unsere Quellen. Das sind also

[00:10:44](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=644s) einige der Themen, die uns am meisten

[00:10:46](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=646s) interessieren. Äh, wir sehen hier ein paar

[00:10:48](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=648s) , manche davon waren erwartet, manche

[00:10:49](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=649s) nicht. Wir sehen beispielsweise so etwas wie einen Ralph-Loop-

[00:10:51](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=651s) Kaninchenbau. Wir sehen eine

[00:10:54](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=654s) Reihe von Konzepten, die

[00:10:55](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=655s) aus all diesen Ideen abgeleitet werden. Und dann

[00:10:58](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=658s) sehen wir hier unten einige Leute – alle Leute, die

[00:10:59](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=659s) man erwarten würde, manche vielleicht nicht. Das hier

[00:11:01](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=661s) ist etwas, das ich

[00:11:03](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=663s) aus der Schnittstelle von KI und Musik zusammengestellt habe.

[00:11:05](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=665s) Adam Neely ist eigentlich ein Jazzmusiker,

[00:11:07](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=667s) der darüber spricht, wie KI

[00:11:09](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=669s) die Musikindustrie beeinflusst hat. Also habe ich

[00:11:11](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=671s) das aufgeschrieben. Ich fand es ein bisschen

[00:11:13](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=673s) interessant. Wir haben es in unser neuestes

[00:11:15](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=675s) KI-Wiki aufgenommen, damit wir es leicht wiederfinden können.

[00:11:17](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=677s) Auch Organisationen. Das würden Sie sicherlich erwarten

[00:11:20](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=680s) . Diesmal geht es eher um Musik

[00:11:22](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=682s) . Äh, das hier

[00:11:24](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=684s) sollten Sie nach diesem Vortrag ausprobieren usw. Äh,

[00:11:27](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=687s) und all das wird

[00:11:29](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=689s) programmatisch generiert. Ich habe das alles nicht geschrieben,

[00:11:31](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=691s) weil ich nur Zeit habe,

[00:11:33](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=693s) die einzelnen Zutaten zu beschaffen, anstatt sie selbst miteinander zu

[00:11:34](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=694s) verbinden. Also, dass

[00:11:37](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=697s) ein Agent das generieren muss,

[00:11:40](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=700s) das ist eigentlich äh ein Gist von Andre

[00:11:42](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=702s) Carpathy. Hier nahm die

[00:11:43](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=703s) wissensbasierte Idee des LLM-Studiengangs gewissermaßen Gestalt an

[00:11:45](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=705s) . Das findet man

[00:11:46](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=706s) heutzutage ganz einfach, wenn man einfach seinen Namen

[00:11:48](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=708s) und dann „Wiki“ eingibt. Es wird ziemlich häufig

[00:11:52](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=712s) verwendet. Das ist also das einfache

[00:11:55](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=715s) Prinzip. Wir möchten ein Rohverzeichnis nehmen, in dem

[00:11:58](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=718s) wir

[00:11:59](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=719s) all unsere zuvor gesammelten Apple-Notizen gesammelt haben,

[00:12:01](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=721s) und es mit dem jeweiligen

[00:12:04](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=724s) Themenbereich, der uns wichtig ist, zusammenführen.

[00:12:06](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=726s) Wir greifen also auf die Rohdaten zurück, erstellen ein

[00:12:08](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=728s) Wiki und können es dann nach Belieben anpassen

[00:12:11](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=731s) . Er

[00:12:13](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=733s) nennt das sogar eine Idee. Um

[00:12:16](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=736s) das neueste KI-Wiki zu erstellen, habe ich einfach

[00:12:18](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=738s) beschrieben, welche Dinge mir

[00:12:19](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=739s) wichtig sind. Sie befinden sich in diesem Rohordner.

[00:12:22](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=742s) Hier ist der Rest seiner Aussage.

[00:12:24](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=744s) Erstelle mir bitte ein Wiki. Und auf der

[00:12:26](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=746s) anderen Seite erhält man am Ende etwas

[00:12:28](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=748s) sehr Organisiertes wie dieses. Äh, das konnte ich

[00:12:30](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=750s) auch schon bei einem anderen Thema,

[00:12:31](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=751s) das ist etwas ungewöhnlich. Äh, das lag daran,

[00:12:33](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=753s) dass ich den

[00:12:35](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=755s) Podcast „Die Bibel in einem Jahr“ gehört habe. Das ist

[00:12:37](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=757s) etwas, was ich vor Kurzem studieren wollte, etwas, das

[00:12:39](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=759s) völlig außerhalb meines Fachgebiets liegt und mit einer

[00:12:41](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=761s) Reihe von Charakteren zu tun hat, deren Namen ich vergessen habe

[00:12:43](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=763s) . Wer schon einmal religiöse

[00:12:44](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=764s) Texte gelesen hat, weiß, dass alle Namen

[00:12:46](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=766s) sehr ähnlich klingen und schwer auszusprechen sein können

[00:12:48](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=768s) . Äh, also etwas zu haben, das

[00:12:50](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=770s) alle Personen zusammenführt und

[00:12:52](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=772s) aufzeigt, was jeder Einzelne getan hat, ist

[00:12:54](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=774s) sehr nützlich. Ich kann also hier klicken

[00:12:56](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=776s) und es wird eine Art Eintrag generiert, der beschreibt, um

[00:12:59](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=779s) welche Person es sich handelt. Man kann sich vorstellen, dass

[00:13:01](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=781s) dies auch im Arbeitsbereich nützlich ist. Wenn

[00:13:02](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=782s) Sie viele Besprechungsnotizen anfertigen und

[00:13:04](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=784s) eine Personensektion mit allen

[00:13:06](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=786s) Personen haben möchten, mit denen sie gesprochen haben, oder,

[00:13:08](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=788s) falls Sie im Bereich Kundenerfolg tätig sind, mit interessierten Kunden, kann das Programm

[00:13:10](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=790s) all diese Daten für Sie generieren. Und dann

[00:13:11](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=791s) kann es Rückverweise zu allen

[00:13:13](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=793s) relevanten Meetings erstellen, die Sie mit ihnen hatten.

[00:13:15](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=795s) Vielleicht die Quelllinks. Um auf

[00:13:18](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=798s) unsere Rohdaten zurückzukommen: Wenn Sie zu den Rohdaten gelangen möchten

[00:13:20](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=800s) , können Sie sich durchklicken

[00:13:22](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=802s) und diese finden. Äh, eigentlich

[00:13:24](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=804s) versuchen wir nur, all diese

[00:13:26](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=806s) Notizen, die wir jeden Tag machen, zu strukturieren und sie etwas

[00:13:28](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=808s) übersichtlicher und

[00:13:29](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=809s) lesbarer zu gestalten. Ähm, als

[00:13:31](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=811s) nächstes möchte ich darüber sprechen, dass es

[00:13:33](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=813s) wirklich schön ist,

[00:13:35](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=815s) dass man einen Agenten bitten kann,

[00:13:37](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=817s) diese bei Bedarf zu generieren, aber wie wir an

[00:13:39](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=819s) unserem kleinen Agenten sehen können, der im

[00:13:40](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=820s) Hintergrund läuft, kann es eine Weile dauern, bis ein

[00:13:43](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=823s) Agent diese Dinge generiert. Im

[00:13:46](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=826s) Idealfall haben wir also einen Ablauf, der das sozusagen

[00:13:49](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=829s) im Hintergrund für uns erledigt. Vielleicht

[00:13:51](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=831s) während wir schlafen, vielleicht nach einem automatisierten

[00:13:53](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=833s) Zeitplan oder so etwas in der Art. Äh, das

[00:13:56](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=836s) ist sozusagen der nächste Punkt, über den wir sprechen sollten:

[00:13:57](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=837s) die Fähigkeiten, die

[00:14:00](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=840s) die Notizen bereichern, Wikis erstellen,

[00:14:02](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=842s) diese im Laufe der Zeit für Sie aktualisieren, und sie

[00:14:04](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=844s) in etwas zu verwandeln, das in einem Rhythmus läuft, vielleicht

[00:14:07](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=847s) täglich, vielleicht wöchentlich. Und hier drüben befindet sich

[00:14:10](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=850s) ein kleiner Bahnsteig. Es gibt eine

[00:14:12](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=852s) Reihe von Anbietern, die das tun. Übrigens,

[00:14:13](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=853s) falls Sie schon mal mit einer Codex-App gearbeitet haben:

[00:14:15](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=855s) Die haben ein Automatisierungstool, das

[00:14:17](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=857s) Aufgaben startet, die jeden Tag auf Ihrem Rechner ausgeführt werden.

[00:14:18](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=858s) Das bedeutet aber, dass Ihr Laptop zum Ausführen der Automatisierung geöffnet werden muss, da

[00:14:20](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=860s) es sich um eine

[00:14:22](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=862s) lokale Automatisierung handelt. Falls Sie etwas suchen,

[00:14:24](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=864s) das in der Cloud läuft, äh, ich möchte darauf hinweisen,

[00:14:26](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=866s) dass wir etwas namens

[00:14:28](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=868s) oz.dev haben. Wenn Sie in

[00:14:31](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=871s) Ihrem Webbrowser danach suchen, hilft Ihnen das bei der Einrichtung

[00:14:33](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=873s) automatisierter Zeitpläne. Äh, sowie

[00:14:36](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=876s) andere Auslöser wie beispielsweise eine Slack-

[00:14:38](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=878s) Nachricht, iMessage oder was auch immer Sie

[00:14:40](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=880s) einrichten möchten. Äh, die habe ich nach Zeitplänen eingerichtet.

[00:14:42](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=882s) Dies war also ein Beispiel, das ich mit der

[00:14:45](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=885s) Wiki-Funktion eingerichtet habe, die ich Ihnen

[00:14:47](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=887s) vorhin schon gezeigt habe, und ich habe es in diese

[00:14:50](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=890s) Anleitung hier kodiert. Also,

[00:14:52](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=892s) die Funktionsweise dieses Systems – und ich werde

[00:14:56](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=896s) Ihnen das jetzt einfach live auf dem Whiteboard zeigen – ist folgende: Wir

[00:14:58](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=898s) erstellen eine Automatisierung, die unseren

[00:15:00](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=900s) Markdown-Ordner nimmt, ihn in eine Art

[00:15:03](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=903s) Cloud-Sandbox synchronisiert, die auf

[00:15:05](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=905s) Docker basiert, falls nötig, ansonsten

[00:15:07](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=907s) nicht, und ihn dann wieder synchronisiert, wenn der

[00:15:09](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=909s) Agent fertig ist. Also, ich habe

[00:15:11](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=911s) es so eingerichtet, dass ich die Obsidian

[00:15:13](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=913s) Headless CLI verwende. Obsidian bietet ein wirklich

[00:15:17](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=917s) praktisches Tool, mit dem man eine Menge

[00:15:18](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=918s) Markdown-Code vom Computer nehmen, ihn mit einem

[00:15:20](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=920s) anderen Computer synchronisieren und ihn dann wieder herunterladen kann

[00:15:22](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=922s) . Alternativ könnten Sie auch einfach einen Git-

[00:15:24](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=924s) Clone durchführen, wenn Sie etwas

[00:15:25](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=925s) weniger kreativ sein möchten. Legen Sie alle Ihre Notizen in

[00:15:27](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=927s) einen GitHub-Ordner, sodass ein Cloud-

[00:15:29](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=929s) Agent sie herunterladen und für

[00:15:31](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=931s) Sie erledigen kann. Ich bevorzuge hierfür die Verwendung der Obsidian CLI,

[00:15:34](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=934s) einfach weil man sich so das ständige

[00:15:36](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=936s) Pushen und Pullen der Notizen erspart.

[00:15:38](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=938s) Dafür hat niemand Zeit. Ich möchte einfach, dass es

[00:15:40](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=940s) im Hintergrund synchronisiert wird. Genau das bewirkt dieses Produkt.

[00:15:41](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=941s) Äh, es handelt sich also um ein Tool, das man

[00:15:44](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=944s) in einer Cloud-Sandbox installieren kann. Der

[00:15:46](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=946s) Ordner mit den Markdown-Dateien wird synchronisiert. Man kann

[00:15:49](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=949s) darin einen Prozess ausführen. Vielleicht gefällt dir ja die

[00:15:51](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=951s) erweiterte Notizfunktion, die

[00:15:52](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=952s) ich dir vorhin gezeigt habe. Weisen Sie

[00:15:54](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=954s) den Agenten einfach an, die Funktion "Anreicherte Notizen" für alle

[00:15:57](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=957s) noch nicht angereicherten Endnoten auszuführen,

[00:16:00](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=960s) und lassen Sie ihn dann alle seine Tool-Aufrufe

[00:16:03](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=963s) und Code-Diffs durchführen. Sobald er damit fertig ist,

[00:16:05](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=965s) wird er die Daten wieder synchronisieren. Das ist im Grunde

[00:16:07](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=967s) der Ablauf. Es ist kinderleicht. Äh,

[00:16:10](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=970s) und genau das haben wir diesem

[00:16:11](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=971s) Cloud Runner aufgetragen. Wenn Sie

[00:16:13](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=973s) Oz also nicht kennen, kein Problem. Äh, das

[00:16:16](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=976s) ist im Grunde nur eine Cloud-Sandbox, die

[00:16:18](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=978s) jeden Tag hochfährt und den

[00:16:20](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=980s) Agenten anweist, dies zu tun. Dies ist also die Eingabeaufforderung,

[00:16:22](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=982s) und zwar die, die ich Ihnen

[00:16:24](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=984s) in Ihrer Umgebung mit der Obsidian CLI bereitgestellt habe. Nutze

[00:16:27](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=987s) das, lade das Wiki herunter,

[00:16:29](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=989s) aktualisiere es, füge einige spezielle

[00:16:31](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=991s) Anweisungen für meine eigene Konfiguration hinzu und

[00:16:33](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=993s) synchronisiere es dann wieder. Auf diese Weise erhalte ich beim nächsten Gang

[00:16:35](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=995s) an den Computer ein stets

[00:16:37](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=997s) aktuelles Wiki, das ich

[00:16:39](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=999s) durchsehen kann. Es ist wie die Tageszeitung,

[00:16:41](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1001s) nur dass es deine eigene ist, und das ist total aufregend.

[00:16:44](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1004s) Äh, wir sehen hier einen weiteren Zeitplan, der

[00:16:45](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1005s) für die Anreicherungsphase der Notizen eingerichtet ist. Dadurch werden

[00:16:47](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1007s) diese Backlinks generiert, was

[00:16:48](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1008s) Ihnen die Navigation erleichtert

[00:16:50](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1010s) . Ich habe das zu einer Fertigkeit gemacht.

[00:16:52](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1012s) Wir fordern es erneut auf, alles zu synchronisieren. Wir

[00:16:55](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1015s) befehlen ihm, mit einem satten Ton zu laufen, und dann

[00:16:57](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1017s) schieben wir ihn wieder hoch. Wenn ich also

[00:16:59](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1019s) meinen Computer einschalte, ist alles da. Äh,

[00:17:01](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1021s) und ich kann Ihnen einen dieser Läufe zeigen.

[00:17:03](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1023s) Sie können es sich in Ihrem

[00:17:04](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1024s) Browser ansehen. Äh, also hier drüben, hier

[00:17:06](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1026s) lief es

[00:17:09](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1029s) von vorhin auf allen unseren Knoten im Rich-Node-Modus. Und wir können dasselbe

[00:17:11](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1031s) sehen, was ich Ihnen gezeigt habe,

[00:17:12](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1032s) aber dieses Mal aus der Cloud. Während ich also

[00:17:15](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1035s) schlief, sah es sich alle Notizen an,

[00:17:16](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1036s) die ich im Laufe des Tages gemacht hatte. Und es

[00:17:18](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1038s) verband alles zu etwas, das

[00:17:20](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1040s) leicht zu durchsuchen war. Äh, das ist super

[00:17:22](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1042s) sauber und super einfach zu bedienen. Äh, wir können uns den vorherigen Lauf auch noch einmal

[00:17:25](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1045s) ansehen, um zu

[00:17:28](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1048s) prüfen, ob er

[00:17:29](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1049s) seinen Zweck erfüllt hat. Ja, schau dir das an. Ähm, das

[00:17:31](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1051s) war also der Zettel von vorhin, der nur ein

[00:17:33](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1053s) wirres Durcheinander war. Und hier ist

[00:17:34](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1054s) der Podcast. Ich habe im Internet recherchiert. Ich habe

[00:17:36](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1056s) es gefunden. Falls Sie

[00:17:37](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1057s) es sich also noch einmal anhören möchten, hier ist es. Wir haben jetzt eine Überschrift

[00:17:39](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1059s) . Und wir haben einige dazugehörige Notizen. Der

[00:17:41](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1061s) Ferrari-Podcast. Wir haben einige Notizen

[00:17:44](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1064s) aus einem anderen Gründer-Podcast. So, jetzt haben

[00:17:45](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1065s) wir's. Ich muss überhaupt nichts mehr arbeiten

[00:17:47](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1067s) . Sie müssen lediglich die Nachricht per Spracheingabe

[00:17:48](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1068s) in Ihr Telefon diktieren. Und all das

[00:17:50](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1070s) kommt auf der anderen Seite wieder heraus.

[00:17:52](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1072s) Zum Schluss möchte ich noch über etwas sprechen, um

[00:17:54](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1074s) Ihren Horizont ein wenig über

[00:17:56](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1076s) Markdown hinaus zu erweitern und etwas

[00:17:58](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1078s) Spannenderes zu machen: die Umwandlung all Ihrer

[00:18:01](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1081s) Gedanken in Visualisierungen,

[00:18:03](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1083s) Diagramme, Grafiken oder was auch immer Sie möchten

[00:18:06](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1086s) . Und das ist etwas, das ich

[00:18:08](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1088s) in dieser Notizen-App eingerichtet habe, die ich

[00:18:10](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1090s) euch die ganze Zeit gezeigt habe. Sie

[00:18:11](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1091s) können sich hier auch HTML-Seiten ansehen

[00:18:13](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1093s) . Ich habe es so formuliert, weil ich sagen wollte: „

[00:18:16](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1096s) Hey, ich möchte all diese

[00:18:17](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1097s) Markdown-Dateien nehmen und daraus

[00:18:19](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1099s) mit HTML und Tailwind eine Art

[00:18:22](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1102s) grafische Ansicht erstellen.“ Anstatt mich durch

[00:18:24](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1104s) ein Wiki zu klicken und einer Reihe von

[00:18:26](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1106s) Links zu folgen, möchte ich einen Gesamtüberblick

[00:18:28](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1108s) über alles erhalten, was wir

[00:18:30](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1110s) hier aufschreiben. Ermitteln Sie gemeinsame Muster und

[00:18:32](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1112s) gemeinsame Interessensgebiete. Und wir können sie uns direkt

[00:18:34](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1114s) hier ansehen. Und dies ist kein

[00:18:36](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1116s) Tool, das Sie installieren müssen.

[00:18:37](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1117s) Übrigens habe ich einem Agenten gesagt: „Bauen Sie mir das.“ Das

[00:18:39](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1119s) können Sie jetzt tun. Ähm, also wir sehen

[00:18:42](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1122s) im Zentrum ein paar Dinge, die eher wirre

[00:18:43](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1123s) Gedanken sind. Ich bin ein zerstreuter Mensch.

[00:18:45](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1125s) Das macht Sinn. Äh, wir haben ein paar Bücher.

[00:18:47](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1127s) Offensichtlich muss ich mehr lesen. Wir haben

[00:18:52](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1132s) hier ein gewisses Interesse an der Gründung von Startups. Wir verfügen über KI und Ingenieurwesen.

[00:18:54](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1134s) Natürlich haben wir Vertrauen in die Heilige Schrift,

[00:18:55](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1135s) denn ich habe die Bibel in einem Jahr durchgelesen.

[00:18:56](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1136s) Wie ich bereits erwähnt habe, sehen wir all das hier

[00:18:58](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1138s) zusammengefasst. Und ich habe

[00:19:00](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1140s) auch gesagt: Lasst uns diese Knoten

[00:19:02](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1142s) anklickbar machen. Jetzt kann ich also sehen,

[00:19:05](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1145s) welche Notiz das war. Ich kann erkennen, wie

[00:19:07](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1147s) es mit etwas anderem zusammenhängt. Wir

[00:19:08](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1148s) sehen also, dass dies mit einer Reihe von

[00:19:10](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1150s) Ideen zusammenhängt. Man bewegt sich quasi einfach um den

[00:19:11](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1151s) Graphen herum. Es ist hilfreich, sich zunächst einen Überblick darüber zu verschaffen,

[00:19:14](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1154s) wofür man sich eigentlich interessiert

[00:19:16](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1156s) und wo es Lücken im eigenen

[00:19:17](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1157s) Denken gibt, aber es ist auch nützlich, wenn man tiefer in die Materie einsteigen

[00:19:19](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1159s) möchte. Und auch nur, um

[00:19:21](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1161s) Ihnen zu zeigen, dass Sie dies selbst in der Hand haben

[00:19:23](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1163s) . Kann man es ins

[00:19:24](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1164s) Weltall schicken? Ich weiß nicht. Lasst uns ins Weltall schicken.

[00:19:27](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1167s) Wie wäre es damit? Jetzt ist es im Weltraum. Äh,

[00:19:29](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1169s) es sieht eher aus wie ein Sternbild

[00:19:31](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1171s) . Wir können also dort hineinklicken.

[00:19:32](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1172s) Wir können uns sozusagen umschauen. Sehen Sie, wie

[00:19:34](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1174s) alles miteinander verbunden ist. Es ist wirklich

[00:19:36](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1176s) schön.

[00:19:37](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1177s) Man könnte auch so etwas wie ein

[00:19:39](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1179s) Burndown-Chart einbinden. Wenn Sie versuchen,

[00:19:40](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1180s) eine Gewohnheitsübersicht zu erstellen, die festhält, wie oft

[00:19:42](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1182s) Sie sich Notizen zu bestimmten Dingen machen,

[00:19:44](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1184s) können Sie sich so etwas ausdenken. Das ist so ähnlich wie

[00:19:46](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1186s) ein GitHub-Diagramm. Ich

[00:19:48](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1188s) habe zwar keine besonders beständige Gewohnheit, aber

[00:19:49](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1189s) sie entwickelt sich und wir können sie hier intern verfolgen

[00:19:51](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1191s) . Äh, was auch immer Sie zusammenstellen möchten

[00:19:54](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1194s) , Sie können einfach einen Agenten damit beauftragen

[00:19:55](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1195s) . Ähm, und das war's dann auch schon mit dem

[00:19:58](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1198s) Gespräch. Das ist

[00:19:59](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1199s) alles, was ich euch mitteilen wollte.

[00:20:01](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1201s) Falls ich irgendwelche Abschiedsgeschenke oder

[00:20:03](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1203s) Dinge zum Anschauen habe, melde ich mich zuerst, zum Beispiel,

[00:20:05](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1205s) wenn ihr an der Automatisierungsplattform

[00:20:06](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1206s) oz.dev interessiert seid. Es wurde von Warp entwickelt,

[00:20:10](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1210s) warp.dev/os, wie auch immer Sie danach suchen möchten

[00:20:12](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1212s) . Äh, das ist das Tool, mit dem Sie

[00:20:14](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1214s) Zeitpläne einrichten können, um Notizen im Hintergrund zu aktualisieren

[00:20:16](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1216s) . Und falls Sie die

[00:20:18](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1218s) kleine Notiz-App, die ich Ihnen gezeigt habe,

[00:20:20](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1220s) hub.md, ausprobieren möchten: Sie ist kostenlos und Open Source. Wir freuen uns

[00:20:22](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1222s) über Beiträge.

[00:20:24](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1224s) Wie Sie sich vorstellen können, fehlt eine Menge.

[00:20:26](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1226s) Wenn Sie also nach einer Apple Notes-App suchen,

[00:20:27](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1227s) die über einen Agenten zugänglich ist, dann ist diese genau das Richtige für Sie.

[00:20:30](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1230s) Das könnt ihr ausprobieren. Ich hoffe,

[00:20:32](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1232s) Sie in den Fehlerprotokollen wiederzusehen. Äh, damit wäre ich

[00:20:35](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1235s) sehr zufrieden mit den Gesprächen mit

[00:20:36](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1236s) euch. Ich werde u Oh, ich soll wohl Werbung für

[00:20:39](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1239s) mich selbst machen, nicht wahr? Ich möchte mal Werbung für mich machen. So, jetzt haben

[00:20:41](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1241s) wir's. Falls Sie mir folgen müssen,

[00:20:42](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1242s) da bin ich. Ich bin im Bereich Entwicklerbeziehungen bei

[00:20:45](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1245s) Warp tätig. Das gesamte Team findet ihr

[00:20:47](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1247s) sowohl am Stand als auch auf Twitter

[00:20:49](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1249s) und überall sonst. Äh, und außerdem haben

[00:20:51](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1251s) wir heute Abend noch unsere Nebenveranstaltung. Ähm, ja

[00:20:53](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1253s) , damit lasse ich euch gehen. Ich wünsche

[00:20:55](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1255s) Ihnen viel Freude beim Rest der Konferenz.

[00:20:56](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1256s) Vielen Dank. [Applaus]

[00:21:13](https://www.youtube.com/watch?v=I3bpdgFJCUY&t=1273s) [Musik]
