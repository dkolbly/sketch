package flowchart;

import (
   "gitlab.com/donovan4/fufoo/sys/illus/std/path"
   fonts "gitlab.com/donovan4/fufoo/sys/illus/std/font"
   "gitlab.com/donovan4/fufoo/sys/illus/std/text"
   "gitlab.com/donovan4/fufoo/sys/fu/std/types"
)

/// The centered label shared by the flowchart symbols (a helper, not a component).
module Caption(w, h, label, font, fontSize, color) {
  path.Translate(w/2, h/2 - 0.6*fontSize) {
    text.Typeset(label, align="center") {
      fonts.Family(font);
      fonts.Size(fontSize);
      path.Fill(color);
    }
  }
}

/// The n/e/s/w anchors at the side midpoints of the w by h frame (a helper).
module Anchors(w, h) {
  path.ConnectionPoint(w/2, 0, name="n", normal=[0, -1]);
  path.ConnectionPoint(w, h/2, name="e", normal=[1, 0]);
  path.ConnectionPoint(w/2, h, name="s", normal=[0, 1]);
  path.ConnectionPoint(0, h/2, name="w", normal=[-1, 0]);
}

/// A process step: a rectangle with a label.
/// @component
/// @font font
/// @choices fillStyle solid hachure crosshatch
/// @choices sloppiness none casual sketch xkcd
module Process(w=40mm, h=16mm, fill="#ccccfb", color="black", width=0.5mm,
            label="", font="CMU Serif", fontSize=3.5mm,
            fillStyle: types.String = "solid",
            sloppiness: types.String = "none") {
  path.Path() {
    path.Stroke(color, width, sloppiness=sloppiness);
    path.Fill(fill, style=fillStyle, sloppiness=sloppiness);
    path.MoveTo(0, 0);
    path.LineTo(w, 0);
    path.LineTo(w, h);
    path.LineTo(0, h);
    path.Close();
  }
  Caption(w, h, label, font, fontSize, color);
  path.ConnectionSurface() {
    path.MoveTo(0, 0);
    path.LineTo(w, 0);
    path.LineTo(w, h);
    path.LineTo(0, h);
    path.Close();
  }
  Anchors(w, h);
}

/// A decision: a diamond with a label (a yes/no question).
/// @component
/// @font font
/// @choices fillStyle solid hachure crosshatch
/// @choices sloppiness none casual sketch xkcd
module Decision(w=40mm, h=24mm, fill="#ccccfb", color="black", width=0.5mm,
            label="", font="CMU Serif", fontSize=3.5mm,
            fillStyle: types.String = "solid",
            sloppiness: types.String = "none") {
  path.Path() {
    path.Stroke(color, width, sloppiness=sloppiness);
    path.Fill(fill, style=fillStyle, sloppiness=sloppiness);
    path.MoveTo(w/2, 0);
    path.LineTo(w, h/2);
    path.LineTo(w/2, h);
    path.LineTo(0, h/2);
    path.Close();
  }
  Caption(w, h, label, font, fontSize, color);
  path.ConnectionSurface() {
    path.MoveTo(w/2, 0);
    path.LineTo(w, h/2);
    path.LineTo(w/2, h);
    path.LineTo(0, h/2);
    path.Close();
  }
  Anchors(w, h);
}

