---
name: vibe-motion-pass
description: "UI-improvements phase for a monday Vibe app: decides what should and shouldn't animate, fixes motion that feels wrong, and supplies exact values (easing curves, durations, press feedback, reduced motion) as paste-ready Vibe prompts. Three modes: FIND (where motion would genuinely help, and where it must not), FIX (review motion Basti recorded or screenshotted), SPEC (a motion block for prompt 0 or Vibe Memory). Use when Basti says 'motion pass', 'animations', 'make it feel smoother/snappier', 'it feels sluggish', 'add hover effects', 'transitions', or 'polish the feel'. Not for slow data loading (vibe-prompt-injection) or naming effects (vibe-motion-words)."
---

# Vibe motion pass

Default policy for Vibe app screens: **feedback motion only** (press, hover, menus, popovers,
sheets, toasts). **Nothing performs an entrance.** Public pages may add restrained section
entrances. This is stricter than generic UI advice on purpose: Vibe guidance says keep UI simple,
the builder picks libraries, and every prompt costs credits
(`../vibe-design/references/vibe-constraints.md` C3, C4, C11).

## The gate (every candidate, in order)
1. **Frequency** — 100+ times/day (keyboard actions, tab switches, core nav): no animation, ever. Tens/day (hover, list nav, row select): near-imperceptible or none. Occasional (menus, dialogs, sheets, toasts): standard. Rare (first run, success, empty→first item): the only place for delight.
2. **Purpose** — name one: feedback · spatial consistency · state indication · preventing a jarring change · explanation (public pages/onboarding only) · delight (rare tier only). Can't name it → reject.
3. **Budget** — must work under 300ms on UI. If it only works slow and showy, reject.
4. **Function** — data the user reads or acts on doesn't move for style. No decorative motion on charts, tables, KPIs.
5. **Vibe-feasible** — CSS-level behaviour only. Reject springs, drag physics, momentum, rubber-banding, parallax, scroll-driven scenes, 3D, blur tricks, custom gesture handling (C3, C4).

## The values (put these in prompts verbatim)

| Element | Duration | Easing |
|---|---|---|
| Button / pressable feedback | 100–160ms, scale to 0.97 on press | ease-out |
| Tooltip, small popover | 125–200ms, from scale 0.97 + opacity 0 | ease-out |
| Dropdown, select, menu | 150–250ms, from scale 0.95 + opacity 0, growing from its trigger | ease-out |
| Dialog / modal | 200–250ms, from scale 0.96 + opacity 0, centred; backdrop fades with it | ease-out |
| Side sheet / drawer | 250–400ms slide by its own width/height | cubic-bezier(0.32, 0.72, 0, 1) |
| Accordion / expand | ≤200ms height + opacity | ease-out |
| Toast | ~300–400ms in from the edge it leaves by | ease |
| Hover colour change | 120–150ms | ease |
| Spinner / progress | constant | linear |

- Strong ease-out: `cubic-bezier(0.23, 1, 0.32, 1)`; on-screen movement: `cubic-bezier(0.77, 0, 0.175, 1)`. Never ease-in on UI.
- Never animate from scale 0. Only transform and opacity (accordion height is the one exception, kept short).
- Exit the way it entered; exits faster than entrances.
- Hover effects only on devices with a mouse (`hover: hover` and `pointer: fine`); touch gets press feedback instead.
- Reduced motion: when the user asks for it, drop movement and keep short opacity/colour fades — fewer and gentler, not zero.
- Interruptible: anything that can fire twice in a second (toggles, toasts) uses transitions, not keyframe animations.
- Second tooltip in a row opens instantly.

## Modes

### FIND — where should it move?
Input: screenshots or a screen walk-through (element selection tool for specifics). Sweep for: pressables with no press feedback; menus/dialogs/sheets that pop in with no bridge; content that teleports (expanding sections, items added/removed); toasts that leave a different way than they came. Run every candidate through the gate. Output at most 5–7 survivors, and REQUIRED: 2–5 rejected candidates with the gate question that killed them (that list is what stops a wishlist).

### FIX — does existing motion feel right?
Input: a short screen recording, or screenshots + Basti's description. Code export only if Basti supplies one (C1b) — then cite files, otherwise cite screens. Flag on sight: motion on keyboard/high-frequency actions; ease-in or slow (>300ms) UI motion; things appearing from nothing; popovers growing from their centre instead of their trigger; hover effects that stick after a tap on phones; no reduced-motion behaviour; everything animating at once.
Prefer, in order: delete it → reduce it → fix easing → fix origin → make it interruptible → reduced motion.
Verdict: **Block** (any feel-breaking issue) or **Approve**.

### SPEC — a motion block for prompt 0 or Memory
```text
Motion: feedback only. Buttons and clickable cards scale to 0.97 on press over 150ms ease-out.
Menus, dropdowns and popovers fade and scale in from 0.95 over 200ms using
cubic-bezier(0.23, 1, 0.32, 1), growing from the element that opened them; dialogs from 0.96, centred.
Side panels slide in over 300ms using cubic-bezier(0.32, 0.72, 0, 1) and leave the same way, faster.
No entrance animations on pages, lists, cards, charts or KPIs. Hover effects only for mouse users.
Respect the user's reduced-motion setting: replace movement with short fades.
No animation on keyboard shortcuts or tab switches.
```

## Output
1. Gate table: `# | Screen/element | Today | Purpose | Frequency | Verdict | Values`.
2. Rejected candidates (FIND) or Block/Approve (FIX).
3. Prompts, one change each, per `../vibe-design/references/prompt-format.md`. Group motion changes per screen into one prompt where they share a component type ("all menus on this page").
4. **Feel check for Basti** (motion can be correct and still feel wrong): play the interaction at normal speed and look for lag; spam the toggle; open/close the menu quickly; on a phone, tap and check nothing stays highlighted; switch on reduced motion in the OS and confirm movement drops but feedback remains; look again the next day.

Sources: Emil Kowalski `emil-design-eng`, `animate` (+RECIPES), `find-animation-opportunities`, `review-animations` (+STANDARDS), `animation-performance` (all MIT). Deferred: `improve-animations` source audit — only if a code export is confirmed.
