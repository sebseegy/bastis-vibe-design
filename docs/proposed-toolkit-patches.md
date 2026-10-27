# Proposed patches to bastis-service-toolkit (NOT applied — Basti approves)

These follow from the bastis-vibe-design defaults. Grade: design policy (owner decision), not a
platform fact. Apply in the toolkit repo only after approval, then bump its version.

## P1 — motion policy (decision D1)
File: `bastis-service-toolkit/skills/monday-vibe/SKILL.md` L107
- Old: `- **Keep UI simple** — no complex charts, animations, decorative high-perf elements.`
- New: `- **Keep UI simple** — no complex charts or decorative motion. Feedback motion only (press, hover, menus, sheets, ~150–250ms ease-out); no entrance animations on app screens. Details: bastis-vibe-design:vibe-motion-pass.`
Evidence: support.monday.com article 34101891654034 lists "Create hover effects" as a standard refinement; Emil Kowalski frequency gate; taste-skill app-screens.md L353-354 ("Nothing on the screen performs an entrance").

File: `bastis-service-toolkit/skills/monday-vibe-builder/references/prompt-playbook.md` L77
- Old: `Keep charts simple; no heavy animations.`
- New: `Keep charts simple. Motion: press/hover feedback and menus only, no entrance animations.`

## P2 — default visual style (decision D2)
File: `prompt-playbook.md` L74-75 (design direction block)
- Old: `Style: [e.g. spacious enterprise SaaS, 8px grid, rounded-lg cards, subtle shadows, data-dense tables with sticky headers].`
- New: `Style: [e.g. spacious enterprise SaaS, 8px grid, flat surfaces (1px border or one tone step, shadows only on menus and dialogs), data-dense tables with sticky headers, numbers right-aligned].`
Evidence: taste-skill app-screens.md (17 of 23 studied product screens put no shadow on cards). Brand overrides.

File: `prompt-playbook.md` L80-81 (portal default)
- Keep "clear status pills"; add "as pale tints with dark text of the same hue".

## P3 — point to the design plugin
File: `bastis-service-toolkit/skills/monday-vibe-builder/references/prompt-playbook.md` §2, row n+3 (Polish)
- Add: `Run bastis-vibe-design:vibe-screen-review → vibe-motion-pass → vibe-mobile-pass first; send the prompts they return.`

## P4 — retire the duplicate design block
`prompt-playbook.md` §5 can reference `bastis-vibe-design:vibe-design-direction` as the generator of the design block, keeping §5 as the fallback template.

## Open (decision D3)
Code export: `platform-facts.md` L198 says not supported; `vibe-prompt-injection` L67 and `vibe-board-builder` L381 rely on it. Add to `weekly-pulse/references/audit/queue.md`: "Does Vibe offer a source download? Owner: Vibe team (#ask-vibe-ai)."
Also for the queue: support article 34101891654034 now says "connect up to five boards at a time"; platform-facts cites the same article as 20.
