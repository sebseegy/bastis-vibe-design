---
name: vibe-screen-review
description: "UI-improvements phase for a monday Vibe app whose core screens already work: reviews screenshots of each screen against an evidence-based rubric for app screens (does the biggest block answer the screen's question, colour only on data, honest numbers and states, alignment, generated-dashboard tells) and returns a ranked findings table plus paste-ready one-change Vibe prompts. Use when Basti says the app 'looks generic', 'looks off', 'make it nicer', 'polish the UI', 'review the screens', 'critique this vibe', or pastes Vibe screenshots asking what to improve. Not for motion (vibe-motion-pass), phones (vibe-mobile-pass) or data bugs (vibe-prompt-injection)."
---

# Vibe screen review

You judge pictures, because Vibe can't show you the app (`../vibe-design/references/vibe-constraints.md` C1, C6).
If a problem shows in a screenshot, it's real, whatever Vibe says it built.

## 1. Collect evidence
Ask for, per screen: a desktop screenshot (~1440 wide), a phone screenshot (~390, monday mobile app if relevant), and the screen's one question (from `vibe-design-direction`; if missing, infer it and say so). Optional: dark mode, an empty account, a full account.
Correctness first: if a screenshot shows wrong data, a permission error or missing items, stop and route to `bastis-service-toolkit:vibe-prompt-injection` (C11).

## 2. Critique each screen (write the answers down)
1. **Question first.** Is the screen's question answered by its biggest block, read first? Is the largest figure the one the title implies?
2. **Edges.** Do blocks share the screen's edges? Any dead strip, a card stopping short, an orphan cell, a card stretched with a blank band?
3. **Colour.** Only on data, status and the one primary action? Does the main data element carry the brand hue? Is the client's face (logo, words, hue) visible on the first screen?
4. **Numbers.** Do totals add up from the rows shown? Do repeated facts agree? Does each relative figure name its baseline ("+5 vs last week")? Right-aligned, tabular figures?
5. **States.** Real zero shown as 0, missing as a grey dash, empty blocks keep their frame + one sentence, errors inside the block with Retry? Count badges only on queues that need action?
6. **Charts.** One hue, legend matches marks, no label collisions, no caption needed to explain which bars are which?
7. **Main job.** Is the most frequent action one click from the first screen?
8. **Phone.** Navigation folded, no sideways scroll, each block still answers its question? (Depth → `vibe-mobile-pass`.)

## 3. Scan for generated-dashboard tells

| Tell | Replace with |
|---|---|
| Dark/tinted sidebar with coloured active pill + left bar | Sidebar on the page ground; neutral grey active state |
| "Welcome back" + emoji hero | A noun title, ~24px |
| KPI cards with icons in tinted circles, sparklines, "+12.5%" pills everywhere | One divided container: label over number; delta in words with its window, grey when zero |
| KPI values 36–48px bold in brand colour | 24–30px, regular to semibold, in ink |
| Gradient area chart, smoothed line, dots on every point | 2px straight line, no fill, no markers |
| Rainbow palette, a hue per bar | One hue per chart, ≤4 hues per screen |
| Cards with big radius + border + soft shadow | Border OR tone step; one radius |
| Zebra table, uppercase tracked headers, checkbox+avatar+chip+kebab on every row | Row rules, 12px grey headers, one status mark, one action where needed |
| Saturated status chips with white text | Pale tint, dark text of the same hue |
| Accent on every button, tab and link | Accent on data + one control |
| Search + bell + avatar top bar on every screen | A top bar only when it carries something real |
| Placeholder people, round vanity totals | The client's real data at real size |
| Pagination under a 5-row list | Capped rows + "View all" + total |
| Equal four-up grid with orphan cells | Column count chosen by item count |
| Illustration + "No data yet" in an empty chart | Zero line drawn + one sentence |

Brand wins: if the client's brand requires a "tell" (their sidebar colour, their violet), keep it and say so.

## 4. Score and prioritise
Severity: **Broken** (wrong or unreadable, action unreachable) · **Weak** (answers the question badly, generic look) · **Polish**.
Rank by leverage (impact on the screen's question ÷ prompt cost). Fix at most the top 3 per screen per round; then re-screenshot. Three rounds max.

## 5. Output

| # | Screen | Severity | What the screenshot shows | Change | Prompt # |
|---|---|---|---|---|---|

Then the prompts, one change each, in `../vibe-design/references/prompt-format.md` form, grouped by screen, in send order. Tell Basti to use the element selection tool for element-level fixes and to attach the screenshot. Hand off to `bastis-service-toolkit:vibe-prompt-injection` for the loop and judging replies.

Close with: what you couldn't judge (no phone shot, no empty state, dark mode not seen) and the next skill (usually `vibe-motion-pass`).

Sources: taste-skill upstream file `app-screens.md` §2.7, §10–14 (MIT, Leonxlnx).
