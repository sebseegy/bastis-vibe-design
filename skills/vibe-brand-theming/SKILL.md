---
name: vibe-brand-theming
description: Theme a monday Vibe app (or any monday-styled visual output built on Vibe's component library) to the client's brand, or to the industry standard for the app type when no brand is given. Use whenever building, restyling or reviewing a Vibe app, portal or monday-styled page, and whenever someone says "make it look like the client", "brand it", or the output looks like the generic default.
---

# Vibe brand theming

Rule: never ship the generic default look. Every monday-styled visual output is themed to the client's brand, or, absent a brand, to the industry standard for the app type.

## 1. Get the brand inputs
Ask for or find, in this order: brand guidelines or style PDF, website (colours, type, radius, density), logo files, existing app screenshots. If none exist, pick the industry standard (e.g. finance: restrained blue/grey, dense tables; HR/onboarding: warm, rounded, spacious; IT service: neutral, high-density, status-forward) and say that you chose it.

## 2. Extract a token set
Produce a small table before touching code: primary, primary-hover, surface, surface-alt, text, text-muted, border, success/warning/danger, radius scale, spacing density, font family and weights, shadow style. Check text contrast at WCAG AA (4.5:1 body, 3:1 large text) before using any pair.

## 3. Apply to Vibe
- Override Vibe's design tokens/CSS variables at the app root rather than restyling components one by one. Verify the exact token names against the current Vibe docs (vibe.monday.com) and the app's installed version; do not guess names from memory.
- Keep Vibe components for behaviour and accessibility; theme them, do not rebuild them.
- Replace status/label colours with brand-consistent equivalents, but keep red/amber/green recognisable for state.
- Swap the logo, app name and empty-state copy so nothing reads as a generic template.

## 4. Review checklist
- No default monday primary colour left on buttons, links or focus rings (unless it is the client's brand).
- Dark/light, hover, focus, disabled and error states all themed.
- Long names, empty lists and huge counts still look right.
- Mobile layout and touch targets (44px) checked.
- Client logo has clear space and a light and dark variant if needed.

## 5. Hand-off
Return the token table, what was overridden and where, and any open questions about the brand. Do not send anything to the client; approval is Basti's.

## Related
Emil Kowalski's skills (animation, review, mobile-native, break-ui) pair well after theming; sync them with `scripts/sync-emil-skills.sh`.
