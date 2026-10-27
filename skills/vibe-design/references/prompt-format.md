# Output prompt format (all skills)

Every fix leaves this plugin as a paste-ready Vibe prompt. Same anatomy as
`bastis-service-toolkit:vibe-prompt-injection` §4, so that skill can run the loop unchanged.

```text
<Target app> · <Page/screen> · One change.

Current: <what the screenshot shows — concrete, observable>.

Change: <the behaviour or look you want, in plain words, with exact values where they matter
(colour hex, size, duration, easing)>.

Do not change <data, write paths, permissions, other screens, board structure>.
Keep everything else unchanged.

Verify: <what Basti should see after — at desktop and phone width>.
Report: what you changed and anything you could not do.
```

Rules
- One job per prompt; under ~350 words (prompt-playbook.md L9-14).
- Describe behaviour, never code or a library name (C1, C3). Values are fine: `200ms`, `#0B5FFF`, `16px`.
- For a specific element, tell Basti to click it with the element selection tool instead of describing where it is.
- Attach a screenshot when the change is visual ("as in the attached image").
- Group by screen. Hand off in priority order with the hold rule: only queue prompts that touch different screens.
- Design prompts come after correctness. Never spend a prompt on polish while a data or permission bug is open (C11).
