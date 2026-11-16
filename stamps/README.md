# stamps

Big marks to put on top of an illustration. Package path: `github.com/dkolbly/sketch/stamps`.

| component | what |
|---|---|
| `Checkmark` | a big glossy green tick: extruded dark side, lit face, bevel edges and a gloss streak, with a soft shadow |

Resizable by `size` (the frame keeps a 1 : 0.8 aspect).

## Fields

| field | default | meaning |
|---|---|---|
| `size` | 30mm | width of the frame (its height is 0.8 times this) |
| `fill` | `#2db84d`, solid | the tick's color; every shade is derived from `fill.color` |
| `finish` | `glossy` | `glossy` (3D, shaded) or `flat` (just the face, with a thin darker outline) |
| `shadow` | on | a soft drop shadow under the tick |
| `sloppiness` | `none` | `none`, `casual`, `sketch`, `xkcd`; hand-draws the face (and the outline when `flat`) |

`finish` and `shadow` are on the Basic tab; the inspector shows a small tick for each finish.

## Notes

- A stamp has no label and no connection anchors, on purpose: it sits on top of things and should not attract connectors. This is a deliberate exception to the library conventions. Its skeleton is the tick outline rather than the bounds rectangle.
- The shading uses illus gradients. SVG, PNG and the sketch canvas draw them exactly; a PDF shows a flat color per shape.
- The shadow is a filter, so the canvas draws it as an image.
- With a sloppy `glossy` finish only the face is hand-drawn; the extrusion and highlights stay crisp.
