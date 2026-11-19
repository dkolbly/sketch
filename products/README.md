# products

Sketch components for product symbols: a grab-bag (misc) of logos for
software products that don't belong to a larger family. AWS products
live in [`aws/`](../aws/).
Package path: `github.com/dkolbly/sketch/products`.

| component | fields                        |
|-----------|-------------------------------|
| `Redis`   | `size=20mm`, `label="Redis"`  |

`Redis` is the stacked red cube logo, converted from an SVG. Its frame is
`rect(0, 0, size, 0.859*size)` (`@frame 1 0.859`), with the label centered
below it (`label=""` for none). Anchors: the frame outline as connection
surface, plus `n`/`e`/`s`/`w` points at the side midpoints.

Check: `illus components list --src ..`