/// A start or end: a stadium (rounded ends, radius h/2); keep w at least h.
/// @component
/// @font font
/// @choices fillStyle solid hachure crosshatch
/// @choices sloppiness none casual sketch xkcd
module Terminator(w=40mm, h=14mm, fill="#ccccfb", color="black", width=0.5mm,
            label="", font="CMU Serif", fontSize=3.5mm,
            fillStyle: types.String = "solid",
            sloppiness: types.String = "none") {
  path.Path() {
    path.Stroke(color, width, sloppiness=sloppiness);
    path.Fill(fill, style=fillStyle, sloppiness=sloppiness);
    path.MoveTo(h/2, 0);
    path.LineTo(w - h/2, 0);
    path.CurveTo(w - h/2 + 0.5523*h/2, 0, w, h/2 - 0.5523*h/2, w, h/2);
    path.CurveTo(w, h/2 + 0.5523*h/2, w - h/2 + 0.5523*h/2, h, w - h/2, h);
    path.LineTo(h/2, h);
    path.CurveTo(h/2 - 0.5523*h/2, h, 0, h/2 + 0.5523*h/2, 0, h/2);
    path.CurveTo(0, h/2 - 0.5523*h/2, h/2 - 0.5523*h/2, 0, h/2, 0);
    path.Close();
  }
  Caption(w, h, label, font, fontSize, color);
  path.ConnectionSurface() {
    path.MoveTo(h/2, 0);
    path.LineTo(w - h/2, 0);
    path.CurveTo(w - h/2 + 0.5523*h/2, 0, w, h/2 - 0.5523*h/2, w, h/2);
    path.CurveTo(w, h/2 + 0.5523*h/2, w - h/2 + 0.5523*h/2, h, w - h/2, h);
    path.LineTo(h/2, h);
    path.CurveTo(h/2 - 0.5523*h/2, h, 0, h/2 + 0.5523*h/2, 0, h/2);
    path.CurveTo(0, h/2 - 0.5523*h/2, h/2 - 0.5523*h/2, 0, h/2, 0);
    path.Close();
  }
  Anchors(w, h);
}

/// Input or output: a parallelogram, slanted by `skew`.
/// @component
/// @font font
/// @choices fillStyle solid hachure crosshatch
/// @choices sloppiness none casual sketch xkcd
module InputOutput(w=44mm, h=16mm, fill="#ccccfb", color="black", width=0.5mm, skew=6mm,
            label="", font="CMU Serif", fontSize=3.5mm,
            fillStyle: types.String = "solid",
            sloppiness: types.String = "none") {
  path.Path() {
    path.Stroke(color, width, sloppiness=sloppiness);
    path.Fill(fill, style=fillStyle, sloppiness=sloppiness);
    path.MoveTo(skew, 0);
    path.LineTo(w, 0);
    path.LineTo(w - skew, h);
    path.LineTo(0, h);
    path.Close();
  }
  Caption(w, h, label, font, fontSize, color);
  path.ConnectionSurface() {
    path.MoveTo(skew, 0);
    path.LineTo(w, 0);
    path.LineTo(w - skew, h);
    path.LineTo(0, h);
    path.Close();
  }
  // Anchors, relative to the centre line x = w/2: the top edge is shifted
  // +skew/2 and the bottom edge -skew/2, so at mid-height the slant cancels.
  // n and s share x = w/2 (collinear for vertical flows); e and w sit on the
  // slanted edges with horizontal normals.
  path.ConnectionPoint(w/2, 0, name="n", normal=[0, -1]);
  path.ConnectionPoint(w - skew/2, h/2, name="e", normal=[1, 0]);
  path.ConnectionPoint(w/2, h, name="s", normal=[0, 1]);
  path.ConnectionPoint(skew/2, h/2, name="w", normal=[-1, 0]);
}

/// A predefined process (subroutine): a rectangle with double side bars, `inset` from each edge.
/// @component
/// @font font
/// @choices fillStyle solid hachure crosshatch
/// @choices sloppiness none casual sketch xkcd
module Subprocess(w=40mm, h=16mm, fill="#ccccfb", color="black", width=0.5mm, inset=4mm,
            label="", font="CMU Serif", fontSize=3.5mm,
            fillStyle: types.String = "solid",
            sloppiness: types.String = "none") {
  path.Path() {
    path.Stroke(color, width, sloppiness=sloppiness);
    path.Fill(fill, style=fillStyle, sloppiness=sloppiness);
    path.MoveTo(0, 0);
    path.LineTo(w, 0);
    path.LineTo(w, h);
    path.LineTo(0, h);
    path.Close();
  }
  path.Path() {
    path.Stroke(color, width, sloppiness=sloppiness);
    path.MoveTo(inset, 0); path.LineTo(inset, h);
    path.MoveTo(w - inset, 0); path.LineTo(w - inset, h);
  }
  Caption(w, h, label, font, fontSize, color);
  path.ConnectionSurface() {
    path.MoveTo(0, 0);
    path.LineTo(w, 0);
    path.LineTo(w, h);
    path.LineTo(0, h);
    path.Close();
  }
  Anchors(w, h);
}

