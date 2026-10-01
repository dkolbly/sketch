package aws;

import (
   "gitlab.com/donovan4/fufoo/sys/illus/std/path"
   "github.com/dkolbly/illus-test/base"
)

/// An S3 tile with a badge (from github.com/dkolbly/illus-test/base) in
/// its top right corner, inset by base.Inset; `note` is the badge label
/// (the badge is a third of the tile).
/// @component
module TaggedS3(size=20mm, label="S3", note="!") {
  S3(size=size, label=label);
  b = size/3;
  path.Translate(size - b - base.Inset(size), base.Inset(size)) {
    base.Badge(size=b, label=note, tint="#ff9900");
  }
}
