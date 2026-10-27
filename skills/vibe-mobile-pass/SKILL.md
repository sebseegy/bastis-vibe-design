---
name: vibe-mobile-pass
description: "UI-improvements phase for a monday Vibe app used on phones (field teams, a Vibe app set as the mobile home, ops apps): applies the in-app fixes that make a web app feel native on a phone and the phone-layout rules for app screens, as paste-ready Vibe prompts, then gives Basti a real-device test script to run inside the monday mobile app. Use when Basti says 'mobile pass', 'it feels janky on the phone', 'field users', 'mobile-first', 'the phone layout is broken', 'zooms into the input', 'hover stuck on tap'. Not for desktop polish (vibe-screen-review)."
---

# Vibe mobile pass

Vibe apps run inside the monday mobile app; there's no offline mode, and guests can't use mobile
(`../vibe-design/references/vibe-constraints.md` C8). The phone is the source of truth: desktop
emulation doesn't reproduce sticky hover, tap delay, input zoom or the keyboard.

## 0. Check fit first
- Guests expected on phones? → they can't use the mobile app; raise it with Basti before any design work.
- Who: field staff (one hand, gloves, sunlight) or office staff checking in? It sets density and tap-target size.

## 1. In-app fixes (promptable)

| Symptom | Ask Vibe for | Why |
|---|---|---|
| Hover state stays after a tap | Hover styles only for mouse devices (`hover: hover` and `pointer: fine`); touch gets press feedback | Touch fakes hover on first tap |
| No feedback until finger lifts; taps feel laggy | Press feedback on touch-down (scale 0.97, 100–150ms); `touch-action: manipulation` on buttons and links | Feedback on release reads as lag; removes double-tap delay |
| Page zooms when typing | Inputs at 16px minimum; correct keyboards (`inputmode` numeric/decimal, email, tel) | iOS zooms below 16px and doesn't zoom back |
| Long-press selects button text | `user-select: none` on buttons, tabs, chips only — never on content | Content must stay copyable |
| Inner list scroll drags the page | Inner scroll areas contain their overscroll | Stops scroll chaining |
| Carousel/strip scrolls the page vertically | Horizontal strips: native scroll-snap, the page keeps vertical panning | Browser can't guess the axis |
| Bottom-pinned button hidden behind browser chrome | Size full-height layouts to the visible viewport (dynamic viewport height) — UNVERIFIED inside the monday app, test it | `100vh` is the largest viewport |
| Grey/blue flash on tap | Remove the tap highlight colour; every tappable keeps its own pressed state — UNVERIFIED scope inside the app | Default highlight fights designed feedback |

Never ask for: disabling zoom (accessibility failure — fix input size instead). Don't prompt for viewport-fit/safe-area, `theme-color` or root overscroll meta: the monday app owns the page shell (UNVERIFIED, likely not controllable).

## 2. Phone layout rules for app screens
- Navigation folds: a top bar with the screen name + menu sheet, or a bottom bar of 4–5 labelled destinations.
- Margins 16–20px; touch targets ≥44px tall; data and labels 14px, sublines ≥12px; title stays at 20–24px.
- Filters collapse into one row of chips or a Filters sheet; the first list row starts in the top 60% of the screen.
- KPIs: 2-column grid or a label-left/value-right list — never four squeezed columns.
- Tables below ~640px become two-line rows: identity + key number on line 1, other fields in grey on line 2, one action on the right. Fields move, never disappear. The page never scrolls sideways.
- Blocks with an action move up (a "5 items low · Review" summary row), not below long lists.
- List + detail: one at a time; back returns to the list at its scroll position.
- Tabs never slide between each other; switch instantly.
- Never fix a height that text has to fit — large-text settings must not clip.

## 3. Output
1. Findings: `# | Screen | Symptom (seen on device / inferred) | Fix | Prompt #`.
2. Prompts per `../vibe-design/references/prompt-format.md`. Bundle the global fixes in §1 into one "mobile hardening" prompt; screen layout fixes one per screen.
3. **Device test script for Basti** (monday mobile app, a phone a few years old):
   1. Open the app from the monday mobile app as a member (and as the target licence type).
   2. Tap every button once: no lingering highlight, feedback starts on touch-down.
   3. Focus each input: no zoom; right keyboard appears; nothing hides behind the keyboard.
   4. Scroll each list to the end and back; the page doesn't drag; no sideways scroll anywhere.
   5. Turn the phone to landscape once; switch to large text in OS settings; nothing clips.
   6. Turn on reduced motion; movement drops, feedback stays.
   7. Note each failure with a screenshot and paste it back here.

Say which findings you verified from screenshots and which need the phone.

Sources: Emil Kowalski `mobile-native`, `animate-expo` (MIT); taste-skill upstream file `app-screens.md` §12 (MIT).
