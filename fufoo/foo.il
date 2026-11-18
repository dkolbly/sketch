package fufoo;

import (
   "gitlab.com/donovan4/fufoo/sys/illus/std/path"
   "gitlab.com/donovan4/fufoo/sys/illus/std/style"
   "gitlab.com/donovan4/fufoo/sys/illus/std/text"
   "gitlab.com/donovan4/fufoo/sys/fu/std/types"
   "shapes/v2"
)

/// An immutable, content-addressed blob: a cube.  The label is on the
/// front face; an optional ptr (say 3f9a...) is drawn small under it.
/// @component
/// @choices sloppiness none casual sketch xkcd
/// @basic label
module Blob(w=22mm, h=22mm, label="", ptr: types.String = "",
             stroke: style.Stroke = style.Stroke(color="black", width=0.5mm, style="solid"),
             fill: style.Fill = style.Fill(color="#d6e6f5", style="solid"),
             sloppiness: types.String = "none",
             font: style.Font = style.Font(family="CMU Serif", size=3.5mm, weight=400,
                                           style="normal", line_spacing=1.2, letter_spacing=0),
             para: style.Paragraph = style.Paragraph(align="center", valign="middle")) {
  d = fmin(w, h) * 0.25;
  // top face, side face, front face
  path.Path() {
    style.Pen(stroke, sloppiness, round=true);
    path.Fill(path.BlendColor(fill.color, "white", 0.55), sloppiness=sloppiness);
    path.MoveTo(0, d);
    path.LineTo(d, 0);
    path.LineTo(w, 0);
    path.LineTo(w - d, d);
    path.Close();
  }
  path.Path() {
    style.Pen(stroke, sloppiness, round=true);
    path.Fill(path.BlendColor(fill.color, "black", 0.18), sloppiness=sloppiness);
    path.MoveTo(w - d, d);
    path.LineTo(w, 0);
    path.LineTo(w, h - d);
    path.LineTo(w - d, h);
    path.Close();
  }
  path.Rect(0, d, w - d, h - d) {
    style.Pen(stroke, sloppiness, round=true);
    style.Brush(fill, sloppiness);
  }
  if (ptr == "") {
    v2.Label(label, 0mm, w - d, d, h, font, stroke, para);
  } else {
    small = style.Font(family="CMU Typewriter Text", size=font.size * 0.7, weight=400,
                       style="normal", line_spacing=1.2, letter_spacing=0);
    v2.Label(label, 0mm, w - d, d, h - font.size * 0.8, font, stroke, para);
    v2.Label(ptr, 0mm, w - d, h - font.size * 1.6, h, small, stroke, para);
  }
  path.ConnectionSurface() {
    path.MoveTo(0, d);
    path.LineTo(d, 0);
    path.LineTo(w, 0);
    path.LineTo(w, h - d);
    path.LineTo(w - d, h);
    path.LineTo(0, h);
    path.Close();
  }
  path.Skeleton() {
    path.MoveTo(0, d);
    path.LineTo(d, 0);
    path.LineTo(w, 0);
    path.LineTo(w, h - d);
    path.LineTo(w - d, h);
    path.LineTo(0, h);
    path.Close();
    path.MoveTo(0, d);
    path.LineTo(w - d, d);
    path.LineTo(w, 0);
    path.MoveTo(w - d, d);
    path.LineTo(w - d, h);
  }
  path.ConnectionPoint(w/2 + d/2, 0, name="n", normal=[0, -1]);
  path.ConnectionPoint(w, (h - d)/2, name="e", normal=[1, 0]);
  path.ConnectionPoint((w - d)/2, h, name="s", normal=[0, 1]);
  path.ConnectionPoint(0, (h + d)/2, name="w", normal=[-1, 0]);
}

/// A named mutable slot holding a Ptr: a pill with the label on the left
/// and a socket dot at the right.  The ptr anchor sits at the dot.
/// @component
/// @choices sloppiness none casual sketch xkcd
/// @basic label
module Observable(w=32mm, h=12mm, label="",
             stroke: style.Stroke = style.Stroke(color="black", width=0.5mm, style="solid"),
             fill: style.Fill = style.Fill(color="#d6e6f5", style="solid"),
             sloppiness: types.String = "none",
             font: style.Font = style.Font(family="CMU Typewriter Text", size=3.5mm, weight=400,
                                           style="normal", line_spacing=1.2, letter_spacing=0),
             para: style.Paragraph = style.Paragraph(align="center", valign="middle")) {
  path.Rect(0, 0, w, h, r=h/2) {
    style.Pen(stroke, sloppiness);
    style.Brush(fill, sloppiness);
  }
  cx = w - h/2;
  path.Ellipse(cx, h/2, r=h * 0.27) {
    path.Stroke(stroke.color, 0.35mm);
    path.Fill(path.BlendColor(fill.color, "white", 0.7));
  }
  path.Ellipse(cx, h/2, r=h * 0.12) {
    path.Fill(stroke.color);
  }
  v2.Label(label, 0mm, w - h * 0.8, 0mm, h, font, stroke, para);
  path.ConnectionSurface() {
    RoundOutline(w, h, h/2);
  }
  Anchors(w, h);
  path.ConnectionPoint(cx, h/2, name="ptr", normal=[1, 0]);
}

/// A group of observables owned by a state node: a large dashed, lightly
/// filled region with a title tab, meant to sit behind what it contains.
/// @component
/// @choices sloppiness none casual sketch xkcd
/// @basic label
module Domain(w=90mm, h=60mm, label="domain",
             stroke: style.Stroke = style.Stroke(color="black", width=0.5mm, style="dashed"),
             fill: style.Fill = style.Fill(color="#eef4fa", style="solid"),
             sloppiness: types.String = "none",
             font: style.Font = style.Font(family="CMU Typewriter Text", size=3.5mm, weight=400,
                                           style="normal", line_spacing=1.2, letter_spacing=0),
             para: style.Paragraph = style.Paragraph(align="center", valign="middle")) {
  r = fmin(3mm, fmin(w, h) * 0.2);
  box = text.TypesetBox(label == "" ? "x" : label) { style.UseFont(font); };
  tw = fmin(w * 0.8, path.Width(box) * 1mm + font.size * 2);
  th = font.size * 2;
  // the frame is square at the top-left, where the tab sits
  path.Path() {
    style.Brush(fill, sloppiness);
    TabFrame(w, h, r);
  }
  if (label != "") {
    path.Path() {
      path.Fill(path.BlendColor(fill.color, "#6a9bd0", 0.3), sloppiness=sloppiness);
      path.MoveTo(0, 0);
      path.LineTo(tw, 0);
      path.LineTo(tw, th - r);
      path.ArcTo(tw - r, th, radius=r, negative=true);
      path.LineTo(0, th);
      path.Close();
    }
  }
  path.Path() {
    style.Pen(stroke, sloppiness);
    TabFrame(w, h, r);
  }
  if (label != "") {
    // the tab's inner edge, solid; its top and left edges are the frame's
    path.Path() {
      path.Stroke(stroke.color, stroke.width, sloppiness=sloppiness);
      path.MoveTo(tw, 0);
      path.LineTo(tw, th - r);
      path.ArcTo(tw - r, th, radius=r, negative=true);
      path.LineTo(0, th);
    }
    v2.Label(label, 0mm, tw, 0mm, th, font, stroke, para);
  }
  path.ConnectionSurface() {
    TabFrame(w, h, r);
  }
  Anchors(w, h);
}
