# flowchart

Flowchart symbols and flow lines for the sketch editor.
Package path: `github.com/dkolbly/sketch/flowchart`.

| component | default frame | extra fields |
|---|---|---|
| `Process` | 40mm x 16mm | |
| `Decision` | 40mm x 24mm | |
| `Terminator` | 40mm x 14mm (keep `w >= h`) | |
| `InputOutput` | 44mm x 16mm | `skew=6mm` |
| `Subprocess` | 40mm x 16mm | `inset=4mm` |
| `Document` | 40mm x 18mm | |
| `Junction` | 10mm x 10mm | `label="A"` |
| `Flow` | connector | `start`, `end="arrow"`, `route="elbow"`, `startDir`, `endDir`, `strokeStyle` (`solid`, `dashed`, `dotted`) |

Symbols are resizable (`w`, `h`) and share the builtin `shapes.Rect` fields:
`fill`, `color`, `width`, `label`, `font`, `fontSize`, `fillStyle`,
`sloppiness`. Anchors: the outline as connection surface, plus `n`/`e`/`s`/`w`
points at the side midpoints with outward normals.

Check: `illus components list --src ..`
