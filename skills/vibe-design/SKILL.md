---
name: vibe-design
description: "Front door for the bastis-vibe-design plugin. Reads where a monday Vibe app stands (no build yet, core screens working, polishing, about to go to UAT) and points to the ONE design skill to run next, with the reason and what to bring. Never runs a skill itself. Use when Basti says 'vibe design', 'which design skill', 'what's next for the design', 'make the vibe look better', 'where do I start with the UI', or asks for design help on a Vibe app without naming a phase."
---

# Vibe design — front door

You point; you don't run. Work out the phase, recommend one skill (plus at most one alternative),
say what to bring, and stop.

## 1. Find the phase (ask only what you can't infer)

| Signal | Phase | Recommend |
|---|---|---|
| No app yet, or prompt 0 not sent; new client; rebrand | Direction | `vibe-design-direction` |
| Direction chosen but two looks compete; client wants to "see options" | Direction | `vibe-design-explore` |
| Core screens work; "looks generic", "looks off", "make it nicer" | UI improvements | `vibe-screen-review` |
| Screen review done, or the complaint is about movement, feel, sluggishness | UI improvements | `vibe-motion-pass` |
| Field users, mobile home page, phone complaints | UI improvements | `vibe-mobile-pass` |
| Before UAT or go-live; "does it hold up with real data" | QA | `vibe-break-test` |
| "What's that effect called" | Reference | `vibe-motion-words` |

Not a design problem → say so and route out:
- Wrong data, missing items, slow loading, permissions → `bastis-service-toolkit:vibe-prompt-injection`.
- Board architecture, new app → `bastis-service-toolkit:vibe-board-builder` or `monday-vibe-builder`.
- Correctness bugs always come before design work (credits, `references/vibe-constraints.md` C11).

## 2. Recommend

```
Phase: <phase> — <one line why>
Run: <skill>
Bring: <screenshots at desktop + phone / brand guide / board name / app URL>
Then: <the skill that usually follows>
```

Default order inside a build: direction (+ explore) → core screens → screen review → motion pass
→ mobile pass (if phones) → break test → UAT. Skip any step that doesn't apply; say which you skipped.

## Shared references
- `references/vibe-constraints.md` — the platform limits every skill obeys (C1–C11).
- `references/prompt-format.md` — the one-change prompt every skill outputs.
