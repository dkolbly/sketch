# notes

Paper notes for the sketch editor. Package path: `github.com/dkolbly/sketch/notes`.

| component | what |
|---|---|
| `StickyNote` | light yellow note, bottom-right corner lifted, soft shadow underneath |
| `Page` | light beige sheet with one folded corner; faint text lines unless a `label` is set |
| `Number` | circled number for annotating a drawing: a ring (like ① ②), or with `reversed` a solid disc with a white label (like ❶ ❷) |

`StickyNote` and `Page` are resizable (`w`, `h`), centre their `label`, and have `n`/`e`/`s`/`w` connector anchors.

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

### Number

| field | default | meaning |
|---|---|---|
| `size` | 8mm | diameter |
| `label` | `"1"` | the number (any short text; two digits fit at the default font size) |
| `color` | `black` | ring color, and the label color; with `reversed`, the disc color |
| `reversed` | `false` | solid disc in `color` with a white label |
| `width` | 0.5mm | ring width |
| `family`, `weight` | `Go`, 700 | label font |
| `textScale` | 0.62 | label font size as a fraction of `size` |
| `sloppiness` | `none` | |

The label font size follows `size`. It has `n`/`e`/`s`/`w` anchors.
