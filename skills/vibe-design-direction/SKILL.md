---
name: vibe-design-direction
description: "Design phase for a monday Vibe app, BEFORE the first build prompt: decides what each screen must answer, picks a visual style, maps the client's brand to theme tokens, and returns a paste-ready design block for prompt 0 plus a Vibe Memory entry. Use when starting a new Vibe app, a new client, a rebrand, or when Basti says 'design direction', 'brand the vibe', 'make it look like the client', 'theme it', 'what should it look like', or 'never ship the default look'. Replaces vibe-brand-theming. Not for reviewing an existing app (use vibe-screen-review)."
---

# Vibe design direction

Rule: never ship the generic default look. Theme to the client's brand; without one, to the
industry standard for the app type (prompt-playbook.md L68-69). Decisions here are cheap; the same
decision made after 20 prompts costs credits (`../vibe-design/references/vibe-constraints.md` C11).

## 1. Inputs (ask only for what's missing)
- Brand: guidelines PDF, website, logo (light + dark), existing screenshots. None → say you're using the industry default.
- Users and device: who opens it, how often (a glance or an 8-hour session), desktop or phone.
- Screens planned and the boards behind them (from `vibe-board-builder`, if run).
- Public page or internal app? (public portals, event sites → page rules in §5b).

## 2. Each screen's one question (the step that decides quality)
For every planned screen write three lines:
- **Question** it answers first ("Which supplier is blocked?", "Is this week's plan on track?").
- **Finding** slot: where today's most important fact shows (under the title, next to its action).
- **Main job**: the action most users take next, and where its control sits (one click from the first screen).
Then list the screen's blocks as answers to its next questions; a block with no question goes.
Everything the brief names must show its header and first rows at 1440×900; cap long lists at 4–6 rows with "View all".

## 3. Pick a style (by how the app is used, not what's familiar)

| Style | Theme | Fits | The one move |
|---|---|---|---|
| Achromatic ledger | light | finance, reports, settings | No colour in chrome; one small signal where a figure changed |
| Framed sheet | light | B2B analytics, ops tools, builders | One tinted frame; content on a white sheet, no shadow |
| Accent ladder | light | small-business admin, plans | Full hue on small marks only; pale tints on areas |
| Editorial greeting | light | team / personal homes, intranet | Greeting as the title in a centred column |
| Pastel consumer | light | wallets, budgets, employee self-service | Pale same-hue tiles, one large radius |
| True-black flat | dark | events, media, community | Elevation by lightness; colour only on data |
| Data terminal | dark | monitoring, markets, NOC screens | Every selection is the same 1px accent line |

Optional: if taste-skill is installed locally, `node <taste>/scripts/draw.mjs --app --kind <kind> --brief "<one line>" --keep palette,type --options 3` deals concrete style sheets; paste the chosen sheet's values into §4.
Toolkit industry defaults still apply as a starting point (prompt-playbook.md L79-85).

## 4. Give the product a face, then tokens
Pick ONE face move and write it down: brand hue on the main data element; a ground tinted from the client's world; a figure typeface with character. Plus: the product's name and mark in the shell, and the client's own words in labels ("Waiting on supplier", not "Status").

Token table (fill before any prompt): primary, primary-hover, surface, surface-alt, text, text-muted, border, success/warning/danger (pale tint + dark text of the same hue), radius (one choice: tight 4–6px or soft 10–12px), density (sparse / medium / dense), font family + weights.
- Check every text pair at WCAG AA (4.5:1 body, 3:1 large) before using it.
- Typography: two typefaces at most; tighter tracking on large headings (about -0.02em), body near 0; tight leading on headings, 1.45–1.6 on body; hierarchy from size + weight together; spacing in rem so larger text doesn't break layout.
- Brand always wins over any rule below. If the brand needs a "banned" device (violet, a gradient logo), keep it and note it.

## 5. House rules to put in the design block

### 5a. App screens (dashboards, portals, lists, admin)
- Colour on data, status and one primary action — not on chrome, nav or every button.
- KPIs are type (label over value, 24–30px), not tiles with icons; no sparklines on KPIs.
- Surfaces separated by a 1px border or one tone step, never both; shadows only on what floats (menus, dialogs).
- Tables: 12px grey sentence-case headers, row rules, no zebra; numbers right-aligned with tabular figures, units in grey.
- One hue per chart, four hues max per screen; no gradient area charts, no rainbow.
- Honest states: real zero prints as 0; missing = grey dash; empty block keeps its frame + one sentence; loading = grey bars at final size; errors inside the failed block with Retry and last-good time.
- No "Welcome back 👋" hero, no emoji, no placeholder names (Acme, John Doe), no vanity numbers.
- Motion: feedback only (press, hover, menus, sheets); nothing performs an entrance (see `vibe-motion-pass`).

### 5b. Public pages (portals, event sites, catalogues)
- First screen says what it is and the one action, headline ≤2 lines (~32 characters), one supporting sentence directly under it.
- Real pictures of the client's world over icons or abstract shapes; every section carries its full content.
- No eyebrow labels, gradients, glass, icon-topped card rows, or tiny tracked caps.
- Motion: at most restrained entrances on sections; feedback on every control; reduced-motion respected.

## 6. Output (in this order)

1. **Screen briefs** — §2 lines per screen.
2. **Token table** — §4, with contrast results.
3. **Design block for prompt 0** (paste into the prompt-playbook §3 template's design slot; ≤150 words):
```text
Design: <light|dark> theme using semantic theme tokens (bg/fg/border, not raw white/gray).
Primary <hex> used only for the main action and the main data element; neutrals <hex/hex>;
status as pale tints with dark text. Typography: <font>, headings <size/weight>, body 14–16px,
tabular figures for numbers. Style: <style name and its one move>; <density>; <radius>.
Surfaces flat: 1px <hex> borders or one tone step, shadows only on menus and dialogs.
KPIs as label + number, no icons. Tables: grey sentence-case headers, row rules, numbers right-aligned.
Charts: one hue each, no gradients. Motion: press/hover feedback and menus only, no entrance animations.
Optimised for <desktop|mobile-first>. Shell shows <client name/logo>. Use the client's words: <3 labels>.
```
4. **Memory entry** (account-level for a client, app-level otherwise — admins set it in the builder):
`Remember: brand colours <hex list>, logo <where>, font <x>, never use gradients or emoji, status colours as pale tints.`
5. **Open questions** for Basti or the client. Nothing is sent to the client — drafts only.

Next: optionally `vibe-design-explore`; then core build with `bastis-service-toolkit:vibe-board-builder` / `monday-vibe-builder`; then `vibe-screen-review`.

Sources: taste-skill upstream file `app-screens.md` (MIT, Leonxlnx); Emil Kowalski `apple-design` §15–16 (MIT); toolkit prompt-playbook §5.
