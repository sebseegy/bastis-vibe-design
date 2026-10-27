# Vibe constraints every design skill obeys

Checked 2026-10-27 against `bastis-service-toolkit` and support.monday.com. Re-verify anything
client-facing that is more than 3 weeks old (the toolkit's `weekly-pulse` keeps these current).

| # | Constraint | What it means for design work | Source |
|---|---|---|---|
| C1 | Prompt-only. No code access, no view of the rendered app; no direct code editing or code export. | Every fix is a prompt that describes behaviour. Evidence is screenshots, recordings and the element selection tool. | monday-vibe-builder/references/platform-facts.md L18, L198 |
| C1b | Contradiction: some toolkit skills use a `src` code export. | Treat code as optional evidence only when Basti supplies an export; never depend on it. | vibe-prompt-injection L67; vibe-board-builder L381 |
| C2 | React web app (TanStack + server functions). | Web rules apply. React Native, Swift and native APIs do not. | platform-facts.md L37 |
| C3 | The builder picks libraries; you can't install. Whether npm libs load is an open question. | Never prescribe a library (Motion, Sonner, Base UI). Describe the behaviour. | platform-facts.md L146; vibe-board-builder/references/platform-facts.md L52-56 |
| C4 | Toolkit guidance: keep UI simple, no heavy animations. Official docs list "Create hover effects", "Make it responsive", "Switch to dark mode" as normal refinements. | Feedback motion is fine; decorative and scroll-driven motion is not. | monday-vibe/SKILL.md L107; prompt-playbook.md L77; support article 34101891654034 |
| C5 | Describe behaviour and data, not code. One change per prompt, under ~350 words. | Every output prompt follows `prompt-format.md`. | prompt-playbook.md L9-14 |
| C6 | You can't see the app. No pixel promises without a human visual check. | Ask for screenshots; mark anything judged without one as unverified. | prompt-playbook.md L164 |
| C7 | Semantic theme tokens (bg/fg/border); design direction block in prompt 0; brand in account Memory. Theme-from-URL and design gallery are UI-only. | Direction output = design block + Memory entry. | monday-vibe/SKILL.md L122; prompt-playbook.md L68-88 |
| C8 | Runs in the monday mobile app; no offline; no building on the desktop app; guests can't use mobile. | Mobile checks happen on a real phone inside the monday app. | platform-facts.md L112-114 |
| C9 | Mock boards then swap to live (Boards header, UI). Vibe DB draft and live may share one DB. Initial load stops ~500 items unless paginated. | Stress tests use a mock board, never live data or Vibe DB. | data-layer.md L42, L66-70, L23 |
| C10 | Screenshots, sketches and Figma exports work as prompt context (not embedded). Element selection tool references an element. | Hand Vibe pictures, not descriptions of pictures. | support article 34101891654034; monday-vibe/SKILL.md L141, L147 |
| C11 | Credits: ~35-454 per build prompt; failed prompts still charge. | Batch findings into few, high-value prompts; never iterate on cosmetics while correctness is open. | platform-facts.md §4 |

Unverified (don't promise): whether Vibe-generated code uses a specific component library;
whether page-level meta tags (viewport, theme-color) are controllable from an app; how `dvh`
and `@starting-style` behave in the monday mobile app; whether reduced-motion is honoured by default.
