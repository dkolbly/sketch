/// Stamps: big marks to put on top of an illustration.
/// @title Stamps
package stamps;

import (
   "gitlab.com/donovan4/fufoo/sys/illus/std/path"
   "gitlab.com/donovan4/fufoo/sys/illus/std/style"
   "gitlab.com/donovan4/fufoo/sys/illus/std/gradient"
   "gitlab.com/donovan4/fufoo/sys/illus/std/filter"
   "gitlab.com/donovan4/fufoo/sys/fu/std/types"
)

/// A big glossy green tick: a short left arm and a long right arm that sweeps
/// up and widens toward its slanted tip.  It has no label and no connector
/// anchors, since a stamp sits on top of things.  `flat` draws just the face.
/// @component
/// @frame 1 0.8
/// @choices finish glossy flat
/// @choices sloppiness none casual sketch xkcd
/// @marks finish FinishMark
/// @basic finish
/// @basic shadow
module Checkmark(size=30mm,
                 fill: style.Fill = style.Fill(color="#2db84d", style="solid"),
                 finish: types.String = "glossy",
                 shadow=true,
                 sloppiness: types.String = "none") {
  s = size/100;
  c = fill.color;
  // the outline stands in for the bounds rectangle while a client waits
  path.Skeleton() { TickOutline(s); }
  if (shadow) {
    filter.Apply(margin=size*0.15) {
      filter.DropShadow(size*0.03, size*0.05, size*0.03, color="black", opacity=0.35);
      TickBody(s, c, finish, fill, sloppiness);
    }
  } else {
    TickBody(s, c, finish, fill, sloppiness);
  }
}

/// the tick in a finish, without its shadow
module TickBody(s, c, finish, fill, sloppiness) {
  if (finish == "flat") {
    path.Path() {
      path.Stroke(path.BlendColor(c, "black", 0.4), 0.9*s, join="round", sloppiness=sloppiness);
      style.Brush(fill, sloppiness);
      Tick(s);
    }
  } else {
    GlossyTick(s, c, fill, sloppiness);
  }
}

/// the glossy tick: extruded side, lit face, bevel edges and a gloss streak
module GlossyTick(s, c, fill, sloppiness) {
  // extrusion: stacked copies from the back (offset down and right) to the face
  side = gradient.Linear(to=[0, 1]) {
    gradient.Stop(0, path.BlendColor(c, "black", 0.35));
    gradient.Stop(1, path.BlendColor(c, "black", 0.6));
  };
  for (k = [0:9]) {
    f = (9 - k) / 9;
    path.Path() {
      path.Fill(side);
      Tick(s, 2.5*f, 3.5*f);
    }
  }
  // the face, lit from the upper left
  face = gradient.Linear(from=[0.2, 0], to=[0.7, 1]) {
    gradient.Stop(0, path.BlendColor(c, "white", 0.35));
    gradient.Stop(0.45, c);
    gradient.Stop(1, path.BlendColor(c, "black", 0.2));
  };
  path.Path() {
    style.Brush(style.Fill(color=c, style=fill.style), sloppiness);
    if (fill.style == "solid") { path.Fill(face); }
    Tick(s);
  }
  // lower-right shade
  path.Difference() {
    Tick(s);
    Tick(s, -1.5, -1.5);
    path.Fill(path.BlendColor(c, "black", 0.25), opacity=0.8);
  }
  // lit upper-left edge
  lit = gradient.Linear(from=[0, 1], to=[1, 0]) {
    gradient.Stop(0, path.BlendColor(c, "white", 0.6));
    gradient.Stop(1, path.BlendColor(c, "white", 0.3));
  };
  path.Difference() {
    Tick(s);
    Tick(s, 1.5, 1.5);
    path.Fill(lit);
  }
  Gloss(s);
}

/// the highlights: a tapered streak along the long arm and a glint near its tip
module Gloss(s) {
  streak = gradient.Linear(from=[0, 1], to=[1, 0]) {
    gradient.Stop(0, "white", opacity=0);
    gradient.Stop(0.5, "white", opacity=0.75);
    gradient.Stop(1, "white", opacity=0);
  };
  path.Path() {
    path.Fill(streak);
    path.MoveTo(43*s, 58*s);
    path.CurveTo(49*s, 40*s, 64*s, 20*s, 87*s, 9*s);
    path.CurveTo(70*s, 26*s, 56*s, 42*s, 49*s, 60*s);
    path.Close();
  }
  glint = gradient.Radial() {
    gradient.Stop(0, "white", opacity=0.8);
    gradient.Stop(1, "white", opacity=0);
  };
  path.Ellipse(p=[89*s, 11*s], r=[5*s, 4*s]) { path.Fill(glint); }
}

/// the tick with slightly rounded corners, shifted by (dx, dy) design units
module Tick(s, dx=0, dy=0) {
  path.Radius(1.5*s) { TickOutline(s, dx, dy); }
}

/// the raw tick outline on a 100 x 80 design grid scaled by s (y points down)
module TickOutline(s, dx=0, dy=0) {
  path.MoveTo((3 + dx)*s, (47 + dy)*s);
  path.LineTo((16 + dx)*s, (37 + dy)*s);
  path.LineTo((37 + dx)*s, (57 + dy)*s);
  path.CurveTo((44 + dx)*s, (30 + dy)*s, (62 + dx)*s, (8 + dy)*s, (88 + dx)*s, (3 + dy)*s);
  path.LineTo((99 + dx)*s, (16 + dy)*s);
  path.CurveTo((76 + dx)*s, (28 + dy)*s, (50 + dx)*s, (52 + dy)*s, (40 + dx)*s, (79 + dy)*s);
  path.Close();
}

/// the inspector picture for a finish: a small checkmark
module FinishMark(value, field="finish") {
  Checkmark(12mm, finish=value, shadow=false);
}
