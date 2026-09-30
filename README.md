# sketch

A library of components for the illus `sketch` editor. Each component is an
exported fu `module` that draws itself in its own frame (mm, y-down) and takes
fields, with defaults, that the editor lets you change.

The repository is one library module, `github.com/dkolbly/sketch` (see
`fu.meta.yaml`), and each directory is a package of it:

| package | contents |
|---|---|
| [`aws`](aws/) | AWS architecture icons: EC2, Lambda, DynamoDB, ElastiCache, RDS, S3 |

A component is addressed as `<package path>.<Name>`, e.g.
`github.com/dkolbly/sketch/aws.S3`.

## Conventions

- A component's frame is `rect(0, 0, size, size)`, or `w` by `h` for
  resizable ones. The default size is 20mm.
- An optional `label` field draws text centered below the frame.
- Connector anchors: the frame outline as the connection surface, plus
  `n`/`e`/`s`/`w` points at the side midpoints.
- Components are pure: no clock, randomness or I/O.

## Using it

List the components and their fields (compile errors print as `file:line:`):

    illus components list --src .

Render one to SVG:

    illus components render --src . -F size=60mm -o out.svg github.com/dkolbly/sketch/aws.S3

Or try them in the editor with `sketch --local --src .`.
