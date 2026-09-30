# aws

Sketch components from the official AWS architecture icons.
Package path: `github.com/dkolbly/sketch/aws`.

| component | fields |
|---|---|
| `EC2` | `size=20mm`, `label="EC2"`, `color="#c8511b"` |
| `Lambda` | `size`, `label`, `color="#c8511b"` |
| `DynamoDB` | `size`, `label`, `color="#2e27ad"` |
| `ElastiCache` | `size`, `label`, `color="#2e27ad"` |
| `RDS` | `size`, `label`, `color="#2e27ad"` |
| `S3` | `size`, `label`, `color="#1b660f"` |

Each icon is a square tile, `rect(0, 0, size, size)`, with the label centered
below it (`label=""` for none). Anchors: the tile outline as connection
surface, plus `n`/`e`/`s`/`w` points at the side midpoints.

The official tiles use a gradient; these use the flat first-stop color.

Check: `illus components list --src ..`
