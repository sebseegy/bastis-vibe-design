# bastis-design-toolkit

Design skills for monday.com consulting builds (Vibe apps, client-facing portals, decks).

## Contents
- `skills/vibe-brand-theming` - theme Vibe's component library to the client's brand, or the industry standard for the app type. Never ship the default look.
- `scripts/sync-emil-skills.sh` - clones [emilkowalski/skills](https://github.com/emilkowalski/skills) (animation, UI review, mobile-native, break-ui, etc.) into `vendor/` as a local reference. Install them directly with `npx skills@latest add emilkowalski/skills`.

## Setup
```
./scripts/sync-emil-skills.sh
```

## Roadmap
- Promote selected Emil skills into `skills/` (keep the MIT notice, see THIRD_PARTY.md).
- Add a Vibe UI review skill and client brand-token templates.
