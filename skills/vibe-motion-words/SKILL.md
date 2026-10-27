---
name: vibe-motion-words
description: "Reference for any phase: turns a vague description of a motion or UI effect into its exact name ('the bouncy thing when a menu opens' → Pop in; 'the iOS overscroll snap-back' → Rubber-banding) so Basti can prompt Vibe or brief a designer precisely, and flags effects that monday Vibe guidance discourages. Use when Basti asks 'what's it called when…', describes an effect without its name, or wants the right word for a Vibe prompt."
---

# Vibe motion words

1. **Read for intent**, not keywords — users describe what they see or feel ("springy", "draws itself in").
2. **Quote the glossary** in `references/glossary.md` verbatim; lead with the term.
3. **Disambiguate** close terms (Crossfade vs Morph vs Shared element transition; Pop in vs Bounce; Clip-path vs Mask) in one line each.
4. **Nothing matches** → closest term, say it's an approximation, or describe it in glossary words ("a stagger of scale-in entrances").
5. **Stay in the glossary**; don't invent terms.
6. **Flag Vibe fit.** Terms marked ⚠ describe effects Vibe guidance discourages (`../vibe-design/references/vibe-constraints.md` C3, C4). Name them, then offer the Vibe-safe alternative (e.g. Rubber-banding ⚠ → use native scroll; Parallax ⚠ → static image).
7. **Keep it tight.** A naming question wants a name. For whether to use it, point to `vibe-motion-pass`.

Format:
```
**Origin-aware animation** — An element animates out of its trigger, like a popover growing from the button that opened it instead of from its own center.
Vibe fit: ✓ (prompt: "menus grow from the element that opened them")
```

Source: Emil Kowalski `animation-vocabulary` (MIT).
