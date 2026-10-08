---
title: "Audit Any Website With Claude and Playwright MCP (2026 Guide)"
source: "https://www.viableedge.com/blog/audit-any-website-with-claude-mcp"
published: 2026-07-11
created: 2026-07-29
tags:
  - "clipping"
  - "research"
author:
  - "{\"@type\":\"Person\""
  - "\"name\":\"Adam Sandler\"}"
---
# Audit Any Website With Claude and Playwright MCP (2026 Guide)

> Quelle: https://www.viableedge.com/blog/audit-any-website-with-claude-mcp
> Veröffentlicht: 2026-07-11
> Geclippt am: 2026-07-29

Share:

**To audit a website with Claude, connect the Playwright MCP server, point Claude at a URL, and ask it to open the page and report what it finds.** Playwright is a browser that Claude can drive. MCP is the standard that lets Claude use it. Together they turn "read this page" from a copy and paste chore into something Claude does on its own, in a real browser, in about three minutes.

> **If you downloaded my original version of this guide in 2025, this page replaces it.** The method still works. The setup does not. The old guide walked you through hand-editing a hidden JSON config file, which was the step most people quit on. That is no longer the shortest path, and the server everyone used back then has been superseded by the official one from Microsoft. Everything below is current.

## What changed since the original guide

Three things, and they all make this easier:

- **There is now an official Playwright MCP server.** Early guides, mine included, pointed at community-maintained servers. Microsoft now publishes `@playwright/mcp`, and it is the one to use.
- **Claude Code installs it with one command.** No config file, no JSON, no restarting anything.
- **One-click extensions exist.** Claude Desktop added an Extensions directory, so many MCP servers now install like a browser extension instead of a text file you have to find in a hidden folder.

The practical consequence: the part of the original guide that took twenty minutes and caused most of the failures now takes about thirty seconds. If you tried the old version and hit a wall, that was not you. It was the setup.

## What you need before you start

- **Node.js 20 or newer.** This is the one genuine prerequisite. If you do not have it, install it from nodejs.org first. You never have to write any JavaScript, Claude just needs it to run the browser.
- **Claude Code or Claude Desktop.** Either works. Pick the path below that matches what you have.

You do not need to install a browser. Playwright downloads one the first time it runs.

## Setup, path one: Claude Code (fastest)

One command. Paste it into your terminal:

```
claude mcp add playwright npx @playwright/mcp@latest
```

That is the whole setup. Start Claude Code and Playwright is available.

## Setup, path two: Claude Desktop

Open Claude Desktop, go to **Settings, then Developer, then Edit Config**. Paste this in, exactly as written:

```
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": ["@playwright/mcp@latest"]
    }
  }
}
```

Save the file and restart Claude Desktop. If Claude Desktop already lists other MCP servers in that file, add the `"playwright"` block alongside them rather than replacing what is there.

Before you go further, check that it worked. Ask Claude:

> Open https://demo.playwright.dev/todomvc and tell me what you see.

If Claude describes the page, you are connected. If nothing happens, the usual culprit is Node: confirm you are on version 20 or newer and restart the app.

The three audit prompts

### Setup is done. Here is the part that earns its keep.

Three prompts, written to paste as-is with your URL swapped in: the first-impression audit, the message-to-market audit, and the competitor comparison. Enter your email and they open right here on this page.

No spam, ever

Unsubscribe anytime

## The limitation nobody mentions

Run those three prompts and you will get real value. Then you will hit the wall that the original guide never addressed, and it is the reason I ended up building something else entirely.

**The audit is a one shot.** Claude opens the page, tells you what it sees, and then forgets all of it. Every insight, every judgment about your positioning, every note about your audience: gone the moment the session ends.

So the next time you sit down, you start over. You re-explain who you serve. You re-explain what you sell and how you are different and who you are up against. You retype your business from memory, and the answer you get back is never better than what you happened to remember that day. The model is not the bottleneck. Your ability to re-supply context, over and over, is the bottleneck.

That is not a prompting problem. You cannot fix it with a better prompt, because the prompt is where the problem lives. It is a memory problem.

## What to do about it

The fix is to stop re-explaining your brand and give the AI something durable to read instead: a structured, written record of your positioning, your audience, your competitors, and your voice, that any tool can pull from.

That is the thing I have spent the past year building. It is called Brand Architect. You hand Ophelia your website, and Ophelia builds a knowledge base for your brand: positioning, audience, competitors, voice, all of it structured and linked, so the next time you open an AI tool it reads your business instead of guessing at it.

It is the same instinct as the audit above, pointed at a durable target. The audit tells you what one page says today. The knowledge base is what makes every future answer, from any tool, start from your actual business.

The first build is free and it runs on your real brand, not a demo. Keeping it going after that is a subscription, but the build is yours to look at either way.

### Stop re-explaining your brand to AI

Give Ophelia your website and get a knowledge base for your brand: positioning, audience, competitors, voice. Structured so every AI tool you use can read your business instead of guessing at it. The first build is free and runs on your real brand.

[Start your free build](https://www.viableedge.com/signup?intent=ba&utm_source=blog&utm_medium=referral&utm_campaign=mcp-audit-guide)