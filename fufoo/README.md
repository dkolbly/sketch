# fufoo

Components for designing applications on fufoo: the fu language and the foo store. Package path: `github.com/dkolbly/sketch/fufoo`.

| component | what |
|---|---|
| `Runtime` | the fu compiler and runtime: a rounded box with a gear |
| `Library` | a compiled fu library or package: a UML package with a tab |
| `Program` | a fu program or document: a page with a folded corner and stand-in code lines |
| `Blob` | an immutable, content-addressed foo blob: a cube, with an optional `ptr` text |
| `Observable` | a named mutable slot holding a Ptr: a pill with a socket dot and a `ptr` anchor |
| `Domain` | a group of observables: a dashed container with a title tab |
| `Message` | a structured object (a proto message), drawn like a database table |

The fu components are amber and the foo components blue, so a diagram shows at a glance which side of the system each piece belongs to.

Names that appear literally in an application default to CMU Typewriter Text. These are observable, program, library and domain names, a `Message`'s header, fields and types, and a `Blob`'s `ptr`. Descriptive labels (`Runtime`, a `Blob`'s `label`) stay in CMU Serif.

All of them are resizable (`w`, `h`) except `Message`, which is resizable by `w` only.

## Message fields

A `Message` is described by two fields:

- `label` is the header.
- `text` is the field list, one field per line, written `name type notes...`, separated by spaces. The notes are everything after the type and are drawn right-aligned (PK, FK, `= 3`, ...). Blank lines are skipped.

```
id int PK
first_name varchar(255)
department_id int FK
```

Tab can't be typed in the inspector, which is why the columns are separated by spaces.

The `Message` is width-resizable (`w`), and its height follows the rows. Each field row has connection points `<name>.w` and `<name>.e`, e.g. `dept_id.e`, for connectors to a specific field.

## Fields

| field | meaning |
|---|---|
| `w`, `h` | frame (`Message` has only `w`) |
| `label` | the shape's text: a `Message`'s header, a `Domain`'s tab |
| `text` | the field list (`Message` only) |
| `stroke`, `fill`, `font`, `para`, `sloppiness` | style groups (`Message` has no `para`) |
| `ptr` | the text shown on a `Blob` (Blob only) |

Every component has `n`/`e`/`s`/`w` connector anchors, and `Observable` adds a `ptr` anchor.
