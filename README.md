# bastis-vibe-design

Design skills for monday Vibe apps, ordered by when you reach for them. Every skill ends in
paste-ready Vibe prompts (one change each, under ~350 words). The design plugin decides
*what* to change; `bastis-service-toolkit:vibe-prompt-injection` runs the prompt loop.

Not sure where to start? Run `vibe-design` — it reads where the app stands and points to one skill.

## Which skill, when

| Order | Phase | Skill | Use it when |
|---|---|---|---|
| 0 | Front door | `vibe-design` | "Where am I, what's next?" |
| 1 | Design direction (before prompt 0) | `vibe-design-direction` | New app, new client, rebrand. Returns the design block for prompt 0 and a Memory entry. |
| 1b | Direction (optional) | `vibe-design-explore` | You can't pick between directions. 3 standalone HTML variants, pick one, upload the screenshot to Vibe. |
| 2 | UI improvements (after core screens work) | `vibe-screen-review` | "It works but looks generic / off." Screenshots in, ranked findings + fix prompts out. |
| 3 | UI improvements | `vibe-motion-pass` | Should anything animate, fix motion that feels wrong, exact values. |
| 4 | UI improvements | `vibe-mobile-pass` | Field users or a mobile home. In-app fixes + a real-device test script. |
| 5 | QA (before UAT / go-live) | `vibe-break-test` | Worst-case data on a mock board; breaks table + fix prompts. |
| — | Reference | `vibe-motion-words` | "What's that effect called?" |

## Where it fits the build

```
vibe-design-direction (+ explore) ─► prompt 0 design block
        │
prompts 1..n: core screens (vibe-board-builder / monday-vibe-builder) — correctness first
        │
polish slot: vibe-screen-review ─► vibe-motion-pass ─► vibe-mobile-pass
        │            (prompts go through vibe-prompt-injection)
before UAT: vibe-break-test ─► bastis-service-toolkit:uat
```

## Built-in defaults

- **Motion:** feedback motion only on app screens (press, hover, menus, sheets). No entrance animations. Public pages: at most restrained entrances.
- **House style:** colour on data, flat surfaces, KPIs as type not tiles, honest states. The client brand always wins.
- **Evidence:** screenshots and the Vibe element selection tool. Vibe gives no code access (`monday-vibe-builder/references/platform-facts.md` L18, L198); a source-audit mode is off until a code export is confirmed.

Proposed edits to `bastis-service-toolkit` that these defaults imply are in `docs/proposed-toolkit-patches.md` (not applied).

## Install

Add this repo as a marketplace in Cowork / Claude Code and install `bastis-vibe-design`.
Optional upstream reference copy: `./scripts/sync-emil-skills.sh` (clones into `vendor/`, git-ignored).

## Credits

Distilled from Emil Kowalski's skills and Leonxlnx's taste-skill (both MIT). See `THIRD_PARTY.md`.
