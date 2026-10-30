# Notes for updating "Writing sketch components"

Findings from writing the `flowchart` package against
`docs/build/html/illus/sketch/components.html`. Ordered by how much time each
cost. "Bug" means the tool, not the page; the page should still mention it
until fixed.

## 1. Bugs the page should warn about (or that should be fixed)

### 1.1 `illus components render` panics on any text
- Repro: `illus components render --src DIR -F label=hi -o x.svg shapes.Rect`
  (builtin, so not specific to a library). Any component that draws a
  `text.Typeset` with non-empty text does it, including the page's own Badge
  example. A component with `label=""` renders fine.
- Failure: `panic: nil pointer dereference` in
  `localfonts.(*FontPath).checkCache` <- `FontPath.Lookup` (receiver is nil)
  <- `svg.(*rendering).lookupFace`. Setting `font=Go` does not help.
- The page says fonts fall back to the bundled Go fonts, so the nil font path
  should not be reachable. Either fix, or document a flag/env var that sets up
  a font path for the `components` command.
- Consequence: the "Preview it without building anything" section cannot
  verify labels from the CLI. I could not check text placement at all.
- Related: a component whose *default* label is non-empty (e.g. `Junction`,
  default `"A"`) fails the "render with defaults" test in the Testing section
  for this reason alone.

### 1.2 `requires:` in fu.meta.yaml breaks `--src .`
- A library that depends on another library declares
  `requires: [github.com/dkolbly/illus-test@v0.3.0]`. This key is not
  documented anywhere on the page (the page only shows `module`, `version`,
  and `illus:`).
- With it present, `illus components list --src .` fails:
  `ILS-3222 requires github.com/dkolbly/illus-test, which is not a --src
  directory (fetched requirements for --src modules come with workspaces)`.
- Needs: document `requires` (syntax, `@version`, relationship to "pins the
  exact commit"), and document how to develop a library that has requirements
  (workspaces? an additional `--src` for each dependency? `--git-map`?). The
  error mentions "workspaces", which the page never defines.
- Workaround used: test from a copy with the `requires` line and the files
  that import the dependency removed.

## 2. Missing information that required reading source

### 2.1 `path.Connector` arguments
The Connector section's example passes only `points`. The following section
lists `start`, `end`, `route`, `startDir`, `endDir` as fields "the editor
understands", but never says they must be forwarded to `path.Connector`. The
builtin does:
```
path.Connector(points, start=start, end=end, route=route,
               startDir=startDir, endDir=endDir) { path.Stroke(...) }
```
Show this full form, say that the markers/route are drawn by `Connector`
itself (not by the author), and list its keyword arguments.

### 2.2 `types` import path
"Annotate string fields as `types.String` (import
`gitlab.com/donovan4/fufoo/sys/fu/std/types`)" is a parenthetical in the
Fields section. The first-component example never imports it. Put the import
and a one-line `name: types.String = "x"` example in the Field tags section
(where `@choices` is introduced), and note the doc-comment tags still go
*above* the module. A complete example with `@choices` would help; I copied
it from `shapes.il`.

### 2.3 Path operation signatures
`path.CurveTo`, `path.MoveTo`, `path.LineTo`, `path.Close` are used without
saying their arguments. I inferred `CurveTo(c1x, c1y, c2x, c2y, x, y)`
(absolute, cubic) from existing code. The page defers to "the illus graphics
reference", but that is not linked. Link it, or give a 6-line cheat sheet.
There is also no arc/ellipse primitive that I found; a stadium or circle had to
be built from cubic Béziers with the 0.5523 constant. Say so (or add `Arc`).

### 2.4 Label centring
The builtin comment "Typeset's first baseline is about an em below its top,
and capitals are about 0.7em tall", hence `Translate(w/2, h/2 - 0.6*fontSize)`,
exists only as a comment in `shapes.il`. It is the standard recipe for a
centred label; put it on the page next to the first component (the Badge
example already uses it without explanation).

### 2.5 Helper modules inside a library
Not stated whether a library may define untagged helper modules and call them
from components. It works (`Anchors` in flowchart did not appear in
`components list`) and the page says "Use untagged modules for helpers", but it
should say helpers may be shared across files in a package and may take
positional arguments with no defaults.

## 3. Connection anchors (the section that needs the most expansion)

