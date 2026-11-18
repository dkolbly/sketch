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
  path.Skeleton() { Outline("tick", s); }
  if (shadow) {
    filter.Apply(margin=size*0.15) {
      filter.DropShadow(size*0.03, size*0.05, size*0.03, color="black", opacity=0.35);
      StampBody("tick", s, c, finish, fill, sloppiness);
    }
  } else {
    StampBody("tick", s, c, finish, fill, sloppiness);
  }
}

/// a stamp shape ("tick" or "cross") in a finish, without its shadow
module StampBody(shape, s, c, finish, fill, sloppiness) {
  if (finish == "flat") {
    path.Path() {
      path.Stroke(path.BlendColor(c, "black", 0.4), 0.9*s, join="round", sloppiness=sloppiness);
      style.Brush(fill, sloppiness);
      Shape(shape, s);
    }
  } else {
    GlossyStamp(shape, s, c, fill, sloppiness);
  }
}

/// the glossy stamp: extruded side, lit face, bevel edges and a gloss streak
module GlossyStamp(shape, s, c, fill, sloppiness) {
  // extrusion: stacked copies from the back (offset down and right) to the face
  side = gradient.Linear(to=[0, 1]) {
    gradient.Stop(0, path.BlendColor(c, "black", 0.35));
    gradient.Stop(1, path.BlendColor(c, "black", 0.6));
  };
  for (k = [0:9]) {
    f = (9 - k) / 9;
    path.Path() {
      path.Fill(side);
      Shape(shape, s, 2.5*f, 3.5*f);
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
    Shape(shape, s);
  }
  // lower-right shade
  path.Difference() {
    Shape(shape, s);
    Shape(shape, s, -1.5, -1.5);
    path.Fill(path.BlendColor(c, "black", 0.25), opacity=0.8);
  }
  // lit upper-left edge
  lit = gradient.Linear(from=[0, 1], to=[1, 0]) {
    gradient.Stop(0, path.BlendColor(c, "white", 0.6));
    gradient.Stop(1, path.BlendColor(c, "white", 0.3));
  };
  path.Difference() {
    Shape(shape, s);
    Shape(shape, s, 1.5, 1.5);
    path.Fill(lit);
  }
  Gloss(shape, s);
}

/// the highlights: a tapered streak along the long arm of the tick (or the
/// upper left bar of the cross) and a glint near its end
module Gloss(shape, s) {
  streak = gradient.Linear(from=[0, 1], to=[1, 0]) {
    gradient.Stop(0, "white", opacity=0);
    gradient.Stop(0.5, "white", opacity=0.75);
    gradient.Stop(1, "white", opacity=0);
  };
  glint = gradient.Radial() {
    gradient.Stop(0, "white", opacity=0.8);
    gradient.Stop(1, "white", opacity=0);
  };
  if (shape == "cross") {
    path.Path() {
      path.Fill(streak);
      path.MoveTo(24*s, 24*s);
      path.CurveTo(37*s, 26*s, 52*s, 38*s, 62*s, 56*s);
      path.CurveTo(48*s, 48*s, 34*s, 38*s, 24*s, 24*s);
      path.Close();
    }
    path.Ellipse(p=[22*s, 14*s], r=[5*s, 4*s]) { path.Fill(glint); }
  } else {
    path.Path() {
      path.Fill(streak);
      path.MoveTo(43*s, 58*s);
      path.CurveTo(49*s, 40*s, 64*s, 20*s, 87*s, 9*s);
      path.CurveTo(70*s, 26*s, 56*s, 42*s, 49*s, 60*s);
      path.Close();
    }
    path.Ellipse(p=[89*s, 11*s], r=[5*s, 4*s]) { path.Fill(glint); }
  }
}

/// a shape with slightly rounded corners, shifted by (dx, dy) design units
module Shape(shape, s, dx=0, dy=0) {
  path.Radius(1.5*s) { Outline(shape, s, dx, dy); }
}

/// the raw outline of a shape, "tick" or "cross"
module Outline(shape, s, dx=0, dy=0) {
  if (shape == "cross") {
    CrossOutline(s, dx, dy);
  } else {
    TickOutline(s, dx, dy);
  }
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

/// the raw cross outline on a 100 x 100 grid: two bars of slightly different
/// angle and width, as one closed 12-point polygon
module CrossOutline(s, dx=0, dy=0) {
  path.MoveTo((19.5 + dx)*s, (5.9 + dy)*s);
  path.LineTo((51 + dx)*s, (35 + dy)*s);
  path.LineTo((82.5 + dx)*s, (2.7 + dy)*s);
  path.LineTo((97.5 + dx)*s, (17.3 + dy)*s);
  path.LineTo((66.5 + dx)*s, (49.2 + dy)*s);
  path.LineTo((95.5 + dx)*s, (75.9 + dy)*s);
  path.LineTo((80.5 + dx)*s, (92.1 + dy)*s);
  path.LineTo((51.1 + dx)*s, (65 + dy)*s);
  path.LineTo((21.5 + dx)*s, (95.3 + dy)*s);
  path.LineTo((6.5 + dx)*s, (80.7 + dy)*s);
  path.LineTo((35.6 + dx)*s, (50.7 + dy)*s);
  path.LineTo((4.5 + dx)*s, (22.1 + dy)*s);
  path.Close();
}

/// A big glossy red cross, the tick's partner: two bold bars of slightly
/// different angle crossing in an energetic X.  It has no label and no
/// connector anchors, since a stamp sits on top of things.  `flat` draws just
/// the face.
/// @component
/// @frame 1 1
/// @choices finish glossy flat
/// @choices sloppiness none casual sketch xkcd
/// @marks finish CrossFinishMark
/// @basic finish
/// @basic shadow
module Cross(size=30mm,
             fill: style.Fill = style.Fill(color="#e0302b", style="solid"),
             finish: types.String = "glossy",
             shadow=true,
             sloppiness: types.String = "none") {
  s = size/100;
  c = fill.color;
  path.Skeleton() { Outline("cross", s); }
  if (shadow) {
    filter.Apply(margin=size*0.15) {
      filter.DropShadow(size*0.03, size*0.05, size*0.03, color="black", opacity=0.35);
      StampBody("cross", s, c, finish, fill, sloppiness);
    }
  } else {
    StampBody("cross", s, c, finish, fill, sloppiness);
  }
}

/// the inspector picture for a cross finish: a small cross
module CrossFinishMark(value, field="finish") {
  Cross(12mm, finish=value, shadow=false);
}

/// the inspector picture for a finish: a small checkmark
module FinishMark(value, field="finish") {
  Checkmark(12mm, finish=value, shadow=false);
}
