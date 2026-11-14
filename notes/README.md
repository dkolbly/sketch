# notes

Paper notes for the sketch editor. Package path: `github.com/dkolbly/sketch/notes`.

| component | what |
|---|---|
| `StickyNote` | light yellow note, bottom-right corner lifted, soft shadow underneath |
| `Page` | light beige sheet with one folded corner; faint text lines unless a `label` is set |

Both are resizable (`w`, `h`), centre their `label`, and have `n`/`e`/`s`/`w` connector anchors.

## Fields

| field | default | meaning |
|---|---|---|
| `w`, `h` | 40x40mm / 30x40mm | frame |
| `label` | `""` | centered text; on a `Page`, setting it hides the placeholder lines |
| `curl` (StickyNote) | 6mm | size of the lifted corner |
| `corner` (Page) | `bottom-right` | `bottom-right`, `bottom-left`, `top-right`, `top-left` |
| `fold` (Page) | 7mm | size of the folded corner (at most 40% of the smaller side) |
| `stroke`, `fill`, `font`, `para`, `sloppiness` | | style groups; paper colors `#fff59d` (note) and `#f5ecd7` (page) |

The shadow is a few stacked translucent wedges (illus has no blur).