### 3.1 State that an explicit `normal` wins over the surface normal
The page says a point *without* a normal takes one from the surface. It never
says that an explicit `normal` is used as-is. That is the whole reason to give
one on a slanted shape, and I only had the user's description to rely on.
Worked example (flowchart `InputOutput`, a parallelogram): at mid-height the
slanted edge's true normal is not horizontal, but `e`/`w` declare
`normal=[1,0]`/`[-1,0]` so connectors enter horizontally.

### 3.2 Say that points must lie on the outline
An anchor is where a connector ends, so it should be on the surface. The
builtin shapes make this easy (side midpoints), so it is not stated. My first
`InputOutput` used the generic helper's `(0, h/2)` and `(w, h/2)`, which are
`skew/2` *outside* the parallelogram. Nothing diagnosed it (no error, nothing
drawn for anchors). Add: "points are not clipped or checked; a point off the
outline binds to empty space", or add a lint (a warning when a point is more
than epsilon from every surface).

### 3.3 Convention for symmetric flowchart-like shapes
For shapes where connectors are used in vertical/horizontal flows, `n`/`s`
should share an x and `e`/`w` a y so straight flows stay collinear through the
symbol. For the parallelogram: define the geometry as the top edge shifted
`+skew/2` and the bottom `-skew/2` from the centre line `x = w/2`; then
`n=(w/2,0)`, `s=(w/2,h)`, `e=(w-skew/2,h/2)`, `w=(skew/2,h/2)`. This is only on
the outline while `skew < w/2`; say whether the author should clamp.

### 3.4 Surface requirements
"It should be convex" is a "should". What happens with a non-convex surface
(a `Document` with a wavy bottom is *nearly* convex but not strictly)? State
the actual consequence (snapping picks the wrong side? errors?). I used the
same outline path for the surface and the drawing, curves included; confirm
that curves are allowed in surfaces.

### 3.5 Resizing and anchors
Anchors are computed from `w`/`h` each render, so they follow resizing. Worth
one sentence, since the Compatibility section makes "fields are the contract"
sound like only the fields matter.

## 4. Smaller inconsistencies

- `shapes.Line` has the `@choices` tags but no `@component` in `shapes.il`
  yet appears in `components list`. The page says an untagged declaration is
  not a component. Either the builtin is exempt (say so) or it is an omission.
- `-F field=value`: only fields that exist are accepted (`ILC-1009 no field
  "label"` for `Flow`). Say so and give the syntax for lengths/colors/bools
  (`-F size=60mm` appears in the repo README but not the page).
- `illus components render` needs the full `pkg.Name`; for builtins it is
  `shapes.Rect`, for libraries the full import path
  `github.com/me/lib/pkg.Name`. Show one of each.
- Error format: the page gives `file:line: (ILS-31nn) text`, but the errors I
  saw were `(ILC-1009) ...` and `fu.meta.yaml: (ILS-3222) ...`, with no line
  number. Loosen the description.
- The first-component example's `module:` is `example.com/me/badges` and the
  later text mentions `gitlab.com/me/uml`; this repo's is
  `github.com/dkolbly/sketch`. Say which hosts are supported (the section on
  Git says "public Git repositories"; `--git-map` exists but is not described).
- `fonts` import alias: the page's example imports
  `.../std/font` as `fonts`; `shapes.il` does the same, but the aws files here
  import it unaliased as `font`. Both work; the field named `font` shadowing a
  package named `font` is a trap, so recommend the alias.
- Default label convention: builtin shapes use `label=""`, aws uses the
  component's name. Recommend one in Style conventions, since a non-empty
  default label also interacts with bug 1.1.
- The page has no table of the style-field set for *symbols* (as opposed to
  connectors): `fill, color, width, label, font, fontSize, fillStyle,
  sloppiness`, in that order. I reused the order from `Rect`; a "standard
  signature" snippet would let authors copy it verbatim.

## 5. Testing section
- "Keep a snapshot ... compare it in CI" refers to `compat_test.go` and
  `testdata/compat.json` of the builtin, which a library author cannot reach.
  Provide a command that writes the snapshot and one that checks it, e.g.
  `illus components list --src . --format json > compat.json` and
  `illus components check --against compat.json`, or document that
  `components list` output is stable enough to diff. I did not add a snapshot
  to this repo because there was nothing to run it with.
- "Render every component in the palette preview (`with_previews`)": where is
  `with_previews` set? It is not a flag of `components render`. Clarify.

## 6. Things that went well (keep)
- The module/fields model is quick to learn; `illus components list` compiled
  and reported all of a new package's fields on the first try.
- Tag validation (`@choices`, `@font`) reports at library compile time.
- Helper modules are cleanly hidden from the palette.
