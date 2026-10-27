---
name: vibe-break-test
description: "QA phase for a monday Vibe app, before UAT or go-live: stress-tests each screen with realistic worst-case data (long hyphenated names, unbreakable emails, one-letter names, missing fields, 0 / 1 / 1,000+ items, huge numbers, non-Latin and RTL text, emoji, every status at once) loaded onto a MOCK board that is swapped in and out, then reports what broke with a fix prompt for each. Use when Basti says 'break test', 'stress test the vibe', 'edge cases', 'worst case data', 'does it hold up with real data', or is preparing UAT. Never runs against live client boards or Vibe DB."
---

# Vibe break test

Demo data is chosen to make the design look good. This undoes that, one field at a time, with
values real users produce. Nonsense strings ("aaaa…") prove nothing.

## Safety rules (non-negotiable)
1. **Mock board only.** Duplicate the board the screen reads (structure, no live data), fill it with the worst case, and swap it in via the app's Boards header; swap back after (`../vibe-design/references/vibe-constraints.md` C9). Never edit a client's live board for a test.
2. **Never test with Vibe DB data** — draft and live may share one database, so test writes can land in production (C9).
3. **Change the data, not the app.** No temporary "worst case" screens or toggles inside the Vibe app — new app surface is a red flag (vibe-prompt-injection L62).
4. **Report before fixing.** Some breaks are decisions (truncate or wrap?). List all, then stop.
5. Basti makes the board changes (or approves them); drafts only to anyone outside.

## Workflow
1. **Map the surface.** Per screen, list every value it renders: field, board column (ID + type), optional?, any limit. Include counts in headers, relative dates, status labels, button labels from data, avatars, and the list length itself. Board column types set some limits; where none is known, mark "unbounded".
2. **Build one worst-case dataset** from `references/catalog.md`, spreading different failures across the first rows (that's what's on screen). Add separate states: **Empty** (0 items), **One** (1 item, every count = 1), **Huge** (1,000+ items — also checks Vibe's ~500-item initial load and pagination, C9).
3. **Swap in the mock board** and screenshot each state at: the real container width, 320–390px, the widest layout, browser zoom 200%, dark mode, and RTL if the client has RTL users.
4. **Break it** — look for these signatures:

| What you see | Usual fix to ask for |
|---|---|
| Avatar/icon squished into an oval | Fixed-size boxes never shrink |
| Text overflows instead of wrapping/truncating | Text columns may shrink (min-width 0) |
| Email/URL runs off the edge | Long unbroken strings break anywhere when needed |
| Row action (•••, button) pushed off-screen | Middle text shrinks; the action never does |
| Badge wraps onto two lines | Badges don't wrap or shrink; decide what yields |
| Wrong initials ("J" for Jo, "CI", "�" for emoji names) | Initials from first + last word by character, with an icon fallback |
| Orphan "—" or blank line for a missing optional field | Omit the line, or reserve its height on purpose |
| "1 members", "0 member" | Proper plural forms per count |
| 1284, NaN, undefined, 0.30000000000000004 | Locale number formatting; guard empty values |
| Numbers jitter or columns misalign | Tabular figures, right-aligned |
| Truncated text with no way to read it | Tooltip or full value in the detail view |
| Clipped diacritics (Vietnamese, Thai) | Looser line height, no clipping on text |
| Broken image in avatar/cover | Initials fallback; cover-fit any aspect ratio |
| 1,000 rows stutter or stop at 500 | Paginate or load more, with the same filters |
| Raw `<b>`, `&amp;`, `**text**` shown | Render user text as literal text |

Per field choose: **wrap** (names, titles in detail views), **truncate end** (secondary metadata) + a way to see it, **truncate middle** (file names, long shared-domain emails), **clamp** (card previews), **never truncate** numbers, money, dates.

## Output

### 1 — What broke (worst first)
| # | Severity | Screen | Field | Worst-case value | What happens | Fix | Prompt # |
|---|---|---|---|---|---|---|---|
Severity: **Broken** (unreadable, action unreachable, wrong data) · **Ugly** (readable but visibly wrong) · **Fragile** (one realistic step from breaking).

### 2 — Decisions for Basti
Breaks with more than one right answer, one line each with a recommendation.

### 3 — What held up
The worst cases the app already handles — proof the test was real.

### 4 — Fix prompts
Per `../vibe-design/references/prompt-format.md`, one change each, grouped by screen; each names the field and the value that broke it, and ends with "Verify with the mock board, then I'll swap the live board back."

Keep the mock board as the regression fixture for the next change. Then hand to `bastis-service-toolkit:uat`.

Source: Emil Kowalski `break-ui` + `CATALOG.md` (MIT).
