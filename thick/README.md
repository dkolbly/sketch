# thick

Thick lines and block arrows for the sketch editor.
Package path: `github.com/dkolbly/sketch/thick`.

Requires an `illus` with point and vector X/Y accessors (`path.X(p)`,
`path.Y(p)`; fufoo branch `illus-point-xy`). Without it the package does not
compile.

A thick line is a filled band along a polyline: `stroke` is drawn around the
band's boundary, `fill` inside it. Both components are connectors (`points`),
so the editor draws them click, bend, click.

| component | default ends |
|---|---|
| `Arrow` | `start="none"`, `end="triangle"` |
| `Line` | `start="none"`, `end="none"` |

## Fields

| field | default | meaning |
|---|---|---|
| `points` | (0,0) (40,0) mm | the centerline |
| `label` | `""` | drawn at the midpoint (by length), along the line, never upside down |
| `start`, `end` | see above | end shape: `none`, `triangle`, `round`, `sharp`, `indent` |
| `thickness` | 6mm | band width |
| `radius` | 4mm | bend radius of the *centerline*: the inner edge of a bend has `radius - thickness/2` (a sharp corner if that is negative), the outer `radius + thickness/2` |
| `headWidth` | 2.2 | head width, in thicknesses (advanced) |
| `headLength` | 1.4 | head length, in thicknesses (advanced) |
| `stroke` | black, 0.5mm, solid | outline (`style.Stroke`) |
| `fill` | white, solid | band fill (`style.Fill`) |
| `sloppiness` | `none` | `none`, `casual`, `sketch`, `xkcd` |
| `font` | CMU Serif 3.5mm | label font (`style.Font`) |

## End styles

- `none`: a flat cut at the end point.
- `triangle`: a classic block-arrow head with a flat back; the tip is at the end point.
- `round`: a semicircular end reaching the end point.
- `sharp`: a head whose barbs sweep back past the point where the head meets the body.
- `indent`: a V-notch swallowtail, open at the end point.

A head is shortened (keeping its proportions) when the end segment is too short,
so each end takes at most 45% of its segment. The label is only drawn when
non-empty.