/// A document: a rectangle with a wavy bottom edge.
/// @component
/// @font font
/// @choices fillStyle solid hachure crosshatch
/// @choices sloppiness none casual sketch xkcd
module Document(w=40mm, h=18mm, fill="#ccccfb", color="black", width=0.5mm,
            label="", font="CMU Serif", fontSize=3.5mm,
            fillStyle: types.String = "solid",
            sloppiness: types.String = "none") {
  path.Path() {
    path.Stroke(color, width, sloppiness=sloppiness);
    path.Fill(fill, style=fillStyle, sloppiness=sloppiness);
    path.MoveTo(0, 0);
    path.LineTo(w, 0);
    path.LineTo(w, 0.85*h);
    path.CurveTo(0.75*w, 0.65*h, 0.75*w, 0.65*h, w/2, 0.85*h);
    path.CurveTo(0.25*w, 1.05*h, 0.25*w, 1.05*h, 0, 0.85*h);
    path.Close();
  }
  Caption(w, h, label, font, fontSize, color);
  path.ConnectionSurface() {
    path.MoveTo(0, 0);
    path.LineTo(w, 0);
    path.LineTo(w, 0.85*h);
    path.CurveTo(0.75*w, 0.65*h, 0.75*w, 0.65*h, w/2, 0.85*h);
    path.CurveTo(0.25*w, 1.05*h, 0.25*w, 1.05*h, 0, 0.85*h);
    path.Close();
  }
  Anchors(w, h);
}

/// A connector (junction) circle, for continuing a flow on another page or spot; label it A, B, ...
/// @component
/// @font font
/// @choices fillStyle solid hachure crosshatch
/// @choices sloppiness none casual sketch xkcd
module Junction(w=10mm, h=10mm, fill="#ccccfb", color="black", width=0.5mm,
            label="A", font="CMU Serif", fontSize=3.5mm,
            fillStyle: types.String = "solid",
            sloppiness: types.String = "none") {
  path.Path() {
    path.Stroke(color, width, sloppiness=sloppiness);
    path.Fill(fill, style=fillStyle, sloppiness=sloppiness);
    path.MoveTo(w/2, 0);
    path.CurveTo(w/2 + 0.5523*w/2, 0, w, h/2 - 0.5523*h/2, w, h/2);
    path.CurveTo(w, h/2 + 0.5523*h/2, w/2 + 0.5523*w/2, h, w/2, h);
    path.CurveTo(w/2 - 0.5523*w/2, h, 0, h/2 + 0.5523*h/2, 0, h/2);
    path.CurveTo(0, h/2 - 0.5523*h/2, w/2 - 0.5523*w/2, 0, w/2, 0);
    path.Close();
  }
  Caption(w, h, label, font, fontSize, color);
  path.ConnectionSurface() {
    path.MoveTo(w/2, 0);
    path.CurveTo(w/2 + 0.5523*w/2, 0, w, h/2 - 0.5523*h/2, w, h/2);
    path.CurveTo(w, h/2 + 0.5523*h/2, w/2 + 0.5523*w/2, h, w/2, h);
    path.CurveTo(w/2 - 0.5523*w/2, h, 0, h/2 + 0.5523*h/2, 0, h/2);
    path.CurveTo(0, h/2 - 0.5523*h/2, w/2 - 0.5523*w/2, 0, w/2, 0);
    path.Close();
  }
  Anchors(w, h);
}

/// A flow line between symbols, with an arrowhead at its end; use the elbow route for right-angle flows.
/// @component
/// @choices start none arrow bar dot triangle
/// @choices end none arrow bar dot triangle
/// @choices route straight catmull-rom hyperbezier elbow
/// @choices startDir auto n e s w
/// @choices endDir auto n e s w
/// @choices sloppiness none casual sketch xkcd
module Flow(points=[path.Point(0mm, 0mm), path.Point(0mm, 15mm)],
            start: types.String = "none", end: types.String = "arrow",
            route: types.String = "elbow",
            startDir: types.String = "auto", endDir: types.String = "auto",
            color="black", width=0.5mm,
            sloppiness: types.String = "none") {
  path.Connector(points, start=start, end=end, route=route,
                 startDir=startDir, endDir=endDir) {
    path.Stroke(color, width, cap="round", join="round", sloppiness=sloppiness);
  }
}
