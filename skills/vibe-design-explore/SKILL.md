---
name: vibe-design-explore
description: "Optional design-phase step for a monday Vibe app: builds 3 genuinely different versions of ONE screen or component as a standalone HTML file with a variant picker, outside Vibe, so Basti or the client can flip through them and choose; the winning screenshot then goes into Vibe as prompt context. Use when two directions compete, the client wants to 'see options', or Basti says 'explore variants', 'show me 3 versions', 'prototype the dashboard first'. Explicit invocation only. Not for building inside Vibe (variants there cost credits per prompt)."
disable-model-invocation: true
---

# Vibe design explore

Explore outside Vibe, decide, then build once. Making Vibe build three variants costs three sets of
prompts and risks half-applied states (`../vibe-design/references/vibe-constraints.md` C11).

## Rules
1. **One thing per run.** "The dashboard" → pick its highest-leverage piece (usually the first screen's headline block) and say why.
2. **Variants diverge on a named axis** — layout, density, personality, interaction model. Two variants that differ only in accent colour are one variant; replace it.
3. **Every variant works**: realistic content in the client's words, real-looking numbers that add up, working hovers and controls. No lorem ipsum.
4. **Stay inside the direction.** Use the token table from `vibe-design-direction`; variants should all look like they could ship for this client.
5. **Only Vibe-feasible ideas.** No libraries, no gesture physics, no scroll scenes (C3, C4). If a variant needs something Vibe can't do, drop it.

## Workflow
1. **Scope** — restate the brief in one sentence: what it is, which screen, what it must do.
2. **Directions** — list 3 (max 5) with a name and an axis each ("Quiet — dense table, no chart"; "Briefing — finding sentence + 3 KPIs"; "Board — status columns"). Never "Option A/B/C".
3. **Build** — one self-contained HTML file, inline CSS/JS, one variant visible at a time at full size in realistic surroundings (the sidebar, the title row). Add the picker from `references/picker.md`.
4. **Verify** — open it (publish as an Artifact or present the file), flip every variant, check 1440px and 390px. Screenshot each.
5. **Present and stop** — the choice is Basti's or the client's:

| # | Variant | Axis | Right when | Cost |
|---|---|---|---|---|

6. **Promote the winner into Vibe** — one prompt, with the winner's screenshot attached as prompt context (C10):
```text
<App> · <Screen> · One change.
Rebuild the <block> to match the attached image: <3–5 concrete points: layout, what's biggest,
which data, colours by token>. Keep the data sources and every existing action unchanged.
Verify at desktop and phone width. Report what you changed.
```
Then hand to `bastis-service-toolkit:vibe-prompt-injection` for the loop.

Never send variants to a client yourself — Basti shares them.

Source: Emil Kowalski `prototype` skill and picker spec (MIT).
