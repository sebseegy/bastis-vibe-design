# Worst-case catalog

From Emil Kowalski's `break-ui/CATALOG.md` (MIT), adapted for monday board columns. Use
`example.com` / `.test` domains so nothing points at a real inbox. Paste values into the mock
board's columns (Name, Text, Long text, Email, Link, Numbers, Date, Status, People, Files).

## People and names (Name / Text / People)
| Value | Breaks |
|---|---|
| Aleksandra Wiśniewska-Kowalczyk | Long, hyphenated, diacritics; wraps at the hyphen |
| Christopher Alexander Montgomery III | Suffix; naive initials give "CI" |
| Jo / J | Very short; empty-looking column, one-letter initials, tiny click target |
| Ólafur Darri Ólafsson | Accented capital; sort and initials |
| Đặng Thị Ngọc Hân | Stacked diacritics clipped by tight line height |
| 王秀英 | CJK, no spaces; initials logic, breaks anywhere |
| نور الهدى عبد الرحمن | RTL; icons and punctuation on the wrong side |
| Seán O'Brien-Ó Súilleabháin | Apostrophe + accents; escaping, search |
| María José de la Cruz y Fernández | Lowercase particles; initials, "last name" sort |
| dana | All lowercase; initials should still be uppercase |
| 🦊 Fox / 👩🏽‍💻 Priya | Emoji first; broken initials, slicing breaks the emoji |
| "  Sam   Lee " | Extra spaces; empty-word initials, odd gaps |
| (empty) | No name at all; UI needs a fallback |

## Emails, links, identifiers (Email / Link / Text)
| Value | Breaks |
|---|---|
| bartholomew.fitzgerald@northwind-industries-holdings.example.com | Pushes siblings off the row |
| a@b.co | So short the layout looks empty |
| first.last+billing-notifications@example.com | "+" rejected or the meaningful part truncated |
| https://example.com/workspaces/acme/projects/q3-launch/docs/9f8e7d6c?tab=comments&filter=unresolved | Overflow; end-truncation hides what differs |
| Q3 Board Deck — FINAL (revised) v12 [approved by legal].pdf | End-truncation hides version and extension |
| 9f8e7d6c-5b4a-4c3d-8e2f-1a0b9c8d7e6f | Middle-truncation candidate |

## Labels and copy (Text / Long text / Status / Dropdown)
| Value | Breaks |
|---|---|
| Senior Product Design Engineer, Platform Infrastructure | Three lines in a secondary slot |
| Invitation expired 12 days ago (as a status label) | Badge wraps or squeezes the name |
| Benachrichtigungseinstellungen | 30-char German compound, unbreakable |
| Paramètres de confidentialité et de sécurité | Translation ~30% longer |
| 12 tags / one tag "customer-feedback-from-enterprise-onboarding" | Tag wall; one tag wider than its box |
| Untitled / "" / "   " | Collapsed heading, zero-height row |
| `<script>alert(1)</script>` / `&amp;` / `**bold**` | Must render as literal text |
| Line one⏎Line two in a single-line field | Doubles row height or is dropped |
| 2,000-character pasted description | Clamp, "show more", growth |

## Numbers and money (Numbers / Formula)
| Value | Breaks |
|---|---|
| 0 | "0 members", empty bars, divide-by-zero % |
| 1 | Plurals |
| 1284 / 1000000 | Separators; badge width |
| 12345678.9 as currency | Totals column overflow |
| -42.5 | Sign, red logic, accounting format |
| 142% / -3% | Bars past their bounds |
| (empty) | Rendered as null / NaN |
| 1.284 (de-DE) vs 1,284 (en-US) | Hard-coded separators |

## Collections (rows on the board)
0 items · 1 item · exactly one page and one page + 1 · 1,000+ items (Vibe initial load ~500) · one item 10× larger than the rest · two items with identical names.

## Time (Date / Timeline)
Now ("0 seconds ago") · 12 days / 11 months / 3 years ago · a future date · 1970-01-01 · 2025-12-31 23:30 in a US timezone (day shift — toolkit rule: treat dates as noon local) · a 1,284-hour duration.

## Images (Files column)
Avatar/cover missing · very wide (4000×200) · very tall (200×4000) · transparent or dark logo on dark mode · slow-loading large image.

## States
Loading · board fetch error · partial optional fields across rows · every status label at once · a user without access to a board · the current user in the list ("You").

## Environment
320–390px container · narrow side panel · 2560px wide · zoom 200% / large text · dark mode · RTL · touch device (hover-only actions unreachable).
